/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: keySetOne <ARRAY>
 * 1: keySetTwo <ARRAY>
 *
 * Return Value:
 * has common keys? <BOOLEAN>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_keySetOne", "_keySetTwo"];

!((_keySetOne arrayIntersect _keySetTwo) isEqualTo [])
