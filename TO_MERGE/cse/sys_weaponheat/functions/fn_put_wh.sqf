private ["_unit", "_container", "_item", "_itemCargo", "_ambientTemperature", "_spareBarrelTemperature", "_spareBarrelUpdateTime"];
_unit      = _this select 0;
_container = _this select 1;
_item      = _this select 2;

if (_unit != player) exitWith {};
if (!([configFile >> "CfgWeapons" >> _item, "cse_sparebarrelbag"] call cse_fnc_inheritsFrom)) exitWith {};
if (_container == uniformContainer player || _container == vestContainer player || _container == backpackContainer player) exitWith {};

_ambientTemperature = 15;
if (["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) then {
	_ambientTemperature = ((getPosASL _unit) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
};

_spareBarrelTemperature = _unit getVariable [format["CSE_BarrelTemperature_%1", _item], _ambientTemperature];
_spareBarrelUpdateTime = _unit getVariable [format["CSE_BarrelUpdateTime_%1", _item], diag_tickTime];

_container setVariable [format["CSE_BarrelTemperature_%1", _item], _spareBarrelTemperature, true];
_container setVariable [format["CSE_BarrelUpdateTime_%1", _item], _spareBarrelUpdateTime, true];
