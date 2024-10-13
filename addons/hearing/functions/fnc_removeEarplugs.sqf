#include "..\script_component.hpp"
/*
 * Author: Hope Johnson, commy2
 * Takes out earplugs.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Display hint <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, false] call ace_hearing_fnc_removeEarplugs
 *
 * Public: No
 */

if (!GVAR(enableCombatDeafness)) exitWith {};

params ["_unit", ["_displayHint", false]];

// Inventory full
if !([_unit, "ACE_EarPlugs"] call CBA_fnc_canAddItem) exitWith {
    [LELSTRING(common,Inventory_Full)] call EFUNC(common,displayTextStructured);
};

// Plugs already in and removing them.
_unit addItem "ACE_EarPlugs";

_unit setVariable ["ACE_hasEarPlugsIn", false, true];

if (_displayHint) then {
    [LLSTRING(EarPlugs_Are_Off)] call EFUNC(common,displayTextStructured);
};

// Force an immediate volume update
true call FUNC(updateVolume);

call FUNC(updateHearingProtection);
