#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Called when a unit enters the "Dazed" state in the medical statemachine.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Returns:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_enteredStateDazed
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("enteredStateDazed",_unit);

[_unit, true] call EFUNC(medical_status,setDazedState);
