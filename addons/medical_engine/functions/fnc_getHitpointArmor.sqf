#include "..\script_component.hpp"
/*
 * Author: Pterolatypus, LinkIsGrim
 * Checks a unit's equipment to calculate the total armor on a hitpoint.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Armor for the given hitpoint, may be scaled. <NUMBER>
 *
 * Example:
 * [player, "HitChest"] call ace_medical_engine_fnc_getHitpointArmor
 *
 * Public: No
 */

params ["_unit", "_hitpoint"];

private _uniform = uniform _unit;
// If unit is naked, use its underwear class instead
if (_uniform isEqualTo "") then {
    _uniform = getText (configOf _unit >> "nakedUniform");
};

private _gear = [
    _uniform,
    vest _unit,
    headgear _unit
];

private _rags = _gear joinString "$";
private _var = format [QGVAR(armorCache$%1), _hitpoint];
_unit getVariable [_var, ["", 0]] params ["_prevRags", "_armor"];

if (_rags != _prevRags) then {
    _armor = 0;

    {
        _armor = _armor + ([_x, _hitpoint] call FUNC(getItemArmor));
    } forEach _gear;

    // Armor should be at least 1 to prevent dividing by 0
    _armor = _armor max 1;

    _unit setVariable [_var, [_rags, _armor]];
};

_armor // return
