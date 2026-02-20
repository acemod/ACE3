#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles a unit leaving dazed
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_leftStateDazed
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("leftStateDazed",_unit);

[_unit, false] call EFUNC(medical_status,setDazedState);
