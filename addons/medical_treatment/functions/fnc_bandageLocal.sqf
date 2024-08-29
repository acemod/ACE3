#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for bandaging a patient's open wounds.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 * 3: Bandage effectiveness coefficient <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_bandage", ["_bandageEffectiveness", 1, [0]]];
TRACE_4("bandageLocal",_patient,_bodyPart,_bandage,_bandageEffectiveness);
_bodyPart = toLowerANSI _bodyPart;

private _openWounds = GET_OPEN_WOUNDS(_patient);
private _woundsOnPart = _openWounds getOrDefault [_bodyPart, []];
if (_woundsOnPart isEqualTo []) exitWith {};

// Figure out which injuries for this bodypart are the best choice to bandage
private _targetWounds = [_patient, _bandage, _bodyPart, _bandageEffectiveness * GVAR(bandageEffectiveness)] call FUNC(findMostEffectiveWounds);

// Everything is patched up on this body part already
if (count _targetWounds == 0) exitWith {};

private _treatedDamage = 0;
private _clearConditionCache = false;

{
    private _wound = _x;
    _wound params ["_classID", "_amountOf", "_bleeding", "_damage"];
    _y params ["_effectiveness", "_woundIndex", "_impact"];

    // clear condition cache if we stopped all bleeding for this injury
    if (!_clearConditionCache) then {
        _clearConditionCache = (_effectiveness >= _amountOf);
    };

    // Reduce the amount this injury is present
    (_woundsOnPart select _woundIndex) set [1, _amountOf - _impact];

    // Store treated damage for clearing trauma
    _treatedDamage = _treatedDamage + (_impact * _damage);

    // Handle reopening bandaged wounds
    if (_impact > 0 && {GVAR(advancedBandages) == 2}) then {
        [_patient, _impact, _bodyPart, _woundIndex, _wound, _bandage] call FUNC(handleBandageOpening);
    };
} forEach _targetWounds;

_patient setVariable [VAR_OPEN_WOUNDS, _openWounds, true];

[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

// Check if we fixed limping from this treatment
if (
    EGVAR(medical,limping) == 1
    && {_clearConditionCache}
    && {_bodyPart in ["leftleg", "rightleg"]}
    && {_patient getVariable [QEGVAR(medical,isLimping), false]}
) then {
    [_patient] call EFUNC(medical_engine,updateDamageEffects);
};

if (GVAR(clearTrauma) == 2) then {
    TRACE_2("clearTrauma - clearing trauma after bandage",_bodyPart,_openWounds);
    private _partIndex = ALL_BODY_PARTS find _bodyPart;
    private _bodyPartDamage = _patient getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    private _newDam = (_bodyPartDamage select _partIndex) - _treatedDamage;

    // Prevent obscenely small damage from lack of floating precision
    if (_newDam < 0.05) then {
        _bodyPartDamage set [_partIndex, 0];
    } else {
        _bodyPartDamage set [_partIndex, _newDam];
    };
    _patient setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];
    TRACE_2("clearTrauma - healed damage",_partIndex,_treatedDamage);

    switch (_bodyPart) do {
        case "head": { [_patient, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "body": { [_patient, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "leftarm";
        case "rightarm": { [_patient, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        default { [_patient, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
    };
};

// Reset treatment condition cache for nearby players if we stopped all bleeding
if (_clearConditionCache) then {
    private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call EFUNC(common,isPlayer)};
    TRACE_1("clearConditionCaches: bandage",_nearPlayers);
    [QEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CBA_fnc_targetEvent;
};
