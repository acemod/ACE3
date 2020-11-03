#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Statement to sort items by their protection (combination of ballistic and explosive).
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 * 1: Ballistic (passthrough) coefficent <NUMBER>
 * 2: Explosive (armor) coefficent <NUMBER>
 *
 * Return Value:
 * Sorting Value <NUMBER>
 *
 * Public: No
*/

params ["_itemCfg", "_ballisticCo", "_explosiveCo"];

(([[_itemCfg], ["passthrough", "armor"]] call BIS_fnc_configExtremes) select 1) params [["_passthroughMax", 0], ["_armorMax", 0]];

private _protectionCombined = _passthroughMax * _ballisticCo + _armorMax * _explosiveCo;

_protectionCombined
