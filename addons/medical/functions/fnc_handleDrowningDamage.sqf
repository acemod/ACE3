/*
 * Author: Glowbal
 * Handle drowning damage to unit
 *
 * Arguments:
 * 0: Unit for which the hitpoint damage will be sorted out <OBJECT>
 * 1: new damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_newDamage"];

// At the moment we will just not do anything
// We reserve this until a later stage
// A unit will automatically die once oxygen has ran out anyway
