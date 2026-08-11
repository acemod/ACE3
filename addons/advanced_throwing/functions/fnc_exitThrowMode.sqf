#include "..\script_component.hpp"
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

params ["_unit", "_reason"];
TRACE_2("params",_unit,_reason);

if !(_unit getVariable [QGVAR(inHand), false]) exitWith {};

TRACE_1("Exit Throw Mode",_reason);

private _activeThrowable = _unit getVariable [QGVAR(activeThrowable), objNull];
if !(_unit getVariable [QGVAR(primed), false]) then {
    deleteVehicle _activeThrowable;
} else {
    _unit setVariable [QGVAR(lastThrownTime), CBA_missionTime];
    // Fix floating for throwables without proper physics (eg. IR Grenade)
    _activeThrowable setVelocity [0, 0, -0.1];

    // Set thrower
    private _instigator = (getShotParents _activeThrowable) param [1, _unit]; // getShotParents could be [] on replaced grenades (like IR chemlight)
    [QEGVAR(common,setShotParents), [_activeThrowable, _unit, _instigator]] call CBA_fnc_serverEvent;
};

// Restore muzzle ammo (setAmmo has no impact if no applicable throwable in inventory)
_unit setAmmo (_unit getVariable [QGVAR(activeMuzzle), ["", -1]]);

_unit setVariable [QGVAR(inHand), false];
_unit setVariable [QGVAR(primed), false];
_unit setVariable [QGVAR(activeThrowable), objNull];
_unit setVariable [QGVAR(activeMuzzle), ["", -1]];
_unit setVariable [QGVAR(throwMod), THROW_MODIFER_DEFAULT];
_unit setVariable [QGVAR(throwSpeed), THROW_SPEED_DEFAULT];
_unit setVariable [QGVAR(dropMode), false];
_unit setVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT];

// Remove controls hint (check if ever enabled is inside the function)
call EFUNC(interaction,hideMouseHint);

// Hide wind info after throw, if it was temporarily enabled for the throw
if (GVAR(tempWindInfo)) then {
    EGVAR(weather,WindInfo) = false;
    GVAR(tempWindInfo) = false;
};

// Remove throw action
[_unit, "DefaultAction", _unit getVariable [QGVAR(throwAction), -1]] call EFUNC(common,removeActionEventHandler);

// Remove throw arc draw
if (!isNil QGVAR(draw3DHandle)) then {
    removeMissionEventHandler ["Draw3D", GVAR(draw3DHandle)];
    GVAR(draw3DHandle) = nil;
};
