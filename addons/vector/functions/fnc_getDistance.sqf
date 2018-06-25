#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * call ace_vector_fnc_getDistance
 *
 * Public: No
 */

#define MIN_DISTANCE 10
#define MAX_DISTANCE [6000, 9000] select GVAR(useFeet)

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _distance = ctrlText (_dlgVector displayCtrl 151);

if (_distance == "----") exitWith {-1000};

_distance = round parseNumber _distance;

if (GVAR(useFeet)) then {
    _distance = 3.28084 * _distance;
};

if (_distance > MAX_DISTANCE) exitWith {-1000};
if (_distance < MIN_DISTANCE) exitWith {-1000};

_distance
