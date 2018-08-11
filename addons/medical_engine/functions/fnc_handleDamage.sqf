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
if !(isDamageAllowed _unit && _unit getVariable [QEGVAR(medical,allowDamage), true]) exitWith {_oldDamage};

// Damages are stored for "ace_hdbracket" event triggered last
private _newDamage = _damage - _oldDamage;
_unit setVariable [format [QGVAR($%1), _hitPoint], _newDamage];

// Engine damage to these hitpoints controls blood visuals, limping, weapon sway
// Handled in fnc_damageBodyPart, persist here
if (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"]) exitWith {_oldDamage};

// This hitpoint is set to trigger last, evaluate all the stored damage values
// to determine where wounds are applied
if (_hitPoint isEqualTo "ace_hdbracket") exitWith {
    _unit setVariable [QGVAR(lastShooter), _shooter];
    _unit setVariable [QGVAR(lastInstigator), _instigator];

    private _damageStructural = _unit getVariable [HIT_STRUCTURAL, 0];

    // --- Head
    private _damageFace = _unit getVariable [QGVAR($HitFace), 0];
    private _damageNeck = _unit getVariable [QGVAR($HitNeck), 0];
    private _damageHead = (_unit getVariable [QGVAR($HitHead), 0]) max _damageFace max _damageNeck;

    // --- Body
    private _damagePelvis = _unit getVariable [QGVAR($HitPelvis), 0];
    private _damageAbdomen = _unit getVariable [QGVAR($HitAbdomen), 0];
    private _damageDiaphragm = _unit getVariable [QGVAR($HitDiaphragm), 0];
    private _damageChest = _unit getVariable [QGVAR($HitChest), 0];
    private _damageBody = (_unit getVariable [QGVAR($HitBody), 0]) max _damagePelvis max _damageAbdomen max _damageDiaphragm max _damageChest;

    // --- Arms and Legs
    private _damageLeftArm = _unit getVariable [QGVAR($HitLeftArm), 0];
    private _damageRightArm = _unit getVariable [QGVAR($HitRightArm), 0];
    private _damageLeftLeg = _unit getVariable [QGVAR($HitLeftLeg), 0];
    private _damageRightLeg = _unit getVariable [QGVAR($HitRightLeg), 0];

    // Find hit point that received the maxium damage
    // Priority used for sorting if incoming damage is equivalent (e.g. max which is 4)
    private _allDamages = [
        [_damageHead,     PRIORITY_HEAD,      "Head"],
        [_damageBody,     PRIORITY_BODY,      "Body"],
        [_damageLeftArm,  PRIORITY_LEFT_ARM,  "LeftArm"],
        [_damageRightArm, PRIORITY_RIGHT_ARM, "RightArm"],
        [_damageLeftLeg,  PRIORITY_LEFT_LEG,  "LeftLeg"],
        [_damageRightLeg, PRIORITY_RIGHT_LEG, "RightLeg"]
    ];
    TRACE_2("incoming",_allDamages,_damageStructural);

    _allDamages sort false;
    (_allDamages select 0) params ["_receivedDamage", "", "_woundedHitPoint"];

    // We know it's structural when no specific hitpoint is damaged
    if (_receivedDamage == 0) then {
        _receivedDamage = _damageStructural;
        _woundedHitPoint = "Body";
    };
    TRACE_2("received",_receivedDamage,_woundedHitPoint);

    // Check for environmental damage sources (EH doesn't explicitly know)
    if (_ammo isEqualTo "") then {
        // Downward velocity indicates falling damage
        if ((vehicle _unit == _unit) && {velocity _unit select 2 < -2}) then {
            if (_receivedDamage < 0.35) then {
                // Less than ~ 5 m
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg"];
            } else {
                // More than ~ 5 m
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg", "Body", "Head"];
            };
            _ammo = "#falling";
            TRACE_5("Fall Damage",_unit,_shooter,_instigator,_damage,_receivedDamage);
        } else {
            // Getting hit by a vehicle lists the driver as the shooter
            if !(isNull _shooter) then {
                _woundedHitPoint = "Body";
                _ammo = "#vehiclecrash";
                TRACE_5("Collision Damage",_unit,_shooter,_instigator,_damage,_receivedDamage);
            } else {
                // Anything else is probably fire damage
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg", "Body"];
                _ammo = "#unknown";
                private _combinedDamage = _receivedDamage + (_unit getVariable [QGVAR(trivialDamage), 0]);
                if (_combinedDamage > 0.1) then {
                    // if the new sum is large enough, reset variable and continue with it added in
                    _unit setVariable [QGVAR(trivialDamage), 0];
                    _receivedDamage = _combinedDamage;
                    TRACE_5("Burning",_unit,_shooter,_instigator,_damage,_receivedDamage);
                } else {
                    // otherwise just save the new sum into the variable and exit
                    _unit setVariable [QGVAR(trivialDamage), _combinedDamage];
                    _receivedDamage = 0;
                };
            };
        };
    };

    // No wounds for minor damage
    if (_receivedDamage > 1E-3) then {
        [QEGVAR(medical,woundReceived), [_unit, _woundedHitPoint, _receivedDamage, _shooter, _ammo]] call CBA_fnc_localEvent;
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
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#drowning"]] call CBA_fnc_localEvent;
    TRACE_5("Drowning",_unit,_shooter,_instigator,_damage,_newDamage);

    0
};

// Crashing a vehicle doesn't fire the EH for each hitpoint so the "ace_hdbracket" code never runs
// It does fire the EH multiple times, but this seems to scale with the intensity of the crash
private _vehicle = vehicle _unit;
if (
    _hitPoint isEqualTo "#structural" &&
    _ammo isEqualTo "" &&
    {_vehicle != _unit} &&
    {vectorMagnitude (velocity _vehicle) > 5}
    // todo: no way to detect if stationary and another vehicle hits you
) exitWith {
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#vehiclecrash"]] call CBA_fnc_localEvent;
    TRACE_5("Vehicle Crash",_unit,_shooter,_instigator,_damage,_newDamage);

    0
};

// We store our own damage values so engine damage is unnecessary
0
