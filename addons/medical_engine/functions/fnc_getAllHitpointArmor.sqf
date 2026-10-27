#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Returns the total armor of every hitpoint used for wounds (see GVAR(hitPointNames)) for a unit's current equipment.
 * Armor only depends on the equipment, so it is calculated once for each combination of uniform, vest and headgear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Armor of each hitpoint in the order of GVAR(hitPointNames), may be scaled <ARRAY of NUMBERs>
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

private _gear = [
    _uniform,
    vest _unit,
    headgear _unit
];

GVAR(allHitpointArmorCache) getOrDefaultCall [_gear joinString "$", {
    GVAR(hitPointNames) apply {
        private _hitpoint = _x;
        private _armor = 0;

        {
            _armor = _armor + ([_x, _hitpoint] call FUNC(getItemArmor));
        } forEach _gear;

        // Armor should be at least 1 to prevent dividing by 0
        _armor max 1
    }
}, true] // return
