#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Fires the laser to acquire the target
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_yardage450_fnc_acquireTarget
 *
 * Public: No
 */

// Reference: http://www.optcorp.com/pdf/Bushnell/YardageProSport.pdf
#define MIN_DISTANCE ([9, 10] select GVAR(useYards))
#define MAX_DISTANCE ([732, 800] select GVAR(useYards))
#define METERING_POINT_NUMBER 8

GVAR(lasing) = true;
GVAR(targetAcquired) = false;

GVAR(distances) = [];
GVAR(distanceIndex) = -1;

[{
    if (GVAR(targetAcquired) || !GVAR(powerButtonPressed)) exitWith {
        GVAR(lasing) = false;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    ([eyePos ACE_player, ACE_player weaponDirection (currentWeapon ACE_player), ACE_player] call EFUNC(laser,shootRay)) params ["", "_distance"];

    GVAR(distanceIndex) = (GVAR(distanceIndex) + 1) % METERING_POINT_NUMBER;
    GVAR(distances) set [GVAR(distanceIndex), _distance - 1 + (random 2)];

    if (count GVAR(distances) == METERING_POINT_NUMBER) then {
        private _min = selectMin GVAR(distances);
        private _max = selectMax GVAR(distances);

        if (_max - _min < 5) then {
            private _range = (_min + _max) / 2;
            if (_range >= MIN_DISTANCE && _range <= MAX_DISTANCE) then {
                GVAR(targetAcquired) = true;
                GVAR(targetRangeText) = Str(round(_range));
            };
        };
    };
}, 0.1, []] call CBA_fnc_addPerFrameHandler;
