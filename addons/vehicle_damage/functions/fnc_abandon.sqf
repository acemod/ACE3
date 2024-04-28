#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Forces the AI currently in a vehicle to bail out.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_vehicle_damage_fnc_abandon;
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable [QGVAR(allowCrewInImmobile), false]) exitWith {}; // check for API

TRACE_2("abandon",_vehicle,crew _vehicle);

[{
    params ["_vehicle"];

    _vehicle allowCrewInImmobile false;

    TRACE_1("bailing out crew after delay",_vehicle);

    {
        [QGVAR(bailOut), [_vehicle, _x], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
}, _vehicle, random MAX_CREW_BAILOUT_TIME] call CBA_fnc_waitAndExecute;
