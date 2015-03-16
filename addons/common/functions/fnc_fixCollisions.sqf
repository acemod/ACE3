/*
 * Author: commy2
 * Attempt to fix physx collisions causing unreasonable impact forces and damage.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 */
#include "script_component.hpp"

private "_object";

_object = _this select 0;

if (!local _object) exitWith {};

// ignore collision damage
_object setVariable [QGVAR(fixCollisionsDamage), damage _object];

private ["_ehID", "_vectorDirAndUp"];

_ehID = _object addEventHandler ["HandleDamage", {

    if (isNull (_this select 3)) exitWith {
        (_this select 0) getVariable [QGVAR(fixCollisionsDamage), 0];
    };
    (_this select 0) setVariable [QGVAR(fixCollisionsDamage), _this select 2];

    _this select 2

}];

_vectorDirAndUp = [vectorDir _object, vectorUp _object];

[{
    private ["_object", "_ehID", "_vectorDirAndUp", "_timeOut"];

    _object = _this select 0 select 0;
    _ehID = _this select 0 select 1;
    _vectorDirAndUp = _this select 0 select 2;
    _timeOut = _this select 0 select 3;

    // adjust vector to prevent fliping
    _object setVectorDirAndUp _vectorDirAndUp;systemChat str damage _object;//

    if (time > _timeOut) exitWith {
        _object removeEventHandler ["HandleDamage", _ehID];hint str time;//

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

}, 0, [_object, _ehID, _vectorDirAndUp, time + 2]] call CBA_fnc_addPerFrameHandler;
