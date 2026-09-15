#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Puts on electronic hearing protection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_hearing_fnc_putOnEHP
 *
 * Public: No
 */

if (!GVAR(enableCombatDeafness)) exitWith {};

params ["_unit", ["_displayHint", false]];

// Plugs in inventory, putting them in
_unit removeItem "ACE_EHP";

_unit setVariable ["ACE_hasEHP", true, true];

if (_displayHint) then {
    [LLSTRING(ElectronicHearingProtection_Are_On)] call EFUNC(common,displayTextStructured);
};

// Force an immediate volume update
true call FUNC(updateVolume);
UPDATE_HEARING call FUNC(updateHearingProtection);
