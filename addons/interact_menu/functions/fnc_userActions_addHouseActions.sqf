#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Scans for nearby "Static" objects (buildings) and adds the UserActions to them.
 * Called when interact_menu starts rendering (from "interactMenuOpened" event)
 *
 * Arguments:
 * 0: Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_interact_menu_fnc_userActions_addHouseActions
 *
 * Public: No
 */

params ["_interactionType"];

//Ignore if not enabled:
if (!GVAR(addBuildingActions)) exitWith {};
//Ignore self-interaction menu:
if (_interactionType != 0) exitWith {};
//Ignore when mounted:
if ((vehicle ACE_player) != ACE_player) exitWith {};

[{
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedHelpers", "_housesScaned", "_housesToScanForActions"];

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x;} forEach _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //Make the common case fast (cursorTarget is looking at a door):
        if ((!isNull cursorTarget) && {cursorTarget isKindOf "Static"} && {!(cursorTarget in _housesScaned)}) then {
            if (((count (configOf cursorTarget >> "UserActions")) > 0) || {(count (getArray (configOf cursorTarget >> "ladders"))) > 0}) then {
                _housesToScanForActions = [cursorTarget];
            } else {
                _housesScaned pushBack cursorTarget;
            };
        };

        //For performance, we only do 1 thing per frame,
        //-either do a wide scan and search for houses with actions
        //-or scan one house at a time and add the actions for that house

        if (_housesToScanForActions isEqualTo []) then {
            //If player moved >2 meters from last pos, then rescan
            if (((getPosASL ace_player) distance _setPosition) < 2) exitWith {};

            private _nearBuidlings = nearestObjects [ace_player, ["Static"], 30];
            {
                private _typeOfHouse = typeOf _x;
                if (((count (configFile >> "CfgVehicles" >> _typeOfHouse >> "UserActions")) == 0) && {(count (getArray (configFile >> "CfgVehicles" >> _typeOfHouse >> "ladders"))) == 0}) then {
                    _housesScaned pushBack _x;
                } else {
                    _housesToScanForActions pushBack _x;
                };
                nil
            } count (_nearBuidlings - _housesScaned);

            _args set [0, (getPosASL ace_player)];
        } else {
            _houseBeingScaned = _housesToScanForActions deleteAt 0;
            private _typeOfHouse = typeOf _houseBeingScaned;
            //Skip this house for now if we are outside of it's radius
            //(we have to scan far out for the big houses, but we don't want to waste time adding actions on every little shack)
            if ((_houseBeingScaned != cursorTarget) && {((ACE_player distance _houseBeingScaned) - ((sizeOf _typeOfHouse) / 2)) > 4}) exitWith {};

            _housesScaned pushBack _houseBeingScaned;

            private _actionSet = [_typeOfHouse] call FUNC(userActions_getHouseActions);
            _actionSet params ["_memPoints", "_memPointsActions"];

            // systemChat format ["Add Actions for [%1] (count %2) @ %3", _typeOfHouse, (count _memPoints), diag_tickTime];
            {
                private _helperPos = _houseBeingScaned modelToWorldWorld (_houseBeingScaned selectionPosition _x);
                private _helperObject = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                _addedHelpers pushBack _helperObject;
                _helperObject setVariable [QGVAR(building), _houseBeingScaned];
                _helperObject setPosASL _helperPos;
                TRACE_3("Making New Helper",_helperObject,_x,_houseBeingScaned);

                {
                    [_helperObject, 0, [], _x] call EFUNC(interact_menu,addActionToObject);
                    nil
                } count (_memPointsActions select _forEachIndex);

            } forEach _memPoints;
        };
    };
}, 0, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], [], []]] call CBA_fnc_addPerFrameHandler;
