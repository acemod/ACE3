/**
 * fn_getPercentageAmmoMagazine_EQ.sqf
 * @Descr: Get percentage of ammo in currentMagazine left.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: NUMBER A number between 100 and 0, with 100 being a full magazine and 0 being empty (No ammo left).
 * @PublicAPI: true
 */

private ["_unit", "_percentage", "_maxAmmoCount", "_currentAmmoCount"];
_unit = _this select 0;
_percentage = 0;

if (currentWeapon _unit != "") then {
	{
		if (_x select 4 == currentMuzzle _unit) exitWith {
			_currentAmmoCount = _x select 1;
			_maxAmmoCount = getNumber(configFile >> "CfgMagazines" >> (_x select 0) >> "count");
			if (_maxAmmoCount > 0) then {
				_percentage = (_currentAmmoCount / _maxAmmoCount) * 100;
			};
		};
	} forEach (magazinesAmmoFull _unit);
};

_percentage
