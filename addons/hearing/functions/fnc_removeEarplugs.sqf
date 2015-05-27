/*
 * Author: Hope Johnson and commy2
 * Takes out earplugs.
 *
 * Arguments:
 * 0:Unit (player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call ace_hearing_fnc_removeEarplugs
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_player);

if !(_player canAdd "ACE_EarPlugs") exitWith { // inventory full
    [localize STRING(Inventory_Full)] call EFUNC(common,displayTextStructured);
};

// Plugs already in and removing them.
_player addItem "ACE_EarPlugs";

_player setVariable ["ACE_hasEarPlugsIn", false, true];

[localize STRING(EarPlugs_Are_Off)] call EFUNC(common,displayTextStructured);
