/*
 * Author: Jonpas
 * Checks if a throwable can be prepared.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Ignore Last Thrown Time <BOOL> (default: false)
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

params ["_unit", ["_ignoreLastThrownTime", false]];

// Don't delay when picking up
if (_ignoreLastThrownTime) then {
    _unit setVariable [QGVAR(lastThrownTime), -1];
};

GVAR(enabled) &&

#ifdef ALLOW_QUICK_THROW
{true} &&
#else
{_unit getVariable [QGVAR(lastThrownTime), CBA_missionTime - 3] < CBA_missionTime - 2} && // Prevent throwing in quick succession
#endif

{!(call EFUNC(common,isFeatureCameraActive))} &&
{[_unit, objNull, ["isNotInside", "isNotSwimming", "isNotSitting"/*, "isNotOnLadder"*/]] call EFUNC(common,canInteractWith)} && // Ladder needs positioning fixes on throw
{_unit call CBA_fnc_canUseWeapon} && // Disable in non-FFV seats due to surface detection issues
{"" == currentWeapon _unit || {currentWeapon _unit != secondaryWeapon _unit}} &&
{0 >= _unit getVariable [QEGVAR(common,effect_blockThrow), 0]}
