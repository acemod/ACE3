/*
 * Author: Glowbal
 * Removes white spaces from string
 *
 * Arguments:
 * 0: stringA <STRING>
 * 1: stringB <STRING>
 *
 * Return Value:
 * copy of string <STRING>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_string"];

(_string splitString " ") joinString ""
