#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

diag_log "running respawn";
[_unit] call FUNC(init);
