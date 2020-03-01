#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Called by "HandleDamage" event handler. Sets up hit array for this frame's damage
 *
 * Arguments:
 * 0: The vehicle
 * 1: Projectile that hit
 * 2: Hit index of potentially damaged part
 * 3: New damage done to part
 *
 * Return Value:
 * 0
 *
 * Example:
 * [myVehicle, projectile, 5, 0.663] call ace_vehicleDamage_fnc_handleDamage;
 *
 *
 * Public: No
 */
params ["_vehicle", "", "_damage", "", "", "_hitIndex", "", "_hitPoint"];
if !(local _vehicle) exitWith { nil };

// set up hit array so we can execute all damage next frame. Always in order of hit done.
private _hitHash = _vehicle getVariable [QGVAR(hitHash), nil];
if (isNil "_hitHash") then {
    _hitHash = [[], nil] call CBA_fnc_hashCreate;
};
private _currentFrameArray = [_hitHash, diag_frameNo] call CBA_fnc_hashGet;
if (isNil "_currentFrameArray") then {
    _currentFrameArray = [];
};
// if a valid hit, process it
if !((_hitPoint find "#light") >= 0 || { _damage <= 0 }) then {
    if (_currentFrameArray isEqualTo []) then {
        [{
            params ["_vehicle", "_processingFrame"];
            private _frameHash = _vehicle getVariable [QGVAR(hitHash), nil];
            private _hitArray = [_frameHash, _processingFrame] call CBA_fnc_hashGet;
            if (_hitArray isEqualTo []) exitWith {};
            
            reverse _hitArray;
            TRACE_3("processing data from old frame",diag_frameNo,_processingFrame,_hitArray);
            {
                _x params ["_vehicle", "_selection", "_damage", "_injurer", "_projectile", "_hitIndex", "", "_hitPoint"];
                private _newDamage = _damage - (_vehicle getHitIndex _hitIndex);
                if !([_vehicle, _hitPoint, _hitIndex, _injurer, _vehicle getHitIndex _hitIndex, _newDamage, _projectile, _selection] call FUNC(handleVehicleDamage)) exitWith {
                    LOG_2("cancelling rest of vehicle damage queue ( [%1] items left out of [%2] )",(count (_hitArray#1)) - _forEachIndex,count (_hitArray#1))
                };
            } forEach _hitArray;
            
            [_frameHash, _processingFrame] call CBA_fnc_hashRem;
            
        }, [_vehicle, diag_frameNo]] call CBA_fnc_execNextFrame;
    };
    _currentFrameArray pushBack _this;
};

[_hitHash, diag_frameNo, _currentFrameArray] call CBA_fnc_hashSet;
_vehicle setVariable [QGVAR(hitHash), _hitHash];

// damage is never to be handled in-engine. Always handle out of engine with this event handler
_vehicle getHitIndex _hitIndex;


