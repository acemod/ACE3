#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Checks a unit's equipment to calculate the total armor on a hitpoint.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * Total armor for the given hitpoint <NUMBER>
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
    _uniform = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "nakedUniform");
};

private _gear = [
    _uniform,
    vest _unit,
    headgear _unit
];

private _rags = _gear joinString "$";
private _var = format [QGVAR(armorCache$%1), _hitpoint];
_unit getVariable [_var, [""]] params ["_prevRags", "_armor"];

if (_rags != _prevRags) then {
    _armor = 0;

    {
        _armor = _armor + ([_x, _hitpoint] call FUNC(getItemArmor));
    } forEach _gear;

    _unit setVariable [_var, [_rags, _armor]];
};

_armor // return
