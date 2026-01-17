#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handles when a unit gets in to a vehicle. Releases escorted captive when entering a vehicle.
 *
 * Arguments:
 * 0: Vehicle (not used) <OBJECT>
 * 1: Role (not used) <STRING>
 * 2: Unit <OBJECT>
 * 3: Turret <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "driver", player, []] call ace_captives_fnc_handleGetIn
 *
 * Public: No
 */

params ["", "", "_unit", "_turretPath"];
TRACE_1("params",_this);

if (!local _unit) exitWith {};

if (_unit getVariable [QGVAR(isEscorting), false]) then {
    _unit setVariable [QGVAR(isEscorting), false, true];
};

if (_unit getVariable [QGVAR(isSurrendering), false]) then {
    [_unit, false] call FUNC(setSurrendered);
};

if !(_unit getVariable [QGVAR(isHandcuffed), false]) exitWith {};

// Need to force animation for FFV turrets
if (_turretPath isEqualTo []) exitWith {};

TRACE_1("Setting FFV Handcuffed Animation",_turretPath);
[_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
[_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
