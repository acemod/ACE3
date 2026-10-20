#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles whether or not the crew should bail.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_vehicle_damage_fnc_handleBail
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("handleBail",_vehicle);

private _isCar = _vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F" || _vehicle isKindOf "gm_wheeled_APC_base")};

// canFire command is broken, hence the variable
private _canMove = (_vehicle getVariable [QGVAR(canMove), true]) && {alive driver _vehicle};
private _canShoot = (_vehicle getVariable [QGVAR(canShoot), true]) && {alive gunner _vehicle};

_vehicle setVariable [QGVAR(canMove), _canMove];
_vehicle setVariable [QGVAR(canShoot), _canShoot];

private _rand = random 1;

if (_isCar) then {
    if (!_canMove) then {
        _vehicle call FUNC(abandon);

        TRACE_3("car immobile - bailing",_vehicle,_canMove,_isCar);
    };
} else {
    // If you can't move and you can't shoot, you better GTFO
    if (!_canMove && !_canShoot) exitWith {
        _vehicle call FUNC(abandon);

        TRACE_3("immobile and can't shoot - bailing",_vehicle,_canMove,_canShoot);
    };

    if (!_canShoot) then {
        // 50% chance of bailing out if turret/gun is disabled
        if (BAILOUT_CHANCE_SHOOT > _rand) then {
            _vehicle call FUNC(abandon);

            TRACE_4("can't shoot - bailing",_vehicle,_rand,_canMove,_canShoot);
        } else {
            _vehicle allowFleeing 1;

            TRACE_4("fleeing",_vehicle,_rand,_canMove,_canShoot);
        };
    };

    if (!_canMove) then {
        // 80% Chance of bailing out if engine is disabled
        if (BAILOUT_CHANCE_MOVE > _rand) then {
            _vehicle call FUNC(abandon);

            TRACE_4("immobile - bailing",_vehicle,_rand,_canMove,_canShoot);
        } else {
            TRACE_4("immobile - bunkering",_vehicle,_rand,_canMove,_canShoot);
        };
    };
};
