// by commy2
#include "script_component.hpp"

private ["_brightness", "_cacheName", "_isIR", "_laser", "_laserID", "_weapon"];

_isIR = currentVisionMode ACE_player;
if (_isIR == 2) exitWith {};

_isIR = _isIR == 1;

_brightness = 2 - call EFUNC(common,ambientBrightness);

{
    _weapon = currentWeapon _x;

    _laser = switch (_weapon) do {
        case (primaryWeapon _x): {
            primaryWeaponItems _x select 1;
        };
        case (secondaryWeapon _x): {
            secondaryWeaponItems _x select 1;
        };
        case (handgunWeapon _x): {
            handgunItems _x select 1;
        };
        default {""};
    };

    if (_laser != "") then {
        _cacheName = format [QGVAR(laser_%1), _laser];
        _laserID = missionNamespace getVariable [_cacheName, -1];
        if (missionNamespace getVariable [_cacheName, -1] == -1) then {
            _laserID = getNumber (configFile >> "CfgWeapons" >> _laser >> "ACE_laserpointer");
            missionNamespace setVariable [_cacheName, _laserID];
        };

        if (_laserID > 0 && {_x isFlashlightOn _weapon}) then {
            [_x, 50, (_laserID == 2 || _isIR), _brightness] call FUNC(drawLaserpoint);
        };
    };

} forEach GVAR(nearUnits);
