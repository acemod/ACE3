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

private ["_nearestVehicle"];
_nearestVehicle = [_player] call FUNC(findNearestVehicle);

if (isNull _nearestVehicle || _nearestVehicle isKindOf "Cargo_Base_F") then {
    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitWith {_nearestVehicle = _x};
    } foreach (nearestObjects [_player, ["Cargo_base_F", "Land_PaperBox_closed_F"], MAX_LOAD_DISTANCE]);
};

if (isNull _nearestVehicle) exitWith {false};

[_object, _nearestVehicle] call FUNC(loadItem)
