#include "script_component.hpp"
/*
 * Author: commy2, SilentSpike
 * HandleDamage EH where wound events are raised based on incoming damage.
 * Be aware that for each source of damage, the EH can fire multiple times (once for each hitpoint).
 * We store these incoming damages and compare them on our final hitpoint: "ace_hdbracket".
 *
 * Arguments:
 * Handle damage EH
 *
 * Return Value:
 * Damage to be inflicted <NUMBER>
 *
 * Public: No
 */
// for travis
#define HIT_STRUCTURAL QGVAR($#structural)

params ["_unit", "_selection", "_damage", "_shooter", "_ammo", "_hitPointIndex", "_instigator", "_hitpoint"];

// HD sometimes triggers for remote units - ignore.
if !(local _unit) exitWith {nil};

// Get missing meta info
private _oldDamage = 0;

if (_hitPoint isEqualTo "") then {
    _hitPoint = "#structural";
    _oldDamage = damage _unit;
} else {
    _oldDamage = _unit getHitIndex _hitPointIndex;
};

// Damage can be disabled with old variable or via sqf command allowDamage
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {_oldDamage};

private _newDamage = _damage - _oldDamage;
// Get armor value of hitpoint and calculate damage before armor
private _armor = [_unit, _hitpoint] call FUNC(getHitpointArmor);
private _realDamage = _newDamage * _armor;
// Damages are stored for "ace_hdbracket" event triggered last
_unit setVariable [format [QGVAR($%1), _hitPoint], [_realDamage, _newDamage]];
TRACE_3("Received hit",_hitpoint,_newDamage,_realDamage);

// Engine damage to these hitpoints controls blood visuals, limping, weapon sway
// Handled in fnc_damageBodyPart, persist here
if (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"]) exitWith {_oldDamage};

// This hitpoint is set to trigger last, evaluate all the stored damage values
// to determine where wounds are applied
if (_hitPoint isEqualTo "ace_hdbracket") exitWith {
    _unit setVariable [QEGVAR(medical,lastDamageSource), _shooter];
    _unit setVariable [QEGVAR(medical,lastInstigator), _instigator];

    private _damageStructural = _unit getVariable [HIT_STRUCTURAL, 0];

    // --- Head
    private _damageHead = [
        _unit getVariable [QGVAR($HitFace), [0,0]],
        _unit getVariable [QGVAR($HitNeck), [0,0]],
        _unit getVariable [QGVAR($HitHead), [0,0]]
    ];
    _damageHead sort false;
    _damageHead = _damageHead select 0;

    // --- Body
    private _damageBody = [
        _unit getVariable [QGVAR($HitPelvis), [0,0]],
        _unit getVariable [QGVAR($HitAbdomen), [0,0]],
        _unit getVariable [QGVAR($HitDiaphragm), [0,0]],
        _unit getVariable [QGVAR($HitChest), [0,0]]
        // HitBody removed as it's a placeholder hitpoint and the high armor value (1000) throws the calculations off
    ];
    _damageBody sort false;
    _damageBody = _damageBody select 0;

    // --- Arms and Legs
    private _damageLeftArm = _unit getVariable [QGVAR($HitLeftArm), [0,0]];
    private _damageRightArm = _unit getVariable [QGVAR($HitRightArm), [0,0]];
    private _damageLeftLeg = _unit getVariable [QGVAR($HitLeftLeg), [0,0]];
    private _damageRightLeg = _unit getVariable [QGVAR($HitRightLeg), [0,0]];

    // Find hit point that received the maxium damage
    // Priority used for sorting if incoming damage is equivalent (e.g. max which is 4)
    private _allDamages = [
        _damageHead     + [PRIORITY_HEAD,      "Head"],
        _damageBody     + [PRIORITY_BODY,      "Body"],
        _damageLeftArm  + [PRIORITY_LEFT_ARM,  "LeftArm"],
        _damageRightArm + [PRIORITY_RIGHT_ARM, "RightArm"],
        _damageLeftLeg  + [PRIORITY_LEFT_LEG,  "LeftLeg"],
        _damageRightLeg + [PRIORITY_RIGHT_LEG, "RightLeg"]
    ];
    TRACE_2("incoming",_allDamages,_damageStructural);

    // represents all incoming damage for selecting a non-selectionSpecific wound location, (used for selectRandomWeighted [value1,weight1,value2....])
    private _damageSelectionArray = [
        HITPOINT_INDEX_HEAD, _damageHead select 1, HITPOINT_INDEX_BODY, _damageBody select 1, HITPOINT_INDEX_LARM, _damageLeftArm select 1, 
        HITPOINT_INDEX_RARM, _damageRightArm select 1, HITPOINT_INDEX_LLEG, _damageLeftLeg select 1, HITPOINT_INDEX_RLEG, _damageRightLeg select 1
    ];

    _allDamages sort false;
    (_allDamages select 0) params ["", "_receivedDamage", "", "_woundedHitPoint"];
    private _receivedDamageHead = _damageHead select 1;
    if (_receivedDamageHead >= HEAD_DAMAGE_THRESHOLD) then {
        TRACE_3("reporting fatal head damage instead of max",_receivedDamageHead,_receivedDamage,_woundedHitPoint);
        _receivedDamage = _receivedDamageHead;
        _woundedHitPoint = "Head";
    };

    // We know it's structural when no specific hitpoint is damaged
    if (_receivedDamage == 0) then {
        _receivedDamage = _damageStructural select 1;
        _woundedHitPoint = "Body";
        _damageSelectionArray = [1, 1]; // sum of weights would be 0
    };

    // Environmental damage sources all have empty ammo string
    // No explicit source given, we infer from differences between them
    if (_ammo isEqualTo "") then {
        // Any collision with terrain/vehicle/object has a shooter
        // Check this first because burning can happen at any velocity
        if !(isNull _shooter) then {
            _ammo = "#collision"; // non-selectionSpecific so only _damageSelectionArray matters

            /*
              If shooter != unit then they hit unit, otherwise it could be:
               - Unit hitting anything at speed
               - An empty vehicle hitting unit
               - A physX object hitting unit
               Assume fall damage for downward velocity because it's most common
            */
            if (_shooter == _unit && {(velocity _unit select 2) < -2}) then {
                _ammo = "#falling"; // non-selectionSpecific so only _damageSelectionArray matters
                _damageSelectionArray = [HITPOINT_INDEX_RLEG, 1, HITPOINT_INDEX_LLEG, 1];
                TRACE_5("Fall",_unit,_shooter,_instigator,_damage,_receivedDamage);
            } else {
                _damageSelectionArray = [HITPOINT_INDEX_RARM, 1, HITPOINT_INDEX_LARM, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1];
                TRACE_5("Collision",_unit,_shooter,_instigator,_damage,_receivedDamage);
            };

            // Significant damage suggests high relative velocity
            // Momentum transfers to body/head for worse wounding
            // Higher momentum results in higher chance for head to be hit for more lethality
            if (_receivedDamage > 0.35) then {
                private _headHitWeight = (_receivedDamage / 2) min 1;
                if (_recievedDamage < 0.6) then {
                    _damageSelectionArray append [0, (1 - _headHitWeight), 1, _headHitWeight];
                } else {
                    _damageSelectionArray = [0, (1 - _headHitWeight), 1, _headHitWeight];
                }
            };
        } else {
            // Anything else is almost guaranteed to be fire damage
            _damageSelectionArray = [HITPOINT_INDEX_BODY, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1];;
            _ammo = "#unknown"; // non-selectionSpecific so only _damageSelectionArray matters

            // Fire damage can occur as lots of minor damage events
            // Combine these until significant enough to wound
            private _combinedDamage = _receivedDamage + (_unit getVariable [QGVAR(trivialDamage), 0]);
            if (_combinedDamage > 0.1) then {
                _unit setVariable [QGVAR(trivialDamage), 0];
                _receivedDamage = _combinedDamage;
                TRACE_5("Burning",_unit,_shooter,_instigator,_damage,_receivedDamage);
            } else {
                _unit setVariable [QGVAR(trivialDamage), _combinedDamage];
                _receivedDamage = 0;
            };
        };
    };

    // No wounds for minor damage
    if (_receivedDamage > 1E-3) then {
        TRACE_3("received",_receivedDamage,_woundedHitPoint,_damageSelectionArray);
        [QEGVAR(medical,woundReceived), [_unit, _woundedHitPoint, _receivedDamage, _shooter, _ammo, _damageSelectionArray]] call CBA_fnc_localEvent;
    };

    // Clear stored damages otherwise they will influence future damage events
    // (aka wounds will pile onto the historically most damaged hitpoint)
    {
        _unit setVariable [_x, nil];
    } forEach [
        QGVAR($HitFace),QGVAR($HitNeck),QGVAR($HitHead),
        QGVAR($HitPelvis),QGVAR($HitAbdomen),QGVAR($HitDiaphragm),QGVAR($HitChest),QGVAR($HitBody),
        QGVAR($HitLeftArm),QGVAR($HitRightArm),QGVAR($HitLeftLeg),QGVAR($HitRightLeg)
    ];

    0
};

// Drowning doesn't fire the EH for each hitpoint so the "ace_hdbracket" code never runs
// Damage occurs in consistent increments
if (
    _hitPoint isEqualTo "#structural" &&
    {getOxygenRemaining _unit <= 0.5} &&
    {_damage isEqualTo (_oldDamage + 0.005)}
) exitWith {
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#drowning", [HITPOINT_INDEX_BODY, 1]]] call CBA_fnc_localEvent;
    TRACE_5("Drowning",_unit,_shooter,_instigator,_damage,_newDamage);

    0
};

// Crashing a vehicle doesn't fire the EH for each hitpoint so the "ace_hdbracket" code never runs
// It does fire the EH multiple times, but this seems to scale with the intensity of the crash
private _vehicle = vehicle _unit;
if (
    _hitPoint isEqualTo "#structural" &&
    {_ammo isEqualTo ""} &&
    {_vehicle != _unit} &&
    {vectorMagnitude (velocity _vehicle) > 5}
    // todo: no way to detect if stationary and another vehicle hits you
) exitWith {
    private _damageSelectionArray = [
        HITPOINT_INDEX_HEAD, 1, HITPOINT_INDEX_BODY, 1, HITPOINT_INDEX_LARM, 1, 
        HITPOINT_INDEX_RARM, 1, HITPOINT_INDEX_LLEG, 1, HITPOINT_INDEX_RLEG, 1
    ];
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#vehiclecrash", _damageSelectionArray]] call CBA_fnc_localEvent;
    TRACE_5("Crash",_unit,_shooter,_instigator,_damage,_newDamage);

    0
};

// We store our own damage values so engine damage is unnecessary
0
