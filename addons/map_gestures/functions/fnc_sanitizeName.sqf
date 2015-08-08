/*
 * Author: MikeMatrix
 * Cleans up unit names to be usable within variable names.
 *
 * Arguments:
 * 0: Name <STRING>
 *
 * Return Value:
 * Sanitized name <STRING>
 *
 * Example:
 * ["I am a non valid variable name"] call ace_map_gestures_fnc_sanitizeName
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_alphabet", "_nameSanitized"];

params ["_name"];

_alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

_nameSanitized = [];
{
    if (toString [_x] in _alphabet) then {_nameSanitized pushBack _x};
    nil
} count (toArray _name);

toString _nameSanitized
