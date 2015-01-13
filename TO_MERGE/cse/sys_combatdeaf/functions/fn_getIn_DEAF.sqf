private ["_vehicle", "_position", "_unit", "_handle"];
_vehicle  = _this select 0;
_position = _this select 1;
_unit     = _this select 2;

if (_unit != player) exitWith {};
_handle = _vehicle addEventHandler ["Fired", {_this call cse_fnc_handleFired_DEAF}];

_vehicle setVariable ["cse_combat_deaf_fired_event_handler", _handle];
