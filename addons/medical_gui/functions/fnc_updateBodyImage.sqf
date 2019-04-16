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
 * [CONTROL, _target] call ace_medical_menu_fnc_updateBodyImage
 *
 * Public: No
 */

params ["_ctrlGroup", "_target"];

// Get tourniquets, damage, and blood loss for target
private _tourniquets = GET_TOURNIQUETS(_target);
private _bodyPartDamage = _target getVariable [QEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]];
private _bodyPartBloodLoss = [0, 0, 0, 0, 0, 0];

{
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];
    _bodyPartBloodLoss set [_bodyPartN, (_bodyPartBloodLoss select _bodyPartN) + (_bleeding * _amountOf)];
} forEach (_target getVariable [QEGVAR(medical,openWounds), []]);

{
    _x params ["_bodyPartIDC", ["_tourniquetIDC", -1]];

    // Show or hide the tourniquet icon
    if (_tourniquetIDC != -1) then {
        private _hasTourniquet = _tourniquets select _forEachIndex > 0;
        private _ctrlTourniquet = _ctrlGroup controlsGroupCtrl _tourniquetIDC;
        _ctrlTourniquet ctrlShow _hasTourniquet;
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
    [IDC_BODY_HEAD],
    [IDC_BODY_TORSO],
    [IDC_BODY_ARMLEFT, IDC_BODY_ARMLEFT_T],
    [IDC_BODY_ARMRIGHT, IDC_BODY_ARMRIGHT_T],
    [IDC_BODY_LEGLEFT, IDC_BODY_LEGLEFT_T],
    [IDC_BODY_LEGRIGHT, IDC_BODY_LEGRIGHT_T]
];
