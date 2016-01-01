/*
 * Author: Glowbal
 * Start load item.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * Object loaded <BOOL>
 *
 * Example:
 * [object] call ace_cargo_fnc_starLoadIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_object"];
private ["_vehicle", "_size", "_displayName"];

_vehicle = [_player] call FUNC(findNearestVehicle);

if (isNull _vehicle || _vehicle isKindOf "Cargo_Base_F") then {
    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitWith {_vehicle = _x};
    } forEach (nearestObjects [_player, ["Cargo_base_F", "Land_PaperBox_closed_F"], MAX_LOAD_DISTANCE]);
};

if (isNull _vehicle) exitWith {false};

// Start progress bar
if ([_object, _vehicle] call FUNC(canLoadItemIn)) then {
    _size = [_object] call FUNC(getSizeItem);

    [5 * _size, [_object,_vehicle], "LoadCargo", {}, localize LSTRING(LoadingItem)] call EFUNC(common,progressBar);
} else {
    _displayName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");

    ["displayTextStructured", [[LSTRING(LoadingFailed), _displayName], 3.0]] call EFUNC(common,localEvent);
};
