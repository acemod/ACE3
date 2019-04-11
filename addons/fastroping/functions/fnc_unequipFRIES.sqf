#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Removes FRIES from helicopter.
 *
 * Arguments:
 * 0: The helicopter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_unequipFRIES
 *
 * Public: Yes
 */
params ["_vehicle"];

deleteVehicle (_vehicle getVariable [QGVAR(FRIES), objNull]);
_vehicle setVariable [QGVAR(FRIES), nil, true];

if !((_vehicle getVariable [QGVAR(deployedRopes), []] isEqualTo [])) then {
    [_vehicle] call FUNC(cutRopes);
};
