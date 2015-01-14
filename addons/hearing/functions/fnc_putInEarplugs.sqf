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

// Buds in inventory, putting them in
_player removeItem "ACE_EarBuds";

_player setVariable ["ACE_hasEarPlugsIn", true, true];

[localize "STR_ACE_Hearing_Earbuds_Are_On"] call EFUNC(common,displayTextStructured);

/*// No Ear Buds in inventory, telling user
[localize "STR_ACE_Hearing_NoBuds"] call EFUNC(common,displayTextStructured);*/
