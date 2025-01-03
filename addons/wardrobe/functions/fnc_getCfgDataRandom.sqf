#include "../script_component.hpp"

/*
* Author: Zorn
* This function extracts data from a config property. If it is an Array, it will select a random entry from the array, otherwise it will simply return the provided data.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call cigs_wardrobe_fnc_getCfgDataRandom
*
* Public: No
*/

params [
    [ "_cfg", configNull, [configNull] ]
];

if (_cfg isEqualTo configNull) exitWith {nil};
private _data = [_cfg] call BIS_fnc_getCfgData;
if (_data isEqualType []) then { _data = selectRandom _data };
_data