/*
 * Author: marc_book, commy2
 */

#include <Macros.hqf>

private ["_vehicle", "_displayName", "_string", "_height", "_damage", "_name"];

_vehicle = _this select 0;

_displayName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

_string = format ["<t align='center' size='0.8'>%1<br/><br/>", format [localize "STR_AGM_Repair_VehicleName", _displayName]];
_height = 1;

{
	_damage = floor (3 * (_vehicle getHitPointDamage _x));

	if (!isNil "_damage" && {_damage > 0}) then {
		_name = [_x] call AGM_Repair_fnc_getHitPointName;
		_string = _string + format [localize (["STR_AGM_Repair_HitPointDamaged", "STR_AGM_Repair_HitPointDamagedHeavy", "STR_AGM_Repair_HitPointDestroyed"] select (_damage - 1)), _name] + "<br/>";
		_height = _height + 0.25;
	};
} forEach ALL_HITPOINTS;

if (_height == 1) then {
	_string = _string + localize "STR_AGM_Repair_Nothing";
	_height = 1.25;
};

_string = _string + "</t>";
[composeText [lineBreak, parseText _string], _height] call AGM_Core_fnc_displayTextStructured;
