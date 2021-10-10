#include "script_component.hpp"
/*
 * Author: SilentSpike
 * PV event handler to update the AI skill on all machines when set by zeus module
 *
 * Arguments:
 * 0: Variable name <STRING>
 * 1: Variable new value <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleGlobalSetSkill
 *
 * Public: No
 */

params ["_varName", "_varValue"];
_varValue params ["_general", "_accuracy", "_handling", "_spotting", "_cover", "_combat"];
TRACE_1("Params",_this);

TRACE_1("AI settings updated",GVAR(GlobalSkillAI));
{
    if (local _x) then {
        _x setSkill ["general", _general];
        _x setSkill ["commanding", _general];
        _x setSkill ["courage", _general];
        _x setSkill ["aimingAccuracy", _accuracy];
        _x setSkill ["aimingShake", _handling];
        _x setSkill ["aimingSpeed", _handling];
        _x setSkill ["reloadSpeed", _handling];
        _x setSkill ["spotDistance", _spotting];
        _x setSkill ["spotTime", _spotting];

        if (_cover) then {
            _x enableAI "COVER";
        } else {
            _x disableAI "COVER";
        };

        if (_combat) then {
            _x enableAI "AUTOCOMBAT";
        } else {
            _x disableAI "AUTOCOMBAT";
        };
    };
} forEach allUnits;
