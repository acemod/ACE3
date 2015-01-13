private ["_unit", "_container", "_item", "_itemCargo", "_spareBarrelCount", "_ambientTemperature", "_spareBarrelTemperature", "_spareBarrelUpdateTime"];
_unit      = _this select 0;
_container = _this select 1;
_item      = _this select 2;

if (_unit != player) exitWith {};
if (!([configFile >> "CfgWeapons" >> _item, "cse_sparebarrelbag"] call cse_fnc_inheritsFrom)) exitWith {};
if (_container == uniformContainer player || _container == vestContainer player || _container == backpackContainer player) exitWith {};

_itemCargo = getItemCargo _container;
_spareBarrelCount = 0;
{
	if (_x == _item) exitWith {
		_spareBarrelCount = (_itemCargo select 1) select _forEachIndex;
	};
} forEach (_itemCargo select 0);

_ambientTemperature = 15;
if (["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) then {
	_ambientTemperature = ((getPosASL _unit) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
};

_spareBarrelTemperature = _ambientTemperature;
_spareBarrelUpdateTime = diag_tickTime;

if (_spareBarrelCount == 0) then {
	// Assume that we took an already used spare barrel
	_spareBarrelTemperature = _container getVariable [format["CSE_BarrelTemperature_%1", _item], _ambientTemperature];
	_spareBarrelUpdateTime = _container getVariable [format["CSE_BarrelUpdateTime_%1", _item], diag_tickTime];
	_container setVariable [format["CSE_BarrelTemperature_%1", _item], nil];
	_container setVariable [format["CSE_BarrelUpdateTime_%1", _item], nil];
};

_unit setVariable [format["CSE_BarrelTemperature_%1", _item], _spareBarrelTemperature];
_unit setVariable [format["CSE_BarrelUpdateTime_%1", _item], _spareBarrelUpdateTime];
