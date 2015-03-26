#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

diag_log "running respawn";
[_unit] call FUNC(init);

//Reset captive status for respawning unit
if (!_unit getVariable ["ACE_isUnconscious", false]) then {
    [_unit, QGVAR(unconscious), false] call EFUNC(common,setCaptivityStatus);
};
