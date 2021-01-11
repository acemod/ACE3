#include "script_component.hpp"
/*
 * Author: commy2, SilentSpike
 * HandleDamage EH where wound events are raised based on incoming damage.
 * Be aware that for each source of damage, the EH can fire multiple times (once for each hitpoint).
 * We store these incoming damages and compare them after Hit event.
 *
 * Arguments:
 * Handle damage EH
 *
 * Return Value:
 * Damage to be inflicted <NUMBER>
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_source", "_ammo", "_hitPointIndex", "_instigator", "_hitpoint"];
private _oldDamage = if (_hitPointIndex == -1) then { damage _unit } else { _unit getHitIndex _hitPointIndex };
private _newDamage = _damage - _oldDamage;

// HD sometimes triggers for remote units - ignore.
if !(local _unit) exitWith {nil};

#ifdef DEBUG_MODE_FULL
_this pushBack (isBurning _unit);
_this pushBack _oldDamage;
_this pushBack _newDamage;
_this pushBack diag_frameNo;
diag_log formatText ["HandleDamage %1", _this];
#endif

// Damage can be disabled with old variable or via sqf command allowDamage
if !(simulationEnabled _unit && isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {_oldDamage};

// Special case, handled in Hit EH
// Fire damage can occur as lots of minor damage events
if (
    isNull _source && 
    _ammo isEqualTo "" && 
    isBurning _unit
) exitWith {    
    _oldDamage
};



// Special case, handled in Hit EH
// Drowning damage occurs in consistent increments
if (
    getOxygenRemaining _unit <= 0.5 &&
    _newDamage == 0.005 &&
    _unit == _source && 
    _ammo isEqualTo "" 
) exitWith {
    _oldDamage 
};



// Environmental damage sources all have empty ammo string
// No explicit source given, we infer from differences between them
if (_ammo isEqualTo "") then {
    // Any collision with terrain/vehicle/object has a shooter

    private _vehicle = vehicle _unit;
    if !(isNull _source) then {
        _ammo = "collision"; 

        /*
            If shooter != unit then they hit unit, otherwise it could be:
            - Unit hitting anything at speed
            - An empty vehicle hitting unit
            - A physX object hitting unit
            Assume fall damage for downward velocity because it's most common
        */
        if (_source == _unit && _vehicle == _unit && {(velocity _unit select 2) < -2}) then {
            _ammo = "falling"; 
        };
        if (_vehicle != _unit && _vehicle == vehicle _source) then {
            _ammo = "vehiclecrash"; 
        };
    } else {        
        // Special case when unit dies in vehicle crash
        if (_hitPointIndex == -1) then {
            _ammo = "vehiclecrash"; 
        } else {
            _ammo = "unknown"; 
        };

    };
    _this set [4, _ammo];
};


private _events = _unit getVariable [QGVAR(events), []];
_events pushBack [_hitPointIndex, _newDamage, _source, _instigator, _ammo];
_unit setVariable [QGVAR(events), _events];

if (_damage >= 1) then {
    // Damage to vital organs - powerfull headshots, explosion damages head 
    if (_newDamage>=1 and _hitPointIndex in (_unit getVariable QGVAR(HeadHitPointIdxs))) then {     
        if (EGVAR(medical,fatalDamageSource) in [0, 2]) then {
            TRACE_1("handleDamage: lethal headshot",_newDamage);
        } else {
            _damage = _damage min 0.99;
        };
    };

    // Handle torso shots after detecting hitpoint
    if (_hitPointIndex in (_unit getVariable QGVAR(BodyHitPointIdxs))) then {     
        _damage = _damage min 0.99;
    };

    // Do not change inflicted structural damage (_hitPointIndex==-1)
    // HandleDamage event with _hitPointIndex=-1 and _damage=1 is raised when unit dies in exploded vehicle
};

_damage