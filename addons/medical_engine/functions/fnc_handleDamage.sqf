#include "script_component.hpp"
/*
 * Author: commy2
 * Main HandleDamage EH function for soldiers.
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
#define HIT_CRASH QGVAR($#crash)

params ["_unit", "_selection", "_damage", "_shooter", "_ammo", "_hitPointIndex", "_instigator"];
//diag_log text str _this;

// HD sometimes triggers for remote units - ignore.
if (!local _unit) exitWith {nil};

// Get missing meta info
private ["_hitPoint", "_oldDamage"];
private _isCrash = false;

// Store
if (_hitPointIndex < 0) then {
    _hitPoint = "#structural";
    _oldDamage = damage _unit;

    // Handle vehicle crashes
    if (_damage == _unit getVariable [HIT_CRASH, -1]) then {
        _isCrash = (_ammo == "");
        _unit setVariable [HIT_CRASH, -1];
    } else {
        _unit setVariable [HIT_CRASH, _damage];
    };
} else {
    _hitPoint = toLower (getAllHitPointsDamage _unit select 0 select _hitPointIndex);
    _oldDamage = _unit getHitIndex _hitPointIndex;

    // No crash, reset
    _unit setVariable [HIT_CRASH, -1];
};

// Damage can be disabled with old variable or via sqf command allowDamage
if !(isDamageAllowed _unit && _unit getVariable [QEGVAR(medical,allowDamage), true]) exitWith {_oldDamage};

private _newDamage = _damage - _oldDamage;
_unit setVariable [format [QGVAR($%1), _hitPoint], _newDamage];

// These control blood material visuals.
// If damage is in dummy hitpoints, "hands" and "legs", don't change anything
if (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"]) exitWith {_oldDamage};

// Add injury
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

    // Find hit point that received the maxium damage.
    // second param is a priority. should multiple hitpoints receive the same
    // amount of damage (e.g. max which is 4), we don't want them to be sorted
    // alphabetically (which would mean that RightLeg is always chosen)
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

    if (_receivedDamage == 0) then {
        _receivedDamage = _damageStructural;
        _woundedHitPoint = "Body";
    };
    TRACE_2("received",_receivedDamage,_woundedHitPoint);

    // Check for falling damage.
    if (_ammo isEqualTo "") then {
        if (velocity _unit select 2 < -2) then {
            if (_receivedDamage < 0.35) then {
                // Less than ~ 5 m
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg"];
            } else {
                // More than ~ 5 m
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg", "Body", "Head"];
            };
            _ammo = "#falling";
        } else {
            if (_receivedDamage > 0.1) then {
                // Assume collision damage.
                _woundedHitPoint = "Body";
                _ammo = "#vehiclecrash";
            } else {
                // Probably fire damage:
                _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg", "Body"];
                _ammo = "#unknown";
                private _combinedDamage = _receivedDamage + (_unit getVariable [QGVAR(trivialDamage), 0]);
                if (_combinedDamage > 0.1) then {
                    // if the new sum is large enough, reset variable and continue with it added in
                    _unit setVariable [QGVAR(trivialDamage), 0];
                    TRACE_2("Using sum of trivialDamage",_receivedDamage,_combinedDamage);
                    _receivedDamage = _combinedDamage;
                } else {
                    // otherwise just save the new sum into the variable and exit
                    _unit setVariable [QGVAR(trivialDamage), _combinedDamage];
                    _receivedDamage = 0;
                };
            };
        };
    };

    // Don't trigger for minor damage.
    if (_receivedDamage > 1E-3) then {
        [QEGVAR(medical,woundReceived), [_unit, _woundedHitPoint, _receivedDamage, _shooter, _ammo]] call CBA_fnc_localEvent;
    };

    // resetting these single-damage-event tracker vars, if we don't do this then
    // subsequent wounds will be piled onto the selection which has accumulated
    // the most wounding
    {
        _unit setVariable [_x, 0];
    } forEach [
        QGVAR($HitFace),QGVAR($HitNeck),QGVAR($HitHead),
        QGVAR($HitPelvis),QGVAR($HitAbdomen),QGVAR($HitDiaphragm),QGVAR($HitChest),QGVAR($HitBody),
        QGVAR($HitLeftArm),QGVAR($HitRightArm),QGVAR($HitLeftLeg),QGVAR($HitRightLeg)
    ];

    0
};

// Check for drowning damage.
// Don't change the third expression. Safe method for FLOATs.
if (_hitPoint isEqualTo "#structural" && {getOxygenRemaining _unit <= 0.5} && {_damage isEqualTo (_oldDamage + 0.005)}) exitWith {
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#drowning"]] call CBA_fnc_localEvent;

    0
};

// Handle vehicle crashes
if (_isCrash) exitWith {
    [QEGVAR(medical,woundReceived), [_unit, "Body", _newDamage, _unit, "#vehiclecrash"]] call CBA_fnc_localEvent;

    0
};

0
