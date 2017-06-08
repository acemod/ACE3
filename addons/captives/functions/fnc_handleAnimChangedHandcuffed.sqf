/*
 * Author: Nic547, commy2
 * Restart the handcuffing animation if it got interrupted. Called from a AnimChanged EH.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: New animation <STRING>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */


#include "script_component.hpp"

params ["_unit", "_newAnimation"];
TRACE_2("AnimChanged",_unit,_newAnimation);
if (_unit == (vehicle _unit)) then {
    if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
        TRACE_1("Handcuff animation interrupted",_newAnimation);
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
    };
} else {
    private _turretPath = [];
    {
        _x params ["_xUnit", "", "", "_xTurretPath"];
        if (_unit == _xUnit) exitWith {_turretPath = _xTurretPath};
    } forEach (fullCrew (vehicle _unit));
    TRACE_1("turret Path",_turretPath);
    if (_turretPath isEqualTo []) exitWith {};

    TRACE_1("Handcuff (FFV) animation interrupted",_newAnimation);
    [_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
    [_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
};
