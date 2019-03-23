#include "script_component.hpp"
/*
 * Author: commy2
 * Returns the control of the Stamina Bar from Arma 1.54.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Stamina Bar control <CONTROL>
 *
 * Example:
 * call ace_common_fnc_getStaminaBarControl
 *
 * Public: No
 */

(uiNamespace getVariable [QGVAR(dlgStaminaBar), displayNull]) displayCtrl IDC_STAMINA_BAR
