/*
 * Author: Dslyecxi, Jonpas
 * Exits throw mode.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, "reason"] call ace_advanced_throwing_fnc_exitThrowMode
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_reason"];
TRACE_2("params",_unit,_reason);

if !(_unit getVariable [QGVAR(inHand), false]) exitWith {};

#ifdef DEBUG_MODE_FULL
    systemChat format ["Exit Throw Mode: %1", _reason];
#endif

if !(_unit getVariable [QGVAR(primed), false]) then {
    deleteVehicle (_unit getVariable [QGVAR(activeThrowable), objNull]);
};

_unit setVariable [QGVAR(inHand), false];
_unit setVariable [QGVAR(primed), false];
_unit setVariable [QGVAR(activeThrowable), objNull];
_unit setVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];
_unit setVariable [QGVAR(throwSpeed), THROW_SPEED_DEFAULT];
_unit setVariable [QGVAR(dropMode), false];
_unit setVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT];

// Remove controls hint (check if ever enabled is inside the function)
call EFUNC(interaction,hideMouseHint);

// Remove throw action
[_unit, "DefaultAction", _unit getVariable [QGVAR(throwAction), -1]] call EFUNC(common,removeActionEventHandler);

// Remove throw arc draw
if (!isNil QGVAR(draw3DHandle)) then {
    removeMissionEventHandler ["Draw3D", GVAR(draw3DHandle)];
    GVAR(draw3DHandle) = nil;
};
