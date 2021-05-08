#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Whether or not we can attach the plug to a control box
 *
 * Arguments:
 * 0: Suitcase <OBJECT>
 * 1: Control Box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_canAttachPlug
 *
 * Public: No
 */
params ["_suitcase", "_controlBox"];
private _statuses = _controlBox getVariable QGVAR(plugStatus);
// if we have a single available plug, we can attach
(_statuses findIf { _x isEqualTo objNull }) >= 0

