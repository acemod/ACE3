#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Whether or not we can pickup the plug from the ground
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Plug <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_canPickupPlug
 *
 * Public: No
 */
params ["", "_plug"];
(objNull isEqualTo attachedTo _plug) && { (_plug getVariable QGVAR(attachedControlBox)) isEqualTo objNull }

