#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles beacon init and adds to signal list globally (Server Only)
 *
 * Arguments:
 * 0: Beacon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [x] call ace_radiodirectionfinder_fnc_beaconInitServer
 *
 * Public: No
 */

params ["_beacon"];

if (!alive _beacon) exitWith { TRACE_1("beaconInit - not dead",_this); };

private _typeOf = typeOf _beacon;
private _freqMHz = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(freq));
private _powerMW = getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(power));
TRACE_4("beaconInitServer",_beacon,_typeOf,_freqMHz,_powerMW);

[_beacon, _freqMHz, _powerMW] call FUNC(addSignal);
_beacon addEventHandler ["Killed", {call FUNC(beaconCleanupServer)}];
_beacon addEventHandler ["Deleted", {call FUNC(beaconCleanupServer)}];
