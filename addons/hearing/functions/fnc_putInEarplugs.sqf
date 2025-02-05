#include "..\script_component.hpp"
/*
 * Author: Hope Johnson, commy2
 * Puts in earplugs.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_hearing_fnc_putInEarplugs
 *
 * Public: No
 */

if (!GVAR(enableCombatDeafness)) exitWith {};

params ["_unit", ["_displayHint", false]];

// Plugs in inventory, putting them in
_unit removeItem "ACE_EarPlugs";

_unit setVariable ["ACE_hasEarPlugsIn", true, true];

if (_displayHint) then {
    [LLSTRING(EarPlugs_Are_On)] call EFUNC(common,displayTextStructured);
};

// Force an immediate volume update
true call FUNC(updateVolume);
UPDATE_HEARING call FUNC(updateHearingProtection);
