#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for applying a pulseOxi to a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "LeftLeg"] call ace_medical_treatment_fnc_pulseOxiLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart"];
TRACE_2("pulseOxiLocal",_patient,_bodyPart);

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

private _pulseOxis = GET_PULSE_OXIS(_patient);
_pulseOxis set [_partIndex, CBA_missionTime];
_patient setVariable [VAR_PULSE_OXI, _pulseOxis, true];

[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call EFUNC(common,isPlayer)};
TRACE_1("clearConditionCaches: pulseOxiLocal",_nearPlayers);
[QEGVAR(interact_menu,clearConditionCaches), [], _nearPlayers] call CBA_fnc_targetEvent;
