#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Takes off electronic hearing protection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_hearing_fnc_removeEHP
 *
 * Public: No
 */

if (!GVAR(enableCombatDeafness)) exitWith {};

params ["_unit", ["_displayHint", false]];

// Inventory full
if !([_unit, "ACE_EHP"] call CBA_fnc_canAddItem) exitWith {
    [LELSTRING(common,Inventory_Full)] call EFUNC(common,displayTextStructured);
};

// Plugs already in and removing them.
_unit addItem "ACE_EHP";

_unit setVariable ["ACE_hasEHP", false, true];

if (_displayHint) then {
    [LLSTRING(ElectronicHearingProtection_Are_Off)] call EFUNC(common,displayTextStructured);
};

// Force an immediate volume update
true call FUNC(updateVolume);
UPDATE_HEARING call FUNC(updateHearingProtection);
