/*
 * Author: Glowbal
 * Start load item.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Object <OBJECT>
 * 2: Vehicle <OBJECT> (Optional)
 *
 * Return Value:
 * Load ProgressBar Started <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_cargo_fnc_startLoadIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_object", ["_cargoVehicle", objNull]];
TRACE_3("params",_player,_object,_cargoVehicle);

private _vehicle = _cargoVehicle;
if (isNull _vehicle) then {
    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitWith {_vehicle = _x};
    } forEach (nearestObjects [_player, CARGO_VEHICLE_CLASSES, MAX_LOAD_DISTANCE]);
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
        {["ace_loadCargo", _this select 0] call CBA_fnc_localEvent},
        {},
        localize LSTRING(LoadingItem)
    ] call EFUNC(common,progressBar);
    _return = true;
} else {
    private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");

    [[LSTRING(LoadingFailed), _displayName], 3.0] call EFUNC(common,displayTextStructured);
};

_return
