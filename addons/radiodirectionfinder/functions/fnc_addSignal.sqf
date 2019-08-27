#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 *
 * Arguments:
 * 0:
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_radiodirectionfinder_fnc_addSignal
 *
 * Public: No
 */

if (!isServer) exitWith {};

params [["_object", objNull, [objNull, []]], ["_freqMHz", 0, [0]], ["_powerMW", 0, [0]]];
TRACE_3("addSignal",_object,_freqMHz,_powerMW);

private _list = missionNamespace getVariable [QGVAR(signalList), []];
_list pushBack [_object, _freqMHz, _powerMW];
missionNamespace setVariable [QGVAR(signalList), _list, true];
