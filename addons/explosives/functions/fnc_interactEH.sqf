/*
 * Author: PabstMirror
 * When interact_menu starts rendering (from "interact_keyDown" event)
 * Add defuse helpers to all nearby mines
 *
 * Arguments:
 * Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0] call ace_explosives_fnc_interactEH
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_interactionType"];
TRACE_1("params",_interactionType);

//Ignore self-interaction menu
if (_interactionType != 0) exitWith {};
//Ignore while mounted:
if ((vehicle ACE_player) != ACE_player) exitWith {};
//Ignore if we don't have defuse kit
if (!("ACE_DefusalKit" in (items ACE_player))) exitWith {};

[{
    params ["_args", "_pfID"];
    _args params ["_setPosition", "_addedDefuseHelpers", "_minesHelped"];

    if (!EGVAR(interact_menu,keyDown)) then {
        TRACE_1("Cleaning Defuse Helpers",(count _addedDefuseHelpers));
        {deleteVehicle _x;} forEach _addedDefuseHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) > 5) then {
            {
                if (((_x distance ACE_player) < 15) && {!(_x in _minesHelped)} && {(getModelInfo _x) select 0 != "empty.p3d"}) then {

                    private _config = configFile >> "CfgAmmo" >> typeOf _x;
                    private _size = getNumber (_config >> QGVAR(size));
                    TRACE_3("Making Defuse Helper",(_x),(typeOf _x),(_size == 1));
                    private _defuseHelper = objNull;
                    if (_size == 1) then {
                        _defuseHelper = "ACE_DefuseObject_Large" createVehicleLocal (getPos _x);
                    } else {
                        _defuseHelper = "ACE_DefuseObject" createVehicleLocal (getPos _x);
                    };

                    private _defuseObjectPosition = getArray (_config >> QGVAR(defuseObjectPosition));
                    if (_defuseObjectPosition isEqualTo []) then {
                        _defuseObjectPosition = [0,0,0];
                    };

                    TRACE_1("DefuseObjectPosition",(_defuseObjectPosition));

                    _defuseHelper attachTo [_x, _defuseObjectPosition];
                    _defuseHelper setVariable [QGVAR(Explosive),_x];
                    _addedDefuseHelpers pushBack _defuseHelper;
                    _minesHelped pushBack _x;
                };
            } forEach allMines;
            _args set [0, (getPosASL ace_player)];
        };
    };
}, 0.5, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], []]] call CBA_fnc_addPerFrameHandler;
