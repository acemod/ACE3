/*
 * Author: rufix
 * Fired EH. If guidance is enabled for projectile, it will start the guidance PFH.
 *
 * Arguments:
 * 0: Shooter (Man/Vehicle) <OBJECT>
 * 4: Ammo <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "", "", "Bo_GBU12_LGB", "", myBomb] call ace_bombs_fnc_onFired;
 *
 * Public: No
 */
 
#include "script_component.hpp"

params ["_shooter","","","","_ammo","","_projectile"];

// Exit if not Bomb
if (!(_ammo isKindOf "BombCore")) exitWith {};

// Exit if guidance is disabled for this ammo
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};

// Exit on locality of the projectile, it should be local to us
if (!local _projectile) exitWith {};

// // Verify ammo has explicity added guidance config (ignore inheritances)
// private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
// if ((count _configs) < 1) exitWith {};

// Bomb Guidance is enabled for this shot
TRACE_4("enabled",_shooter,_ammo,_projectile,typeOf _shooter);

private _config = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);

private _seekerType = _shooter getVariable [QGVAR(seekerType), nil];
if (isNil "_seekerType" || {!(_seekerType in (getArray (_config >> "seekerTypes")))}) then {
    _seekerType = getText (_config >> "defaultSeekerType");
};
private _laserCode = _shooter getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _laserInfo = [_laserCode, ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_WAVELENGTH];
private _gpsTarget = _shooter getVariable [QGVAR(gpsTarget), nil];

private _arguments = [	
	_this,											// _firedParams
	[												// _seekerParams
		_seekerType,
		_laserInfo,
		_gpsTarget
	], [											// _seekerConfig
		getNumber (_config >> "seekerAngle"),
		getNumber (_config >> "seekerAccuracy"),
		getNumber (_config >> "seekerMaxRange")
	], 
	getNumber (_config >> "steeringAngle"),			// _steeringAngle
	[diag_tickTime, [], []]							// _stateParams
];

[FUNC(guidancePFH), 0, _arguments] call CBA_fnc_addPerFrameHandler;

/*
	PFH starten.
*/