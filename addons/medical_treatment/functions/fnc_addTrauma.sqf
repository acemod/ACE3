#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Add trauma to a body part.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Amount of trauma to add, negative to remove <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "head", -5] call ace_medical_treatment_fnc_addTrauma
 *
 * Public: No
 */

params ["_unit", "_bodyPart", "_trauma"];

private _partIndex = ALL_BODY_PARTS find _bodyPart;
private _bodyPartDamage = GET_BODYPART_DAMAGE(_unit);
private _newDam = (_bodyPartDamage select _partIndex) + _trauma;

// Prevent obscenely small damage from lack of floating precision
if (_trauma < 0 && _newDam < 0.05) then {
    _bodyPartDamage set [_partIndex, 0];
} else {
    _bodyPartDamage set [_partIndex, _newDam];
};

// Update body part visuals
switch (_bodyPart) do {
    case "head":     { [_unit, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
    case "body":     { [_unit, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
    case "leftarm";
    case "rightarm": { [_unit, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
    default { [_unit, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
};

TRACE_2("trauma - added damage",_trauma,_newDam);
_unit setVariable [VAR_BODYPART_DAMAGE, _bodyPartDamage, true];
