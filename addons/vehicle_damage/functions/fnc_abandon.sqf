#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Forces the AI currently in a vehicle to bail out.
 *
 * Arguments:
 * 0: The vehicle in which to bail out <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank2] call ace_vehicle_damage_fnc_abandon;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_2("abandon",_vehicle,(crew _vehicle) select {alive _x});

[{
    params ["_vehicle"];
    _vehicle allowCrewInImmobile false;

    private _center = getPosASL _vehicle;
    TRACE_2("bailing out crew after delay",_vehicle,_center);
    {
        [QGVAR(bailOut), [_center, _x, _vehicle], _x] call CBA_fnc_targetEvent;
    } forEach crew _vehicle;
}, _this, random MAX_CREW_BAILOUT_TIME] call CBA_fnc_waitAndExecute;
