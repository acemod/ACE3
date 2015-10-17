/*
 * Author: PabstMirror
 * Handles the "ace_common_allowDamage" synced event
 *
 * Arguments:
 * 0: object<OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [box1] call ace_common_fnc_handleAllowDamage;
 *
 * Public: No
 */
 #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_object"];
(_object getVariable [QGVAR(allowDamage), [-1, -1]]) params ["_blockCollisionNum", "_blockDamageNum"];

TRACE_3("",_object,_blockCollisionNum,_blockDamageNum);

if (_blockDamageNum > 0) then {
    TRACE_1("allowDamage false",_blockDamageNum);
    _object allowDamage false;
} else {
    TRACE_1("allowDamage true",_blockDamageNum);
    _object allowDamage true;
};

local _collisionHandler = _object getVariable [QGVAR(allowCollisionHandler), -1];
if (_blockCollisionNum > 0) then {
    if (_collisionHandler == -1) then {
        TRACE_1("Adding HandleDamage EH", _collisionHandler);
        _collisionHandler = _object addEventHandler ["HandleDamage", {
            params ["_object", "", "", "", "_projectile", "_index"];
            TRACE_1("HD",_this);
            if (!local _unit) exitWith {nil};
            if (_projectile != "") exitWith {nil};
            local _return = if (_index < 0) then {damage _object} else {_object getHitIndex _index};
            TRACE_1("blocking",_return);
            _return
        }];
        _object setVariable [QGVAR(allowCollisionHandler), _collisionHandler];
    };
} else {
    if (_collisionHandler != -1) then {
        TRACE_1("Removing HandleDamage EH", _collisionHandler);
        _object removeEventHandler ["HandleDamage", _collisionHandler];
        _object setVariable [QGVAR(allowCollisionHandler), nil];
    };
};

nil
