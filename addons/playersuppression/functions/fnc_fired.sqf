/*
 * Author: LAxemann
 * initial checks, gets config values etc, input from the fired EH
 */
#include "script_component.hpp"

private ["_unit"];
_unit		= _this select 0;         // Unit that shot the projectile
if ((ACE_player distance _unit ) >= 2700) exitWith {};
if ((side effectiveCommander (vehicle _unit)) != (side player)) then {
    private ["_ammo", "_weapon", "_projectile", "_config", "_hit", "_dDist"];
    _weapon     = _this select 1;     // Weapon fired
    if (((toLower _weapon) in ["throw","put"])) exitWith {};

    _ammo		= _this select 4;    // Ammo shot
    _projectile = _this select 6;    // The projectile (duh!)
    if (isNil "_projectile") exitWith {};	

    _config     = configFile >> "CfgAmmo" >> _ammo;    // Get the config path
    _hit        = getNumber (_config >> "hit");        
    if (_hit == 0) exitWith {};

    _dDist       = (7 + (_hit / 2) ) min 28;           // Calculate the detectionDistance (dDist)

    [FUNC(perFrame), 0, [_projectile, _dDist, _hit]] call CBA_fnc_addPerFrameHandler;	
};