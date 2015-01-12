/**
 * fn_generateSmoke_wh.sqf
 * @Descr: Generates a smoke effect based on barrel temperature
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING, _bullet OBJECT, barrelTemperature NUMBER]
 * @Return: nil
 * @PublicAPI: false
 */
 
 
private ["_unit", "_weapon", "_muzzle", "_bullet", "_bulletPosition", "_weaponDirection", "_intensity", "_particlePosition", "_distance"];
_unit              = _this select 0;
_weapon            = _this select 1;
_muzzle            = _this select 2;
_bullet            = _this select 3;
_barrelTemperature = _this select 4;

if (_barrelTemperature < 80) exitWith {};

_bulletPosition = getPosATL _bullet;
_weaponDirection = _unit weaponDirection _weapon;
_intensity = (_barrelTemperature / 2000) min 0.3;

{
	_distance = 0.05 + random 0.27;
	_particlePosition = _bulletPosition vectorAdd (_weaponDirection vectorMultiply _distance);
	drop ["\A3\data_f\missileSmoke", "", "Billboard", 1, 1.5,_particlePosition, [0, 0, 0], 1, 7.0, 5.5, 0.075,[0.28, 0.33, 0.37], [[.5, .5, .5, _intensity], [.6, .6, .6,_intensity*0.2]], [random 1,random 1,random 1], 0, 0, "", "", ""];
} forEach [0, 1];
