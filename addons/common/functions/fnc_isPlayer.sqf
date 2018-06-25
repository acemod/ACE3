#include "script_component.hpp"
/*
 * Author: bux578, commy2, akalegman
 * Checks if a unit is a player / curator controlled unit.
 * This now includes both local and non-local remote controlled zeus units. (Remotes from another zeus machine)
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 * 1: exclude remote controlled units <BOOL>
 *
 * Return Value:
 * Is unit a player? <BOOL>
 *
 * Example:
 * [cursorTarget, false] call ace_common_fnc_isPlayer;
 *
 * Public: Yes
 */

params ["_unit", ["_excludeRemoteControlled", false]];

(isPlayer _unit) || {(!_excludeRemoteControlled) && {!isNull (_unit getVariable ["bis_fnc_moduleRemoteControl_owner", objNull])}}
