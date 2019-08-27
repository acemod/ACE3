#include "script_component.hpp"
/*
 * Author: PabstMirror
 * (Server Only)
 *
 * Arguments:
 * 0: Beacon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_beaconInit
 *
 * Public: No
 */

params ["_beacon"];

if (!alive _beacon) exitWith { TRACE_1("dead",_this); };

private _typeOf = typeOf _beacon;
private _freqMHz = getNumber (configFile >> "CfgVehicles" >> QGVAR(freq));
private _powerMW = getNumber (configFile >> "CfgVehicles" >> QGVAR(power));
TRACE_4("beaconInit - new",_beacon,_typeOf,_freqMHz,_powerMW);

[_beacon, 444, 55] call FUNC(addSignal);
_beacon addEventHandler ["Killed", {call FUNC(beaconCleanup)}];
_beacon addEventHandler ["Deleted", {call FUNC(beaconCleanup)}];
