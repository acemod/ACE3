/*
 * Author: commy2
 * Check if the unit can use a Weapon.
 * Returns true if the unit is on foot or in a FFV position.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Can the Unit use Weapons <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_config"];

params ["_unit"];

if (_unit == vehicle _unit) exitWith {true};

_config = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;

isClass _config
&& {getNumber (_config >> "canPullTrigger") == 1}
