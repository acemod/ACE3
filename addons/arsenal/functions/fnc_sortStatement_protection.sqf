#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Statement to sort items by their protection (combonation of ballistic and explosive).
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER>
 *
 * Public: No
*/

params ["_config"];

private _stats = [[_config], ["passthrough", "armor"]] call BIS_fnc_configExtremes;
private _passthroughMax = _stats # 1 # 0; // ballistic
private _armorMax = _stats # 1 # 1; // explosive

private _protectionCombined = _passthroughMax * 200000 + _armorMax * 100000;

_protectionCombined
