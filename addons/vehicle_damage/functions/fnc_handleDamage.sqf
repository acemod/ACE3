#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Called by "HandleDamage" event handler. Sets up hit array for this frame's damage.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Name of selection where unit was damaged <STRING> (unused)
 * 2: Damage taken <NUMBER>
 * 3: Source unit of damage <OBJECT> (unused)
 * 4: Projectile that caused damage <STRING>
 * 5: Hit part index of hit point <NUMBER>
 * 6: Instigator of damage <OBJECT> (unused)
 * 7: Hit point config name <STRING>
 *
 * Return Value:
 * Current or maximum damage of part
 *
 * Example:
 * [myVehicle, projectile, 5, 0.663] call ace_vehicle_damage_fnc_handleDamage;
 *
 * Public: No
 */

params ["_vehicle", "", "_damage", "", "_projectile", "_hitIndex", "", "_hitPoint"];
if !(_projectile in ["ace_ammoExplosion", "ACE_ammoExplosionLarge"]) then {
    if (local _vehicle) then {
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
    };
};

// damage is never to be handled in-engine. Always handle out of engine with this event handler
// don't return 0 or else old parts will be reset in damage
private _returnHit = _vehicle getHitIndex _hitIndex;
private _criticalDamageIndex = (CRITICAL_HITPOINTS findIf { _x isEqualTo _hitPoint }) + 1;
if (_criticalDamageIndex > 0) then {
    _returnHit = (_returnHit min (CRITICAL_HITPOINTS select _criticalDamageIndex));
};

if (_hitPoint isEqualTo "" && _hitIndex < 0) then {
    _returnHit = _returnHit min 0.89;
};

_returnHit
