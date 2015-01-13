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

// Buds in inventory, putting them in
_player removeItem "AGM_EarBuds";

_player setVariable ["AGM_hasEarPlugsIn", true, true];

[localize "STR_AGM_Hearing_Earbuds_Are_On"] call AGM_Core_fnc_displayTextStructured;

/*// No Ear Buds in inventory, telling user
[localize "STR_AGM_Hearing_NoBuds"] call AGM_Core_fnc_displayTextStructured;*/
