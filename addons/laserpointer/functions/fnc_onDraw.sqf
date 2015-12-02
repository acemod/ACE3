/*
 * Author: commy2
 * Draw the visible laser beams of all cached units.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private _isIR = currentVisionMode ACE_player;

if (_isIR == 2) exitWith {};

_isIR = _isIR == 1;

private _brightness = 2 - call EFUNC(common,ambientBrightness);

{
    private _weapon = currentWeapon _x;
    private _laser = (_x weaponAccessories _weapon) select 1;

    if (_laser != "") then {
        private _cacheName = format [QGVAR(laser_%1), _laser];
        private _laserID = missionNamespace getVariable [_cacheName, -1];

        if (missionNamespace getVariable [_cacheName, -1] == -1) then {
            _laserID = getNumber (configFile >> "CfgWeapons" >> _laser >> "ACE_laserpointer");
            missionNamespace setVariable [_cacheName, _laserID];
        };

        if (_laserID > 0 && {_x isFlashlightOn _weapon}) then {
            [_x, 100, (_laserID == 2 || _isIR), _brightness] call FUNC(drawLaserpoint);
        };
    };
    false
} count GVAR(nearUnits);
