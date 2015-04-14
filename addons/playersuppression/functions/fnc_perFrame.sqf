/*
 * Author: LAxemann
 * perFrame checks after firing the projectile
 *
 * Arguments:
 * 0: projectile
 * 1: detection distance for the projectile
 * 2: "hit"/effectiveness value
 */
#include "script_component.hpp"

private ["_projectile","_dDist","_hit","_pPos"];
_projectile = _this select 0 select 0;
_dDist      = _this select 0 select 1;
_hit        = _this select 0 select 2;
_pPos       = getPosATL _projectile;

if !(alive _projectile) then {
    [_this select 1] call CBA_fnc_removePerFrameHandler
} else
{
    if ((ACE_player distance _projectile) <= _dDist) then {
        private ["_divisor"];
        _divisor =  GVAR(overhead_divisor);
        if (lineIntersects [ATLtoASL _pPos, eyePos ACE_player, ACE_player]) then {
            _dDist = _dDist * 0.65
        };

        if ((_pPos distance ACE_player) <= _dDist) then {
            _divisor = GVAR(impact_divisor);
            GVAR(lastShotAt) = time;
			
            if ((_pPos distance ACE_player) <= 4.3) then {
                [] spawn FUNC(impact);
            };
        };
		
        if (_divisor != 0) then {
            if ((vehicle ACE_player == ACE_player) || (isTurnedOut ACE_player)) then {
                GVAR(threshold) = GVAR(threshold) + (_hit/_divisor);
                if (GVAR(threshold) >= GVAR(border)) then {

                    if (GVAR(threshold) > GVAR(maxValue)) then {
                        GVAR(threshold) = GVAR(maxValue);
                    };

                    if !(GVAR(isSuppressed)) then
                    {
                        [FUNC(pinnedDown), 0.5, [] ] call CBA_fnc_addPerFrameHandler;	
                    };
                };		
            };
        };
        [_this select 1] call CBA_fnc_removePerFrameHandler
    };
};