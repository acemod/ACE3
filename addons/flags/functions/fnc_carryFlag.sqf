#include "script_component.hpp"
/*
 * Author: Timi007
 * Attaches flag to the back of the unit and removes his flag item.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Flag item <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, "ace_flags_white"] call ace_flags_fnc_carryFlag
 *
 * Public: No
 */

params ["_unit", "_item"];

// Arma needs a flag proxy and some modded uniforms don't have them.
// If we temporarily change the uniform to a vanilla one we can work around this problem.
private _loadout = getUnitLoadout _unit;
_unit forceAddUniform "U_B_CombatUniform_mcam";

private _texture = (GVAR(flagItemCache) get _item) param [1, ""];
_unit forceFlagTexture _texture;

// We need to change loadout in the next frame otherwise it will not work
[{
    params ["_unit", "_item", "_loadout"];

    _unit setUnitLoadout _loadout;

    _unit setVariable [QGVAR(carryingFlag), _item, true];
    _unit removeItem _item;
}, [_unit, _item, _loadout]] call CBA_fnc_execNextFrame;
