#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Removes the pulseOxi from the patient on the given body part.
 * Note: Patient may not be local
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_pulseOxiRemove
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];
TRACE_3("pulseOxiRemove",_medic,_patient,_bodyPart);

// Remove pulseOxi from body part, exit if no pulseOxi applied
private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
private _pulseOxis = GET_PULSE_OXIS(_patient);

if (_pulseOxis select _partIndex == 0) exitWith {
    [LSTRING(noTourniquetOnBodyPart), 1.5] call EFUNC(common,displayTextStructured);
};

_pulseOxis set [_partIndex, 0];
_patient setVariable [VAR_PULSE_OXI, _pulseOxis, true];

private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call EFUNC(common,isPlayer)};
[_patient, "activity", "Pulse Oximeter removed", [[_medic, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);
TRACE_1("clearConditionCaches: pulseOxiRemove",_nearPlayers);
[QEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CBA_fnc_targetEvent;

// Add pulseOxi item to medic's inventory
// todo: should there be a setting to select who receives the removed pulseOxi?
[_medic, "ACE_pulseOximeter"] call EFUNC(common,addToInventory);
