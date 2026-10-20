#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns if an element array is valid.
 *
 * Arguments:
 * 0: Element array <ARRAY>
 *
 * Return Value:
 * If array is valid format <BOOL>
 *
 * Example:
 * [["TEXT", "My Test", [1, 0.4, 5]]] call ace_missile_hud_fnc_isElementValid
 *
 * Public: Yes
 */

params ["_elementArray"];
TRACE_1("isElementValid",_elementArray);

if !(_elementArray isEqualTypeArray ["", "", []]) exitWith { TRACE_1("Invalid - Types not equal",_elementArray); false };
_elementArray params ["_type", "_str", "_color"];
if !(_type in ["TEXT", "ICON", "SPACER"]) exitWith { TRACE_1("Invalid - Element Type not supported",_type); false };
private _success = if (_type != "SPACER") then {
    if !((_color isEqualTypeArray [0, 0, 0]) || (_color isEqualTypeArray [0, 0, 0, 0])) exitWith { TRACE_1("Invalid - Color not number",_color); false };
    if (-1 != _color findIf { _x > 1 || _x < 0 }) exitWith { TRACE_1("Invalid - Color not in range [0, 1]",_color); false };
    true
} else {
    true
};
if !(_success) exitWith { false };

TRACE_3("Valid - All checks pass",_type,_str,_color);

true
