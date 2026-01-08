#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Called by "HandleDamage" event handler. Sets up hit array for this frame's damage.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Selection <STRING>
 * 2: New level of damage <NUMBER>
 * 3: Source of damage <OBJECT>
 * 4: Projectile that caused damage <STRING>
 * 5: Hit index <NUMBER>
 * 6: Person who caused damage <OBJECT>
 * 7: Hit point <STRING>
 *
 * Return Value:
 * Current or maximum damage of part (nil if not local) <NUMBER or NIL> 
 *
 * Example:
 * [cursorObject, "hit_engine_point", 0.5, player, projectile, 1, player, "HitEngine"] call ace_vehicle_damage_fnc_handleDamage
 *
 * Public: No
 */

params ["_vehicle", "_selection", "_newDamage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "", "_context"];
TRACE_9("handleDamage",_vehicle,_selection,_newDamage,_source,_projectile,_hitIndex,_instigator,_hitPoint,_context);

if (!local _vehicle) exitWith {};

private _currentDamage = if (_selection != "") then {
    _vehicle getHitIndex _hitIndex
} else {
    damage _vehicle
};

// Killing units via End key is an edge case (#10375)
// This didn't matter pre-Arma 3 2.18 but now this goes through the event handler
// TODO: Structural fire damage >= 1 in a single damage event could still be caught here and we don't want that, but we haven't found a better way to catch this, fire damage should be small most of the time anyway
if (_context == 0 && {(abs (_newDamage - _currentDamage - 1)) < 0.001 && _projectile == "" && isNull _source && isNull _instigator}) exitWith {_newDamage};

if !(_projectile in ["ace_ammoExplosion", "ACE_ammoExplosionLarge"]) then {
    // If an invalid hit, don't process it
    if (_newDamage <= 0 || {"#light" in _hitPoint}) exitWith {};

    // Set up hit array so we can execute all damage next frame. Always in order of hit done.
    private _hitHash = _vehicle getVariable QGVAR(hitHash);
    private _currentFrameArray = _hitHash getOrDefault [diag_frameNo, [], true];

    if (_currentFrameArray isEqualTo []) then {
        [{
            params ["_vehicle", "_processingFrame"];

            private _hitHash = _vehicle getVariable QGVAR(hitHash);
            private _hitArray = _hitHash deleteAt _processingFrame;

            if (_hitArray isEqualTo []) exitWith {};

            TRACE_3("processing data from old frame",diag_frameNo,_processingFrame,_hitArray);

            // Start from newest damage and work backwards
            {
                _x params ["_vehicle", "_selection", "_newDamage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

                private _currentDamage = if (_selection != "") then {
                    _vehicle getHitIndex _hitIndex
                } else {
                    damage _vehicle
                };

                private _addedDamage = _newDamage - _currentDamage;

                TRACE_1("handleDamage",_currentDamage);

                if !([_vehicle, _hitPoint, _hitIndex, _selection, _addedDamage, _projectile, _source, _instigator] call FUNC(handleVehicleDamage)) exitWith {
                    TRACE_2("cancelling rest of vehicle damage queue",(count (_hitArray#1)) - _forEachIndex,count (_hitArray#1))
                };
            } forEachReversed _hitArray;
        }, [_vehicle, diag_frameNo]] call CBA_fnc_execNextFrame;
    };

    _currentFrameArray pushBack _this;
};

// Damage is never to be handled in-engine. Always handle out of engine with this event handler
// Don't return 0 or else old parts will be reset in damage
private _criticalDamageIndex = CRITICAL_HITPOINTS findIf {_x == _hitPoint};

if (_criticalDamageIndex != -1) then {
    _currentDamage = _currentDamage min (CRITICAL_HITPOINTS_THRESHOLDS select _criticalDamageIndex);
};

if (_hitPoint == "" && {_hitIndex < 0}) then {
    _currentDamage = _currentDamage min 0.89;
};

_currentDamage
