#include "../../script_component.hpp"

/*
* Author: Zorn
* This function sets the data-index for a magID
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_magID",  "", [""] ],
    ["_index",  0,  [0]  ]
];

if (_index == -1) exitWith {};

ace_intelItems_intelMap setVariable [_magID, _index, true];