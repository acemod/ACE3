/*
 * Author: Glowbal
 *
 *
 * Arguments:
 *
 * Return Value:
 * keyString - 15 characters <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_newKeyArray"];
_newKeyArray = [];

for "_i" from 1 to 15 /* step +1 */ do {
    _newKeyArray pushback (48 + floor(random(74)));
};

(toString _newKeyArray)
