#include "..\script_component.hpp"
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
if (!isNull objectParent ACE_player) exitWith {};

[{
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedHelpers", "_housesScanned", "_housesToScanForActions"];

    if (!EGVAR(interact_menu,keyDown)) then {
        deleteVehicle _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ACE_player) exitWith {};

        //Make the common case fast (cursorTarget is looking at a door):
        if ((!isNull cursorTarget) && {cursorTarget isKindOf "Static"} && {!(cursorTarget in _housesScanned)}) then {
            if (((count (configOf cursorTarget >> "UserActions")) > 0) || {(getArray (configOf cursorTarget >> "ladders")) isNotEqualTo []}) then {
                _housesToScanForActions = [cursorTarget];
            } else {
                _housesScanned pushBack cursorTarget;
            };
        };

        //For performance, we only do 1 thing per frame,
        //-either do a wide scan and search for houses with actions
        //-or scan one house at a time and add the actions for that house

        if (_housesToScanForActions isEqualTo []) then {
            //If player moved >2 meters from last pos, then rescan
            if (((getPosASL ACE_player) distance _setPosition) < 2) exitWith {};

            private _nearBuidlings = nearestObjects [ACE_player, ["Static"], 30];
            {
                private _configOfHouse = configOf _x;
                if (((count (_configOfHouse >> "UserActions")) == 0) && {(getArray (_configOfHouse >> "ladders")) isEqualTo []}) then {
                    _housesScanned pushBack _x;
                } else {
                    _housesToScanForActions pushBack _x;
                };
            } forEach (_nearBuidlings - _housesScanned);

            _args set [0, (getPosASL ACE_player)];
        } else {
            private _houseBeingScanned = _housesToScanForActions deleteAt 0;
            //Skip this house for now if we are outside of it's radius
            //(we have to scan far out for the big houses, but we don't want to waste time adding actions on every little shack)
            if ((_houseBeingScanned != cursorTarget) && {((ACE_player distance _houseBeingScanned) - ((boundingBoxReal _houseBeingScanned) select 2)) > 4}) exitWith {};

            _housesScanned pushBack _houseBeingScanned;

            private _actionSet = [typeOf _houseBeingScanned] call FUNC(userActions_getHouseActions);
            _actionSet params ["_memPoints", "_memPointsActions"];

            TRACE_3("Add Actions for [%1] (count %2) @ %3",typeOf _houseBeingScanned,(count _memPoints),diag_tickTime);
            {
                private _helperPos = _houseBeingScanned modelToWorldWorld (_houseBeingScanned selectionPosition _x);
                private _helperObject = "ACE_LogicDummy" createVehicleLocal [0,0,0];
                _addedHelpers pushBack _helperObject;
                _helperObject setVariable [QGVAR(building), _houseBeingScanned];
                _helperObject setPosASL _helperPos;
                TRACE_3("Making New Helper",_helperObject,_x,_houseBeingScanned);

                {
                    [_helperObject, 0, [], _x] call EFUNC(interact_menu,addActionToObject);
                } forEach (_memPointsActions select _forEachIndex);
            } forEach _memPoints;
        };
    };
}, 0, [((getPosASL ACE_player) vectorAdd [-100,0,0]), [], [], []]] call CBA_fnc_addPerFrameHandler;
