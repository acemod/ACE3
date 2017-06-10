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
#include "script_component.hpp"

params [["_codeChange", 0, [0]]];

TRACE_1("params",_codeChange);

if ((!alive ACE_player) || {!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))}) exitWith {false};

private _currentShooter = objNull;
private _currentWeapon = "";

if (ACE_player call CBA_fnc_canUseWeapon) then {
    _currentShooter = ACE_player;
    _currentWeapon = currentWeapon ACE_player;
} else {
    _currentShooter = vehicle ACE_player;
    private _turretPath = if (ACE_player == (driver _currentShooter)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    _currentWeapon = _currentShooter currentWeaponTurret _turretPath;
};

TRACE_2("",_currentShooter,_currentWeapon);
if (((getNumber (configFile >> "CfgWeapons" >> _currentWeapon >> "laser")) == 0) &&
        {(getNumber (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(canSelect))) == 0}) exitWith {false};

private _oldLaserCode = _currentShooter getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
private _newLaserCode = _oldLaserCode;

// "Four-digit code equipment settings range from 1111 to 1788"
// While there is a 0 or 9 in code, keep adding change

if (((_codeChange < 0) && {_oldLaserCode > ACE_DEFAULT_LASER_CODE}) || {(_codeChange > 0) && {_oldLaserCode < 1788}}) then {
    _newLaserCode = _oldLaserCode + _codeChange;
    while {(((str _newLaserCode) find "0") >= 0) || {((str _newLaserCode) find "9") >= 0}} do {
        _newLaserCode = _newLaserCode + _codeChange;
    };
};

TRACE_2("",_oldLaserCode,_newLaserCode);

if (_oldLaserCode != _newLaserCode) then {
    _currentShooter setVariable [QGVAR(code), _newLaserCode, true];
};
[format ["%1: %2", localize LSTRING(laserCode), _newLaserCode]] call EFUNC(common,displayTextStructured);

true
