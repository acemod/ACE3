#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Change the laser key code (both seeker and transmitter)
 *
 * Argument:
 * 0: Change in code <NUMBER>
 *
 * Return Value:
 * Key Handled <BOOL>

 * Example:
 * [1] call ace_laser_fnc_keyLaserCodeChange;
 *
 * Public: No
 */

params [["_codeChange", 0, [0]]];

TRACE_1("params",_codeChange);

if ((!alive ACE_player) || {!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))}) exitWith {false};

private _currentShooter = objNull;
private _currentWeapon = "";

if (isNull (ACE_controlledUAV param [0, objNull])) then {
    if (ACE_player call CBA_fnc_canUseWeapon) then {
        _currentShooter = ACE_player;
        _currentWeapon = currentWeapon ACE_player;
    } else {
        _currentShooter = vehicle ACE_player;
        private _turretPath = _currentShooter unitTurret ACE_player;
        _currentWeapon = _currentShooter currentWeaponTurret _turretPath;
    };
} else {
    _currentShooter = ACE_controlledUAV select 0;
    private _turretPath = ACE_controlledUAV select 2;
    _currentWeapon = _currentShooter currentWeaponTurret _turretPath;
};

TRACE_2("",_currentShooter,_currentWeapon);
private _currentWeaponCfg = configFile >> "CfgWeapons" >> _currentWeapon;
if (
    (getNumber (_currentWeaponCfg  >> "laser") == 0) &&
    {
        !(_currentShooter getVariable [QGVAR(hasLaserSpotTracker), false])  &&
        {(getNumber (_currentWeaponCfg >> QGVAR(canSelect))) == 0}
    }
) exitWith {false};

private _oldLaserCode = _currentShooter getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
private _newLaserCode = 0;

// "Four-digit code equipment settings range from 1111 to 1788"
// While there is a 0 or 9 in code, keep adding change

_codeChange = floor((_codeChange max 0) min 2);
private _placeValue = 10 ^ _codeChange;

private _oldDigit = (floor(_oldLaserCode / _placeValue)) % 10;
private _newDigit = _oldDigit + 1;
private _limit = 8;
if (_codeChange == 2) then {_limit = 7};

if (_newDigit > _limit) then {_newDigit = 1};

for "_i" from 0 to 3 step 1 do {
    private _digit = floor(_oldLaserCode / (10 ^ _i)) mod 10;
    if (_i == _codeChange) then {
        _digit = _newDigit;
    };
    _newLaserCode = _newLaserCode +  (_digit * 10 ^ _i);
};

TRACE_2("",_oldLaserCode,_newLaserCode);

if (_oldLaserCode != _newLaserCode) then {
    _currentShooter setVariable [QGVAR(code), _newLaserCode, true];
};
[format ["%1: %2", localize LSTRING(laserCode), _newLaserCode]] call EFUNC(common,displayTextStructured);

true
