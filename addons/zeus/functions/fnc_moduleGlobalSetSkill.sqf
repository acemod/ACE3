/*
 * Author: SilentSpike
 * PV event handler to update the AI skill on all machines when set by zeus module
 *
 * Arguments:
 * 0: Variable name <STRING>
 * 1: Variable new value <ANY>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * "ace_zeus_GlobalSkillAI" addPublicVariableEventHandler ace_zeus_fnc_moduleGlobalSetSkill
 *
 * Public: No
 */

#include "script_component.hpp"

_this params ["_varName","_varValue"];
_varValue params ["_general","_accuracy","_handling","_spotting","_cover","_combat"];
TRACE_1("Params",_this);

TRACE_6("AI settings updated",GVAR(GlobalSkillAI));
{
    if (local _x) then {
        _unit setSkill ["general", _general];
        _unit setSkill ["commanding", _general];
        _unit setSkill ["courage", _general];
        _unit setSkill ["aimingAccuracy", _accuracy];
        _unit setSkill ["aimingShake", _handling];
        _unit setSkill ["aimingSpeed", _handling];
        _unit setSkill ["reloadSpeed", _handling];
        _unit setSkill ["spotDistance", _spotting];
        _unit setSkill ["spotTime", _spotting];

        if (_cover) then {
            _unit enableAI "COVER";
        } else {
            _unit disableAI "COVER";
        };

        if (_combat) then {
            _unit enableAI "AUTOCOMBAT";
        } else {
            _unit disableAI "AUTOCOMBAT";
        };
    };
} forEach allUnits;
