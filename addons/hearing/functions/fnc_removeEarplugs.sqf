#include "script_component.hpp"
/*
 * Author: Hope Johnson and commy2
 * Takes out earplugs.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call ace_hearing_fnc_removeEarplugs
 *
 * Public: No
 */

params ["_player"];

if (!GVAR(EnableCombatDeafness)) exitWith {};

if !(_player canAdd "ACE_EarPlugs") exitWith { // inventory full
    [localize LSTRING(Inventory_Full)] call EFUNC(common,displayTextStructured);
};

// Plugs already in and removing them.
_player addItem "ACE_EarPlugs";

_player setVariable ["ACE_hasEarPlugsIn", false, true];

[localize LSTRING(EarPlugs_Are_Off)] call EFUNC(common,displayTextStructured);

//Force an immediate fast volume update:
[[true]] call FUNC(updateVolume);

[] call FUNC(updateHearingProtection);
