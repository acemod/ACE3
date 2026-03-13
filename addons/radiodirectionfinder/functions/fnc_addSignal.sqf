#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adds a scripted signal (Server only)
 *
 * Arguments:
 * 0: Source <ARRAY>or<OBJECT>
 * 1: Frequency <NUMBER>
 * 2: Power <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 2400, 50] call ace_radiodirectionfinder_fnc_addSignal
 *
 * Public: Yes
 */

if (!isServer) exitWith { WARNING_1("addSignal only has effect when called on server - %1",_this); };

params [["_object", objNull, [objNull, []]], ["_freqMHz", 0, [0]], ["_powerMW", 0, [0]]];
TRACE_3("addSignal",_object,_freqMHz,_powerMW);

private _list = missionNamespace getVariable [QGVAR(signalList), []];
_list pushBack [_object, _freqMHz, _powerMW];
missionNamespace setVariable [QGVAR(signalList), _list, true];
