// by commy2
#include "script_component.hpp"

_brightness = 2 - call EFUNC(common,ambientBrightness);
_isIR = currentVisionMode ACE_player;

if (_isIR == 2) exitWith {};

_isIR = _isIR == 1;

{
    _weapon = currentWeapon _x;

    _laser = switch (_weapon) do {
        case (""): {""};
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

    _laserID = ["ACE_acc_pointer_red", "ACE_acc_pointer_green"] find _laser;

    if (_laserID > -1 && {_x isFlashlightOn _weapon}) then {
        [_x, 50, _laserID == 1 || _isIR] call FUNC(drawLaserpoint);
    };

} forEach GVAR(nearUnits);
