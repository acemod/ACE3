#include "..\script_component.hpp"
/*
 * Authors: DartRuffian
 * Displays a player's medical message to the unit they are treating.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_gui_fnc_showMedicalHint
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("fnc_showMedicalHint",_medic,_patient);

if (!GVAR(medicalHintEnabled) || GVAR(medicalHintMessage) == "" || GVAR(pendingReopen) ||
    _medic == _patient || !(_patient call EFUNC(common,isPlayer))
) exitWith {};

private _message = format [GVAR(medicalHintMessage), [_medic, false, true] call EFUNC(common,getName)];
_message = format ["<t align='center'>%1</t>", _message];
private _image = "";

if (GVAR(medicalHintMedicIcon) != "" && {_medic call EFUNC(medical_treatment,isMedic)}) then {
    if (fileExists GVAR(medicalHintMedicIcon)) then {
        _image = GVAR(medicalHintMedicIcon);
    } else {
        WARNING_1("Image '%1' does not exist.",GVAR(medicalHintMedicIcon));
    };
};

[QEGVAR(common,displayTextPicture), [_message, _image], _patient] call CBA_fnc_targetEvent;
