/*
 * Author: Glowbal
 * Start load item.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Object <OBJECT>
 *
 * Return value:
 * Load ProgressBar Started <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_cargo_fnc_startLoadIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_object"];
TRACE_2("params",_player,_object);

private _vehicle = [_player] call FUNC(findNearestVehicle);

if ((isNull _vehicle) || {_vehicle isKindOf "Cargo_Base_F"}) then {
    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitWith {_vehicle = _x};
    } forEach (nearestObjects [_player, ["Cargo_base_F", "Land_PaperBox_closed_F"], MAX_LOAD_DISTANCE]);
};

if (isNull _vehicle) exitWith {
    TRACE_3("Could not find vehicle",_player,_object,_vehicle);
    false
};

private _return = false;
// Start progress bar
if ([_object, _vehicle] call FUNC(canLoadItemIn)) then {
    private _size = [_object] call FUNC(getSizeItem);

    [
        5 * _size,
        [_object,_vehicle],
        {["LoadCargo", _this select 0] call EFUNC(common,localEvent)},
        {},
        localize LSTRING(LoadingItem)
    ] call EFUNC(common,progressBar);
    _return = true;
} else {
    private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");

    ["displayTextStructured", [[LSTRING(LoadingFailed), _displayName], 3.0]] call EFUNC(common,localEvent);
};

_return
