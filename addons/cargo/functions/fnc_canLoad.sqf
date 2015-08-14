/*
 * Author: Glowbal
 * Check if player can load item into the nearest vehicle
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Object to load <OBJECT>
 *
 * Return value:
 * Can load <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_player", "_object"];

private ["_nearestVehicle"];
_nearestVehicle = [_player] call FUNC(findNearestVehicle);

if (_nearestVehicle isKindOf "Cargo_Base_F" || isNull _nearestVehicle) then {

    {
        if ([_object, _x] call FUNC(canLoadItemIn)) exitwith {_nearestVehicle = _x};
    }foreach (nearestObjects [_player, ["Cargo_base_F"], MAX_LOAD_DISTANCE]);
};

if (isNull _nearestVehicle) exitwith {false};

[_object, _nearestVehicle] call FUNC(canLoadItemIn);
