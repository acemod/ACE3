private ["_unit", "_weapon"];
_unit   = _this select 0;
_weapon = _this select 1;

if (!([_unit, _weapon] call cse_fnc_canSwapBarrel_wh)) exitWith {};
if (vehicle _unit != _unit && {driver (vehicle _unit) == _unit || commander (vehicle _unit) == _unit || gunner (vehicle _unit) == _unit}) exitWith {};

if (vehicle _unit == _unit && currentWeapon _unit != "" && !(weaponLowered _unit) && (stance _unit != "PRONE")) then {
	_unit action ["WeaponOnBack", _unit];
	waitUntil { weaponLowered _unit }; // probably evil
};

[_unit, _weapon] spawn {
	private ["_unit", "_weapon", "_spareBarrel", "_ambientTemperature", "_barrelTemperature", "_barrelUpdateTime", "_spareBarrelTemperature", "_spareBarrelUpdateTime"];
	_unit   = _this select 0;
	_weapon = _this select 1;

	CSE_ORIGINAL_POSITION_BARREL_EXCHANGE_EQ = getPos _unit;
	// TODO: Prohibit the player from using his weapon during the barrel exchange progress
	CSE_CONDITION_BARREL_EXCHANGE_EQ = {((vehicle _unit != _unit && driver (vehicle _unit) != _unit && commander (vehicle _unit) != _unit && gunner (vehicle _unit) != _unit) || (((getPos _unit) distance CSE_ORIGINAL_POSITION_BARREL_EXCHANGE_EQ) < 1 && (weaponLowered _unit || stance _unit == "PRONE")))};

	// TODO: Play animation
	playSound "cse_weaponheat_barrel_exchange";
	_barrelExchangeSuccess = [15, CSE_CONDITION_BARREL_EXCHANGE_EQ] call cse_fnc_gui_loadingBar;

	if (_barrelExchangeSuccess) then {
		_spareBarrel = getText(configFile >> "CfgWeapons" >> _weapon >> "cse_spareBarrel");
		if (!([_unit, _spareBarrel] call cse_fnc_hasItem)) then {
			_spareBarrel = "cse_sparebarrelbag";
		};
		_ambientTemperature = 15;
		if (["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) then {
			_ambientTemperature = ((getPosASL _unit) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
		};

		_barrelTemperature = _unit getVariable [format["CSE_BarrelTemperature_%1", _weapon], _ambientTemperature];
		_barrelUpdateTime = _unit getVariable [format["CSE_BarrelUpdateTime_%1", _weapon], diag_tickTime];

		_spareBarrelTemperature = _unit getVariable [format["CSE_BarrelTemperature_%1", _spareBarrel], _ambientTemperature];
		_spareBarrelUpdateTime = _unit getVariable [format["CSE_BarrelUpdateTime_%1", _spareBarrel], diag_tickTime];

		_unit setVariable [format["CSE_BarrelTemperature_%1", _weapon], _spareBarrelTemperature];
		_unit setVariable [format["CSE_BarrelUpdateTime_%1", _weapon], _spareBarrelUpdateTime];

		_unit setVariable [format["CSE_BarrelTemperature_%1", _spareBarrel], _barrelTemperature];
		_unit setVariable [format["CSE_BarrelUpdateTime_%1", _spareBarrel], _barrelUpdateTime];
	};
};