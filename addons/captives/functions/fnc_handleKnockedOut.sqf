/*
 * Author: commy2, PabstMirror
 * Handles when a unit gets knocked out.  Ends surrendering.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob, true] call ACE_captives_fnc_handleKnockedOut
 *
 * Public: No
 */
#include "script_component.hpp"


//ToDo: Waiting on medical integration

PARAMS_1(_unit);

if (_unit getVariable [QGVAR(isSurrendering), false]) then {  //If surrendering, stop
    [_unit, _false] call FUNC(surrender);
};
