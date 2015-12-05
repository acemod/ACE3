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
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

if (_unit == vehicle _unit) exitWith {true};

private "_config";
_config = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;

isClass _config
&& {getNumber (_config >> "canPullTrigger") == 1}
