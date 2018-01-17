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
 * [unit] call ace_advanced_throwing_fnc_canPrepare
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(enabled) &&

#ifndef DEBUG_MODE_FULL
{_unit getVariable [QGVAR(lastThrownTime), CBA_missionTime - 3] < CBA_missionTime - 2} && // Prevent throwing in quick succession
#else
{true} &&
#endif

{!(call EFUNC(common,isFeatureCameraActive))} &&
{!EGVAR(common,isReloading)} &&
{[_unit, objNull, ["isNotInside", "isNotSitting"/*, "isNotOnLadder"*/]] call EFUNC(common,canInteractWith)} && // Ladder needs positioning fixes on throw
{_unit call CBA_fnc_canUseWeapon} // Disable in non-FFV seats due to surface detection issues
