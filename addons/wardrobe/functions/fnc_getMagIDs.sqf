#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to return the magazine ID's of certain magazines
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Classname <STRING>
 *
 * Return Value:
 * Strings of Magazines IDs <ARRAY>
 *
 * Example:
 * [_unit, _className] call ace_wardrobe_fnc_getMagIDs;
 *
 * Public: No
 */


params [
    ["_unit", objNull, [objNull]],
    ["_className", "", [""]]
];

if ( _className == "" || { _unit isEqualTo objNull } ) exitWith {};

toFixed 0;
(magazinesAmmoFull _unit) apply { [_x#0, _x#-2, _x#-1] } select { _x#0 == _className } apply { format ["%1/%2", _x#1,_x#2] }
