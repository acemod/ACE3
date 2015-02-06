#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

if !(local _unit) exitWith {};

diag_log "running init";
_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];

[_unit] call FUNC(init);
