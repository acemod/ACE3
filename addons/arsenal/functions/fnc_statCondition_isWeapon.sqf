#include "..\script_component.hpp"
/*
 * Author: Alganthe
 * Rate of fire text statement.
 *
 * Arguments:
 * 0: Stats array (not used) <ARRAY>
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statCondition_isWeapon",_config);

(uiNamespace getVariable QGVAR(isWeaponCache)) getOrDefaultCall [_config, {
    (compatibleMagazines (configName _config)) isNotEqualTo []
}, true] // return
