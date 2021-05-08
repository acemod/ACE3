#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Returns plug to launcher suitcase
 *
 * Arguments:
 * 0: Plug <OBJECT>
 * 1: Suitcase <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_returnPlug
 *
 * Public: No
 */
params ["_plug", "_suitcase"];

deleteVehicle _plug;

private _rope = _suitcase getVariable QGVAR(plugRope);
ropeDestroy _rope;

_suitcase setVariable [QGVAR(plugTaken), false, true];
_suitcase setVariable [QGVAR(plugRope), objNull, true];
_suitcase setVariable [QGVAR(plugHeader), objNull, true];

