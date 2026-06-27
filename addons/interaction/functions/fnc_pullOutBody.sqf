#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Makes unit pull target body out of vehicle.
 *
 * Arguments:
 * 0: Body <OBJECT>
 * 1: Unit (not used) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crew cursorObject select 0, player] call ace_interaction_fnc_pullOutBody
 *
 * Public: No
 */

params ["_body", "_unit"];

moveOut _body;
