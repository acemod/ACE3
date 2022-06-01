#include "script_component.hpp"
/*
 * Author: Glowbal, SilentSpike, mharis001
 * Updates the body image for given target.
 *
 * Arguments:
 * 0: Body image controls group <CONTROL>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, _target] call ace_medical_gui_fnc_updateBodyImage
 *
 * Public: No
 */

params ["_ctrlGroup", "_target"];

// Get tourniquets, damage, and blood loss for target
private _tourniquets = GET_TOURNIQUETS(_target);
private _pulseOxis = GET_PULSE_OXIS(_target);
private _fractures = GET_FRACTURES(_target);
private _bodyPartDamage = _target getVariable [QEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]];
private _bodyPartBloodLoss = [0, 0, 0, 0, 0, 0];

{
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];
    _bodyPartBloodLoss set [_bodyPartN, (_bodyPartBloodLoss select _bodyPartN) + (_bleeding * _amountOf)];
} forEach GET_OPEN_WOUNDS(_target);

{
    _x params ["_bodyPartIDC", ["_tourniquetIDC", -1], ["_fractureIDC", -1], ["_pulseOxiIDC", -1], ["_lungsIDC", -1]];

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
                if (EGVAR(medical,fractures) in [2, 3]) then {
                    _ctrlBone ctrlShow true;
                    _ctrlBone ctrlSetTextColor [0, 0, 1, 1];
                } else {
                    _ctrlBone ctrlShow false;
                };
            };
        };
    };
    if (_pulseOxiIDC != -1) then {
        private _hasPulseOxi = _pulseOxis select _forEachIndex > 0;
        private _ctrlPulseOxi = _ctrlGroup controlsGroupCtrl _pulseOxiIDC;
        _ctrlPulseOxi ctrlShow _hasPulseOxi;
    };
    
    if (_lungsIDC != -1) then {
        private _hasPneumo = GET_PNEUMO(_target);
        private _ctrlLungs = _ctrlGroup controlsGroupCtrl _lungsIDC;
        _ctrlLungs ctrlShow _hasPneumo;
        _ctrlLungs ctrlSetTextColor [1, 0, 0, 1];
    };

    // Update body part color based on blood loss and damage
    private _bloodLoss = _bodyPartBloodLoss select _forEachIndex;
    private _bodyPartColor = if (_bloodLoss > 0) then {
        [_bloodLoss] call FUNC(bloodLossToRGBA);
    } else {
        private _damage = _bodyPartDamage select _forEachIndex;
        [_damage] call FUNC(damageToRGBA);
    };

    private _ctrlBodyPart = _ctrlGroup controlsGroupCtrl _bodyPartIDC;
    _ctrlBodyPart ctrlSetTextColor _bodyPartColor;
} forEach [
    [IDC_BODY_HEAD, -1, -1, IDC_BODY_HEAD_P],
    [IDC_BODY_TORSO, -1, -1, -1, IDC_BODY_LUNGS],
    [IDC_BODY_ARMLEFT,  IDC_BODY_ARMLEFT_T,  IDC_BODY_ARMLEFT_B, IDC_BODY_ARMLEFT_P],
    [IDC_BODY_ARMRIGHT, IDC_BODY_ARMRIGHT_T, IDC_BODY_ARMRIGHT_B, IDC_BODY_ARMRIGHT_P],
    [IDC_BODY_LEGLEFT,  IDC_BODY_LEGLEFT_T,  IDC_BODY_LEGLEFT_B, IDC_BODY_LEGLEFT_P],
    [IDC_BODY_LEGRIGHT, IDC_BODY_LEGRIGHT_T, IDC_BODY_LEGRIGHT_B, IDC_BODY_LEGRIGHT_P]
];
