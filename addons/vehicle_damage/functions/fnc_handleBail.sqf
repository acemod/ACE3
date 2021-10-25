#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handles whether or not the crew should bail.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Can the vehicle move? <BOOL>
 * 2: Can the vehicle shoot? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank1, false, true] call ace_vehicle_damage_fnc_handleBail
 *
 * Public: No
 */

params ["_vehicle", "_canMove", "_canShoot"];
private _isCar = (_vehicle isKindOf "Car" && { !(_vehicle isKindOf "Wheeled_APC_F") });

if (_canMove) then {
    _canMove = alive driver _vehicle;
};

if (_canShoot) then {
    _canShoot = alive gunner _vehicle;
};

_vehicle setVariable[QGVAR(canMove), _canMove];
_vehicle setVariable[QGVAR(canShoot), _canShoot];

private _rand = random 1;

if (_isCar) then {
    if !(_canMove) then {
        [_vehicle] spawn FUNC(abandon);
        LOG_3("[%1] can't move and is bailing and is a car [%2 | %3]",_vehicle,_canMove,_isCar);
    };
} else {
    if (!_canMove && !_canShoot ) exitWith { // If you can't move and you can't shoot, you better GTFO
        [_vehicle] spawn FUNC(abandon);
        LOG_3("[%1] is a sitting duck and is bailing [%2 | %3]",_vehicle,_canMove,_canShoot);
    };

    if (!_canShoot && !_isCar) then {
        if (BAILOUT_CHANCE_SHOOT > _rand) then { // 50% chance of bailing out if turret/gun is destroyed
            [_vehicle] spawn FUNC(abandon);
            LOG_4("[%1] Cannot shoot and is bailing with chance [%2] [%3 | %4]",_vehicle,_rand,_canMove,_canShoot);
        } else {
            _vehicle allowFleeing 1;
            LOG_4("[%1] Cannot shoot and is fleeing with chance [%2] [%3 | %4]",_vehicle,_rand,_canMove,_canShoot);
        };
    };

    if !(_canMove) then {
        if (BAILOUT_CHANCE_MOVE > _rand) then { // 80% Chance of bailing out if engine is destroyed
            [_vehicle] spawn FUNC(abandon);
            LOG_4("[%1] Cannot move and is bailing with chance [%2] [%3 | %4]",_vehicle,_rand,_canMove,_canShoot);
        } else {
            LOG_4("[%1] Cannot move and is bunkering with chance [%2] [%3 | %4]",_vehicle,_rand,_canMove,_canShoot);
        };
    };
};


