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
#include "script_component.hpp"

// Reference: http://www.optcorp.com/pdf/Bushnell/YardageProSport.pdf
#define MIN_DISTANCE ([9, 10] select GVAR(useYards))
#define MAX_DISTANCE ([732, 800] select GVAR(useYards))
#define METERING_POINT_NUMBER 8

private ["_result", "_distance", "_min", "_max", "_range"];

GVAR(lasing) = true;
GVAR(targetAcquired) = false;

GVAR(distances) = [];
GVAR(distanceIndex) = -1;

[{
    if (GVAR(targetAcquired) || !GVAR(powerButtonPressed)) exitWith {
        GVAR(lasing) = false;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    _result = [eyePos ACE_player, ACE_player weaponDirection (currentWeapon ACE_player), ACE_player] call EFUNC(laser,shootRay);
    _distance = _result select 1;

    _distance = _distance - 1 + (random 2);

    GVAR(distanceIndex) = (GVAR(distanceIndex) + 1) % METERING_POINT_NUMBER;
    GVAR(distances) set [GVAR(distanceIndex), _distance];

    if (count GVAR(distances) == METERING_POINT_NUMBER) then {
        _min = MAX_DISTANCE;
        _max = MIN_DISTANCE;
        {
            _min = _x min _min;
            _max = _max max _x;
        } forEach GVAR(distances);

        if (abs(_max - _min) < 5) then {
            _range = (_min + _max) / 2;
            if (_range >= MIN_DISTANCE && _range <= MAX_DISTANCE) then {
                GVAR(targetAcquired) = true;
                GVAR(targetRangeText) = Str(round(_range));
            };
        };
    };
}, 0.1, []] call CBA_fnc_addPerFrameHandler;
