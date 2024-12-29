#include "../script_component.hpp"

/*
* Author: Zorn
* Function to compare the components of the current and target wearables.
*
* Arguments:
*
* Return Value:
* Nested Array - [[missing components], [surplus components]]
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_cfg_origin", "_cfg_tgt"];

private _current = getArray (_cfg_origin >> QPVAR(wardrobe) >> "components");
private _needed  = getArray (_cfg_tgt    >> QPVAR(wardrobe) >> "components");

private _missing = []; 

{ if (_x in _current) then { _current = _current - [_x] } else { _missing pushBack _x }; } forEach _needed;

//[[missing components], [surplus components]]
[_missing, _current]