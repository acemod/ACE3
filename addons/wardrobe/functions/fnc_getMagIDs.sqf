#include "../../script_component.hpp"

/*
* Author: Zorn
* function to return the magazine ID's of certain magazines
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
    ["_unit",       objNull,    [objNull]       ],
    ["_className",  "",         [""]            ]
];

if ( _className == "" || { _unit isEqualTo objNull } ) exitWith {};

toFixed 0;
(magazinesAmmoFull _unit) apply { [_x#0, _x#-2, _x#-1] } select { _x#0 == _className } apply { format ["%1/%2", _x#1,_x#2] }