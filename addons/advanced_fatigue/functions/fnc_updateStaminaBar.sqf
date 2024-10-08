#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the stamina bar state
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_fatigue_fnc_updateStaminaBar
 *
 * Public: No
 */

GVAR(enableStaminaBarRealized) = GVAR(enabled) && GVAR(enableStaminaBar) && {!(missionNamespace getVariable [QEGVAR(ui,hideHud), false])};
TRACE_1("updateStaminaBar",GVAR(enableStaminaBarRealized));

private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
if (isNull _staminaBarContainer) exitWith {};

_staminaBarContainer ctrlSetFade ([1, 0] select GVAR(enableStaminaBarRealized));
_staminaBarContainer ctrlCommit 0;
