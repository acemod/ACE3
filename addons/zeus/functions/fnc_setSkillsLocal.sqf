#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

{
    _unit setSkill [_x, GVAR(aiSkill_general)];
} forEach ["general", "commanding", "courage"];
{
    _unit setSkill [_x, GVAR(aiSkill_aimingAccuracy)];
} forEach ["aimingAccuracy"];
{
    _unit setSkill [_x, GVAR(aiSkill_weaponHandling)];
} forEach ["aimingShake", "aimingSpeed", "reloadSpeed"];
{
    _unit setSkill [_x, GVAR(aiSkill_spotting)];
} forEach ["spotDistance", "spotTime"];
if (GVAR(aiSkill_COVER)) then {
    _unit enableAI "COVER";
} else {
    _unit disableAI "COVER";
};
if (GVAR(aiSkill_AUTOCOMBAT)) then {
    _unit enableAI "AUTOCOMBAT";
} else {
    _unit disableAI "AUTOCOMBAT";
};

TRACE_1("ai sills set",_unit);
