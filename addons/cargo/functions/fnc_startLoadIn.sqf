#include "script_component.hpp"
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

params ["_player", "_object", ["_cargoVehicle", objNull]];
TRACE_3("params",_player,_object,_cargoVehicle);

private _vehicle = _cargoVehicle;
if (isNull _vehicle) then {
    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitWith {_vehicle = _x};
    } forEach (nearestObjects [_player, GVAR(cargoHolderTypes), (MAX_LOAD_DISTANCE + 10)]);
};

if (isNull _vehicle) exitWith {
    TRACE_3("Could not find vehicle",_player,_object,_vehicle);
    false
};

private _return = false;
// Start progress bar
if ([_object, _vehicle] call FUNC(canLoadItemIn)) then {
    [_player, _object, true] call EFUNC(common,claim);
    private _size = [_object] call FUNC(getSizeItem);

    [
        GVAR(loadTimeCoefficient) * _size,
        [_object, _vehicle],
        {
            [objNull, _this select 0 select 0, true] call EFUNC(common,claim);
            ["ace_loadCargo", _this select 0] call CBA_fnc_localEvent;
        },
        {[objNull, _this select 0 select 0, true] call EFUNC(common,claim)},
        localize LSTRING(LoadingItem),
        {true},
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
    _return = true;
} else {
    private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");

    [[LSTRING(LoadingFailed), _displayName], 3] call EFUNC(common,displayTextStructured);
};

_return
