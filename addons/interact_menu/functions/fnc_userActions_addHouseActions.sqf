/*
 * Author: PabstMirror
 * Scans for nearby "Static" objects (buildings) and adds the UserActions to them.
 * Called when interact_menu starts rendering (from "interact_keyDown" event)
 *
 * Arguments:
 * 0: Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [0] call ace_interact_menu_fnc_addHouseActions
 *
 * Public: Yes
 */
#include "script_component.hpp"

PARAMS_1(_interactionType);

//Ignore self-interaction menu:
if (_interactionType != 0) exitWith {};
//Ignore when mounted:
if ((vehicle ACE_player) != ACE_player) exitWith {};

systemChat format ["starting %1", diag_tickTime];

[{
    private["_helperObject", "_helperPos", "_houseWasScaned", "_nearBuidlings", "_theHouse"];
    PARAMS_2(_args,_pfID);
    EXPLODE_4_PVT(_args,_setPosition,_addedHelpers,_housesScaned,_houseBeingScaned);

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x;} forEach _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) < 5) exitWith {};

        //Make the common case fast (cursorTarget is looking at a door):
        if ((!isNull cursorTarget) && {cursorTarget isKindOf "Static"} && {!(cursorTarget in _housesScaned)}) then {
            _housesScaned pushBack cursorTarget;
            if (((count (configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "UserActions")) > 0) || {(count (getArray (configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "ladders"))) > 0}) then {
                _houseBeingScaned = cursorTarget;
            };
        };

        if (isNull _houseBeingScaned) then {
            _houseWasScaned = false;
            _nearBuidlings = nearestObjects [ace_player, ["Static"], 30];
            {
                _theHouse = _x;
                if (!(_theHouse in _housesScaned)) exitWith {
                    _houseWasScaned = true;
                    _housesScaned pushBack _x;
                    if ((typeOf _theHouse) != "") then {
                        if (((count (configFile >> "CfgVehicles" >> (typeOf _theHouse) >> "UserActions")) > 0) || {(count (getArray (configFile >> "CfgVehicles" >> (typeOf _theHouse) >> "ladders"))) > 0}) then {
                            _args set [3, _theHouse];
                        };
                    };
                };
                // Need to scan fairly far, because houses are big. You can be 25m from center of building but right next to a door.
            } forEach _nearBuidlings;

            //If we finished scanning everything, update position
            if (!_houseWasScaned) then {
                systemChat format ["Pos Updated (stable): %1 [count %2]", diag_tickTime, (count _addedHelpers)];
                _args set [0, (getPosASL ace_player)];
            };
        } else {
            _actionSet = [(typeOf _houseBeingScaned)] call FUNC(userActions_getHouseActions);
            EXPLODE_2_PVT(_actionSet,_memPoints,_memPointsActions);

            // systemChat format ["Add Actions for [%1] (%2)", _houseBeingScaned, (count _memPoints)];
            {
                _helperObject = "Sign_Sphere25cm_F" createVehicleLocal (getpos _houseBeingScaned);
                _addedHelpers pushBack _helperObject;

                _helperObject setVariable [QGVAR(building), _houseBeingScaned];

                //ASL/ATL bullshit (note: attachTo doesn't work on buildings)
                _helperPos = _houseBeingScaned modelToWorld (_houseBeingScaned selectionPosition _x);
                _helperObject setPosASL (_helperPos call EFUNC(common,positionToASL));

                _helperObject hideObject true;
                TRACE_3("Making New Helper",_helperObject,_x,_houseBeingScaned);
                {
                    [_helperObject, 0, [], _x] call EFUNC(interact_menu,addActionToObject);
                } forEach (_memPointsActions select _forEachIndex);

            } forEach _memPoints;

            _args set [3, objNull];
        };
    };
}, 0, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], [], objNull]] call CBA_fnc_addPerFrameHandler;
