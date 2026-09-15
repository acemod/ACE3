#include "..\script_component.hpp"
/*
 * Author: Nic547, commy2
 * Restarts the handcuffing animation if it was interrupted. Called from a AnimChanged EH.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ACE_AmovPercMstpSsurWnonDnon"] call ace_captives_fnc_handleAnimChangedHandcuffed
 *
 * Public: No
 */

params ["_unit", "_newAnimation"];
TRACE_2("AnimChanged",_unit,_newAnimation);

private _vehicle = objectParent _unit;

if (isNull _vehicle) then {
    if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {_unit call EFUNC(common,isAwake)}) then {
        TRACE_1("Handcuff animation interrupted",_newAnimation);
        [_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
    };
} else {
    private _turretPath = _vehicle unitTurret _unit;
    TRACE_1("turret Path",_turretPath);
    if (_turretPath in [[], [-1]]) exitWith {};

    TRACE_1("Handcuff (FFV) animation interrupted",_newAnimation);
    [_unit, "ACE_HandcuffedFFV", 2] call EFUNC(common,doAnimation);
    [_unit, "ACE_HandcuffedFFV", 1] call EFUNC(common,doAnimation);
};
