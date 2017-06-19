/*
 * Author: commy2
 * Handles when a unit gets in to a vehicle.  Release escorted captive when entering a vehicle
 *
 * Arguments:
 * 0: _vehicle <OBJECT>
 * 1: dunno <OBJECT>
 * 2: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [car2, x, player] call ACE_captives_fnc_handleGetIn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "","_unit"];
TRACE_2("params",_vehicle,_unit);

if (local _unit) then {
    if (_unit getVariable [QGVAR(isEscorting), false]) then {
        _unit setVariable [QGVAR(isEscorting), false, true];
    };

    if (_unit getVariable [QGVAR(isSurrendering), false]) then {
        [_unit, false] call FUNC(setSurrendered);
    };

    if (_unit getVariable [QGVAR(isHandcuffed), false]) then {
        //Need to force animation for FFV turrets
        private _turretPath = [];
        {
            _x params ["_xUnit", "", "", "_xTurretPath"];
            if (_unit == _xUnit) exitWith {_turretPath = _xTurretPath};
        } forEach (fullCrew (vehicle _unit));
        if (!(_turretPath isEqualTo [])) then {
            TRACE_1("Setting FFV Handcuffed Animation",_turretPath);
            [_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
            [_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
        };
    };
};
