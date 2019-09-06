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

if (!alive _beacon) exitWith { TRACE_1("beaconInit - dead",_this); };

private _typeOf = typeOf _beacon;
private _freqMHz = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(freq));
private _powerMW = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(power));
TRACE_4("beaconInit",_beacon,_typeOf,_freqMHz,_powerMW);

[_beacon, _freqMHz, _powerMW] call FUNC(addSignal);
_beacon addEventHandler ["Killed", {call FUNC(beaconCleanup)}];
_beacon addEventHandler ["Deleted", {call FUNC(beaconCleanup)}];
