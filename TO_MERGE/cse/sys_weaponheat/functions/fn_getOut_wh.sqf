private ["_vehicle", "_position", "_unit", "_handle"];
_vehicle  = _this select 0;
_position = _this select 1;
_unit     = _this select 2;

if (_unit != player) exitWith {};
_handle = _vehicle getVariable "cse_weapon_heat_fired_event_handler";

if (!isNil "_handle") then {
	_vehicle removeEventHandler ["Fired", _handle];
	_vehicle setVariable ["cse_weapon_heat_fired_event_handler", nil];
};
