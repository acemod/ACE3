#include "script_component.hpp"
/*
 * Author: Hope Johnson and commy2
 * Puts in earplugs.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 * 1: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, false] call ace_hearing_fnc_putInEarplugs
 *
 * Public: No
 */

params ["_player", ["_displayHint", false, [false]]];

if (!GVAR(EnableCombatDeafness)) exitWith {};

// Plugs in inventory, putting them in
_player removeItem "ACE_EarPlugs";

_player setVariable ["ACE_hasEarPlugsIn", true, true];

if (_displayHint) then {
    [localize LSTRING(EarPlugs_Are_On)] call EFUNC(common,displayTextStructured);
};

//Force an immediate fast volume update:
[[true]] call FUNC(updateVolume);

// No Earplugs in inventory, telling user
//[localize LSTRING(NoPlugs)] call EFUNC(common,displayTextStructured);

[] call FUNC(updateHearingProtection);
