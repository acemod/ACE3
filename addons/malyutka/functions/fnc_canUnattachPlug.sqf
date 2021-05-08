#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Whether or not we can unattach the plug from the control box
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_canUnattachPlug
 *
 * Public: No
 */
params ["", "_plug"];
(_plug getVariable QGVAR(attachedControlBox)) isNotEqualTo objNull

