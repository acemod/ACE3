#include "script_component.hpp"

GVAR(COMPAT_LRF) = ["Rangefinder", "Laserdesignator"];

private ["_fnc_atragmx"];

_fnc_atragmx = {
    private ["_target", "_position", "_range", "_inclinationAngle"];
    
    if ((local ACE_player) && (currentWeapon ACE_player) in GVAR(COMPAT_LRF) && (!isNull (_this select 0))) then {
        _target = getPosATL (_this select 0);
        _position = getPosATL ACE_player;
        
        _inclinationAngle = asin((ACE_player weaponDirection currentWeapon ACE_player) select 2);
        _range = _position distance _target;
        
        GVAR(inclinationAngle) set [GVAR(currentTarget), _inclinationAngle];
        GVAR(targetRange) set [GVAR(currentTarget), _range];
    };
};

//["ace_sys_rangefinder_Lazing", _fnc_atragmx] call CBA_fnc_addEventHandler;
