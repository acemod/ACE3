#include "..\script_component.hpp"
/*
 * Author: jonpas
 * Makes the virtual load of a unit's gunbag match the weapon stored in it.
 * The mass already applied is kept on the gunbag, so this can be called any time the stored weapon may have changed
 * (stowing, taking out, swapping, loadout set, respawn, arsenal) and only the difference is added.
 * Runs where the unit is local (the movement load coefficient is only applied there).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Gunbag weapon, [weapon, attachments, magazines] or [] (default: read from the gunbag) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_gunbag_fnc_updateMass
 *
 * Public: No
 */

params ["_unit", "_state"];

private _gunbag = backpackContainer _unit;

if (isNull _gunbag) exitWith {};

if (isNil "_state") then {
    _state = _gunbag getVariable [QGVAR(gunbagWeapon), []];
};

if (!local _unit) exitWith {
    [QGVAR(updateMass), [_unit, _state], _unit] call CBA_fnc_targetEvent;
};

private _mass = 0;

if (_state isNotEqualTo []) then {
    _mass = _state call FUNC(calculateMass);
};

private _appliedMass = _gunbag getVariable [QGVAR(gunbagMass), 0];

if (_mass == _appliedMass) exitWith {};

_gunbag setVariable [QGVAR(gunbagMass), _mass, true];

[_unit, _gunbag, _mass - _appliedMass] call EFUNC(movement,addLoadToUnitContainer);
