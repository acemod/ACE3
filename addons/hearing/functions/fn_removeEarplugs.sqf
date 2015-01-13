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

private "_player";

_player = _this select 0;

if !(_player canAdd "AGM_EarBuds") exitWith { // inventory full
  [localize "STR_AGM_Hearing_Inventory_Full"] call AGM_Core_fnc_displayTextStructured;
};

// Buds already in and removing them.
_player addItem "AGM_EarBuds";

_player setVariable ["AGM_hasEarPlugsIn", false, true];

[localize "STR_AGM_Hearing_Earbuds_Are_Off"] call AGM_Core_fnc_displayTextStructured;
