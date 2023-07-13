#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for bandaging a patient's open wounds.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_bandage"];
TRACE_3("bandageLocal",_patient,_bodyPart,_bandage);
_bodyPart = toLower _bodyPart;

private _openWounds = GET_OPEN_WOUNDS(_patient);
private _woundsOnPart = _openWounds getOrDefault [_bodyPart, []];
if (_woundsOnPart isEqualTo []) exitWith {};

// Figure out which injury for this bodypart is the best choice to bandage
// TODO also use up the remainder on left over injuries
private _targetWound = [_patient, _bandage, _bodyPart] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];

// Everything is patched up on this body part already
if (_effectiveness == -1) exitWith {};

// Find the impact this bandage has and reduce the amount this injury is present
private _amountOf = _wound select 1;
private _impact = _effectiveness min _amountOf;
_amountOf = _amountOf - _impact;
_wound set [1, _amountOf];
_woundsOnPart set [_woundIndex, _wound];

_patient setVariable [VAR_OPEN_WOUNDS, _openWounds, true];

[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

// Handle the reopening of bandaged wounds
if (_impact > 0 && {GVAR(advancedBandages) == 2}) then {
    [_patient, _impact, _bodyPart, _woundIndex, _wound, _bandage] call FUNC(handleBandageOpening);
};

// Check if we fixed limping from this treatment
if (
    EGVAR(medical,limping) == 1
    && {_bodyPart isEqualTo "leftleg" || _bodyPart isEqualTo "rightleg"}
    && {_amountOf <= 0}
    && {_patient getVariable [QEGVAR(medical,isLimping), false]}
) then {
    [_patient] call EFUNC(medical_engine,updateDamageEffects);
};

if (GVAR(clearTrauma) == 2) then {
    TRACE_2("clearTrauma - clearing trauma after bandage",_bodyPart,_openWounds);
    private _partIndex = ALL_BODY_PARTS find _bodyPart;
    private _treatedDamageOf = (_wound select 3) * _impact;
    private _bodyPartDamage = _patient getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
    private _newDam = (_bodyPartDamage select _partIndex) - _treatedDamageOf;

    // Prevent obscenely small damage from lack of floating precision
    if (_newDam < 0.05) then {
        _bodyPartDamage set [_partIndex, 0];
    } else {
        _bodyPartDamage set [_partIndex, _newDam];
    };
    _patient setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];
    TRACE_2("clearTrauma - healed damage",_partIndex,_treatedDamageOf);

    switch (_bodyPart) do {
        case "head": { [_patient, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "body": { [_patient, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "leftarm";
        case "rightarm": { [_patient, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        default { [_patient, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
    };
};

// Reset treatment condition cache for nearby players if we stopped all bleeding
if (_amountOf <= 0) then {
    private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call EFUNC(common,isPlayer)};
    TRACE_1("clearConditionCaches: bandage",_nearPlayers);
    [QEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CBA_fnc_targetEvent;
};
