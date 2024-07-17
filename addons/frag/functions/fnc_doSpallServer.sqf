#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates the requested spall on the server given a location, direction, and velocity.
 *
 * Arguments:
 * 0: A spherical coordinate vector of spall velocity <ARRAY>
 * 1: You're going to have to ask Nouber what this means <NUMBER>
 * 2: The position (ASL) of the spalling point <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[1000, 45, 60], 0.8, getPosASL ace_player] call ace_frag_fnc_doSpallServer
 *
 * Public: No
 */
#define WEIGHTED_SIZE [QGVAR(spall_small), 4, QGVAR(spall_medium), 3, QGVAR(spall_large), 2, QGVAR(spall_huge), 1]
params ["_spallVelocity", "_vm", "_spallPos"];

// diag_log text format ["SPALL POWER: %1", _spallVelocity select 0];
private _spread = 15 + (random 25);
private _spallCount = 5 + (random 10);
TRACE_1("",_spallCount);
for "_i" from 1 to _spallCount do {
    private _elev = ((_spallVelocity select 2) - _spread) + (random (_spread * 2));
    private _dir = ((_spallVelocity select 1) - _spread) + (random (_spread * 2));
    if (abs _elev > 90) then {
        ADD(_dir,180);
    };
    _dir = _dir % 360;
    private _vel = (_spallVelocity select 0) * 0.33 * _vm;
    _vel = (_vel - (_vel * 0.25)) + (random (_vel * 0.5));

    private _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
    private _fragment = (selectRandomWeighted WEIGHTED_SIZE) createVehicle [0,0,10000];
    _fragment setPosASL _spallPos;
    _fragment setVelocity _spallFragVect;

    #ifdef DRAW_FRAG_INFO
        [_fragment, "orange", true] call FUNC(dev_trackObj);
    #endif
};

_spread = 5 + (random 5);
_spallCount = 3 + (random 5);
for "_i" from 1 to _spallCount do {
    private _elev = ((_spallVelocity select 2) - _spread) + (random (_spread * 2));
    private _dir = ((_spallVelocity select 1) - _spread) + (random (_spread * 2));
    if (abs _elev > 90) then {
        ADD(_dir,180);
    };
    _dir = _dir % 360;
    private _vel = (_spallVelocity select 0) * 0.55 * _vm;
    _vel = (_vel - (_vel * 0.25)) + (random (_vel * 0.5));

    private _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
    private _fragment = (selectRandomWeighted WEIGHTED_SIZE) createVehicle [0, 0, 10000];
    _fragment setPosASL _spallPos;
    _fragment setVelocity _spallFragVect;

    #ifdef DRAW_FRAG_INFO
        [_fragment, "orange", true] call FUNC(dev_trackObj);
    #endif
};