#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for bandaging a patient's open wounds.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 * 3: Percentage of bandage remaining <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Head", "FieldDressing", 1] call ace_medical_treatment_fnc_bandageLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_bandage", ["_bandageRemaining", 1]];
TRACE_4("bandageLocal",_patient,_bodyPart,_bandage,_bandageRemaining);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith {};

private _openWounds = GET_OPEN_WOUNDS(_patient);
if (_openWounds isEqualTo []) exitWith {};

// No effectiveness left
if (_bandageRemaining == 0) exitWith {};

// Figure out which injury for this bodypart is the best choice to bandage
private _targetWounds = [_patient, _bandage, _partIndex, _bandageRemaining] call FUNC(findMostEffectiveWound);

// Everything is patched up on this body part already
if (_targetWounds isEqualTo createHashMap) exitWith {};

private _treatedDamageOf = 0;
{
    private _wound = _x;
    _wound params ["_classID", "", "_amountOf", "_bleeding", "_damage"];
    _y params ["_effectiveness", "_woundIndex", "_impact"];

    // Reduce the amount this injury is present
    _openWounds set [_woundIndex, [_classID, _partIndex, _amountOf - _impact, _bleeding, _damage]];
    // Store treated damage for clearing trauma
    _treatedDamageOf = _treatedDamageOf + (_impact * _damage);

    // Handle the reopening of bandaged wounds
    if (_impact > 0 && {GVAR(advancedBandages) == 2}) then {
        [_patient, _impact, _partIndex, _woundIndex, _wound, _bandage] call FUNC(handleBandageOpening);
    };
} forEach _targetWounds;

_patient setVariable [VAR_OPEN_WOUNDS, _openWounds, true];

[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

// Check if we fixed limping from this treatment
if (EGVAR(medical,limping) == 1 && {_partIndex > 3} && {_patient getVariable [QEGVAR(medical,isLimping), false]}) then {
    [_patient] call EFUNC(medical_engine,updateDamageEffects);
};

if (GVAR(clearTrauma) == 2) then {
    TRACE_2("clearTrauma - clearing trauma after bandage",_partIndex,_openWounds);
    private _bodyPartDamage = _patient getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    private _newDam = (_bodyPartDamage select _partIndex) - _treatedDamageOf;
    if (_newDam < 0.05) then { // Prevent obscenely small damage from lack of floating precision
        _bodyPartDamage set [_partIndex, 0];
    } else {
        _bodyPartDamage set [_partIndex, _newDam];
    };
    _patient setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];
    TRACE_2("clearTrauma - healed damage",_partIndex,_treatedDamageOf);

    switch (_partIndex) do {
        case 0: { [_patient, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case 1: { [_patient, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case 2;
        case 3: { [_patient, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        default { [_patient, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
    };
};

if (count _targetWounds > 0) then { // Reset treatment condition cache for nearby players if we stopped all bleeding
    private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call EFUNC(common,isPlayer)};
    TRACE_1("clearConditionCaches: bandage",_nearPlayers);
    [QEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CBA_fnc_targetEvent;
};
