#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Custom wound handler for non-selection-specific wounds
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "#structural", 1.5]], "falling"] call ace_medical_damage_fnc_woundsHandlerNonSpecificScaling
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];
TRACE_3("woundsHandlerNonSpecificScaling",_unit,_allDamages,_typeOfDamage);

private _reduceFactor = [GVAR(multipleWoundReduction_explosion), GVAR(multipleWoundReduction_collision)] 
    select (toLower _typeOfDamage in ["vehiclecrash", "collision", "falling"]);

if (_reduceFactor > 0) then {
    private _multiSelectionReduction = 0;
    {
        _x params ["_damage", "_bodyPart"];
        if ((_bodyPart == "#structural") || {_damage <= 0}) then { continue };

        _damage = 0 max (_damage - _multiSelectionReduction);
        _multiSelectionReduction = _multiSelectionReduction + _damage * _reduceFactor;
        TRACE_3("reduce",_x,_damage,_multiSelectionReduction);
        _x set [0, _damage];
    } forEach _allDamages;
};

_this //return (modified arrays)
