#include "..\script_component.hpp"
/*
 * Author: Glowbal, kymckay, mharis001
 * Updates the body image for given target.
 *
 * Arguments:
 * 0: Body image controls group <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, _target, 0] call ace_medical_gui_fnc_updateBodyImage
 *
 * Public: No
 */

params ["_ctrlGroup", "_target", "_selectionN"];

// Get tourniquets, damage, and blood loss for target
private _tourniquets = GET_TOURNIQUETS(_target);
private _fractures = GET_FRACTURES(_target);
private _bodyPartDamage = GET_BODYPART_DAMAGE(_target);
private _damageThreshold = GET_DAMAGE_THRESHOLD(_target);
private _bodyPartBloodLoss = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

{
    private _partIndex = ALL_BODY_PARTS find _x;
    {
        _x params ["", "_amountOf", "_bleeding"];
        _bodyPartBloodLoss set [_partIndex, (_bodyPartBloodLoss select _partIndex) + (_bleeding * _amountOf)];
    } forEach _y;
} forEach GET_OPEN_WOUNDS(_target);

{
    _x params ["_bodyPartIDC", "_selectedIDC", ["_tourniquetIDC", -1], ["_fractureIDC", -1]];

    private _selected = _forEachIndex == _selectionN;
    private _ctrlSelected = _ctrlGroup controlsGroupCtrl _selectedIDC;
    _ctrlSelected ctrlSetTextColor GVAR(bodypartOutlineColor);
    _ctrlSelected ctrlShow _selected;

    // Show or hide the tourniquet icon
    if (_tourniquetIDC != -1) then {
        private _hasTourniquet = _tourniquets select _forEachIndex > 0;
        private _ctrlTourniquet = _ctrlGroup controlsGroupCtrl _tourniquetIDC;
        _ctrlTourniquet ctrlShow _hasTourniquet;
    };

    // Show or hide fractrue/bones
    if (_fractureIDC != -1) then {
        private _ctrlBone = _ctrlGroup controlsGroupCtrl _fractureIDC;
        switch (_fractures select _forEachIndex) do {
            case 0: {
                _ctrlBone ctrlShow false;
            };
            case 1: {
                _ctrlBone ctrlShow true;
                _ctrlBone ctrlSetTextColor [1, 0, 0, 1];
            };
            case -1: {
                if (EGVAR(medical,fractures) in [4, 5, 6, 7]) then {
                    _ctrlBone ctrlShow true;
                    _ctrlBone ctrlSetTextColor [0, 0, 1, 1];
                } else {
                    _ctrlBone ctrlShow false;
                };
            };
        };
    };

    // Update body part color based on blood loss and damage
    private _bloodLoss = _bodyPartBloodLoss select _forEachIndex;
    private _bodyPartColor = if (_bloodLoss > 0) then {
        [_bloodLoss] call FUNC(bloodLossToRGBA);
    } else {
        private _damage = _bodyPartDamage select _forEachIndex;
        // _damageThreshold here indicates how close unit is to guaranteed death via sum of trauma, so use the same multipliers used in medical_damage/functions/fnc_determineIfFatal.sqf
        // TODO: make multipliers for head and torso a macro in medical_engine/script_macros_medical.hpp
        switch (true) do { // torso damage threshold doesn't need scaling
            case (_forEachIndex > 7): { // legs: index 8,9,10,11
                if (EGVAR(medical,limbDamageThreshold) != 0 && {[false, !isPlayer _target, true] select EGVAR(medical,useLimbDamage)}) then { // Just indicate how close to the limping threshold we are
                    _damageThreshold = _damageThreshold * EGVAR(medical,limbDamageThreshold);
                } else {
                    _damageThreshold = LIMPING_DAMAGE_THRESHOLD * 4;
                };
            };
            case (_forEachIndex > 3): { // arms: index 4,5,6,7
                if (EGVAR(medical,limbDamageThreshold) != 0 && {[false, !isPlayer _target, true] select EGVAR(medical,useLimbDamage)}) then { // Just indicate how close to the fracture threshold we are
                    _damageThreshold = _damageThreshold * EGVAR(medical,limbDamageThreshold);
                } else {
                    _damageThreshold = FRACTURE_DAMAGE_THRESHOLD * 4;
                };
            };
            case (_forEachIndex > 1): { // body
                _damageThreshold = _damageThreshold * 1.5;
            };
            default { //head and neck
                _damageThreshold = _damageThreshold * 1.5
            };
        };
        _damage = (_damage / (0.01 max _damageThreshold)) min 1;
        [_damage] call FUNC(damageToRGBA);
    };

    private _ctrlBodyPart = _ctrlGroup controlsGroupCtrl _bodyPartIDC;
    _ctrlBodyPart ctrlSetTextColor _bodyPartColor;
} forEach [
    [IDC_BODY_HEAD, IDC_BODY_HEAD_S],
    [IDC_BODY_NECK, IDC_BODY_NECK_S],
    [IDC_BODY_CHEST, IDC_BODY_CHEST_S],
    [IDC_BODY_TORSO, IDC_BODY_TORSO_S],
    [IDC_BODY_ARMLEFT, IDC_BODY_ARMLEFT_S,  IDC_BODY_ARMLEFT_T,  IDC_BODY_ARMLEFT_B],
    [IDC_BODY_ARMUPPERLEFT, IDC_BODY_ARMUPPERLEFT_S,  IDC_BODY_ARMUPPERLEFT_T,  IDC_BODY_ARMUPPERLEFT_B],
    [IDC_BODY_ARMRIGHT, IDC_BODY_ARMRIGHT_S, IDC_BODY_ARMRIGHT_T, IDC_BODY_ARMRIGHT_B],
    [IDC_BODY_ARMUPPERRIGHT, IDC_BODY_ARMUPPERRIGHT_S, IDC_BODY_ARMUPPERRIGHT_T, IDC_BODY_ARMUPPERRIGHT_B],
    [IDC_BODY_LEGLEFT, IDC_BODY_LEGLEFT_S,  IDC_BODY_LEGLEFT_T,  IDC_BODY_LEGLEFT_B],
    [IDC_BODY_LEGUPPERLEFT, IDC_BODY_LEGUPPERLEFT_S,  IDC_BODY_LEGUPPERLEFT_T,  IDC_BODY_LEGUPPERLEFT_B],
    [IDC_BODY_LEGRIGHT, IDC_BODY_LEGRIGHT_S, IDC_BODY_LEGRIGHT_T, IDC_BODY_LEGRIGHT_B],
    [IDC_BODY_LEGUPPERRIGHT, IDC_BODY_LEGUPPERRIGHT_S, IDC_BODY_LEGUPPERRIGHT_T, IDC_BODY_LEGUPPERRIGHT_B]
];

[QGVAR(updateBodyImage), [_ctrlGroup, _target, _selectionN]] call CBA_fnc_localEvent;
