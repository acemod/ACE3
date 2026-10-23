#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Returns the armor of every hitpoint used for wounds (see GVAR(hitPointIndexes)) for the unit's current equipment.
 * Dead units can't change equipment during a hit, so handleDamage looks this up once per hit for them.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Armor of each hitpoint, by lowercase hitpoint name <HASHMAP>
 *
 * Example:
 * cursorObject call ace_medical_engine_fnc_getAllHitpointArmor
 *
 * Public: No
 */

params ["_unit"];

private _uniform = uniform _unit;
// If unit is naked, use its underwear class instead
if (_uniform isEqualTo "") then {
    _uniform = getText (configOf _unit >> "nakedUniform");
};

private _rags = [_uniform, vest _unit, headgear _unit] joinString "$";
_unit getVariable [QGVAR(allHitpointArmor), [""]] params ["_prevRags", "_armor"];

if (_rags != _prevRags) then {
    _armor = createHashMap;
    {
        _armor set [_x, [_unit, _x] call FUNC(getHitpointArmor)];
    } forEach keys GVAR(hitPointIndexes);

    _unit setVariable [QGVAR(allHitpointArmor), [_rags, _armor]];
};

_armor // return
