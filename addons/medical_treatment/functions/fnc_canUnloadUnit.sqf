#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Checks if unit can be unloaded.
 *
 * Arguments:
 * 0: Unloader <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can Unload <BOOL>
 *
 * Example:
 * [player, bob] call ace_medical_treatment_fnc_canUnloadUnit
 *
 * Public: No
 */

params ["_unloader", "_target"];

!isNull objectParent _target &&
{!(lifeState _target in ["HEALTHY", "INJURED"])}
