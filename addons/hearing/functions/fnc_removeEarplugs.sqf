/*
 * Author: Hope Johnson
 * Edited by commy2
 *
 * Puts in / takes out earplugs.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * none
 */
#include "script_component.hpp"

private "_player";

_player = _this select 0;

if !(_player canAdd "ACE_EarBuds") exitWith { // inventory full
  [localize "STR_ACE_Hearing_Inventory_Full"] call EFUNC(common,displayTextStructured);
};

// Buds already in and removing them.
_player addItem "ACE_EarBuds";

_player setVariable ["ACE_hasEarPlugsIn", false, true];

[localize "STR_ACE_Hearing_Earbuds_Are_Off"] call EFUNC(common,displayTextStructured);
