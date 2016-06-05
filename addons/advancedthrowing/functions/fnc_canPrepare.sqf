/*
 * Author: Jonpas
 * Checks if a throwable can be prepared.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Prepare <BOOL>
 *
 * Example:
 * [unit] call ace_advancedthrowing_fnc_canPrepare
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(enabled) &&
{!(call EFUNC(common,isFeatureCameraActive))} &&
{[_unit, objNull, ["isNotInside", "isNotSitting", "isNotOnLadder"]] call EFUNC(common,canInteractWith)} &&
{_unit call CBA_fnc_canUseWeapon} // Disable in non-FFV seats due to surface detection issues
