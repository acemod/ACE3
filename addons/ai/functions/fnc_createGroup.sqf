#include "script_component.hpp"
/*
 * Author: commy2
 * Creates a group with units.
 *
 * Arguments:
 *  0: Group data from ace_ai_fnc_copyGroup <ARRAY>
 *
 * Return Value:
 *  The group <GROUP>
 *
 * Example:
 *  private _group = _groupData call ace_ai_fnc_createGroup;
 *
 * Public: Yes
 */

params ["_side", "_behaviour", "_combatMode", "_unitsData"];

// group
private _group = createGroup (SIDES select _side);
_group setBehaviour _behaviour;
_group setCombatMode _combatMode;

// group members
{
    _x params ["_type", "_pos", "_dir", "_skill", "_loadout"];

    private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];
    _unit setDir _dir;
    _unit setPosWorld _pos;
    _unit setSkill _skill;
    _unit setUnitLoadout _loadout;
} forEach _unitsData;

_group
