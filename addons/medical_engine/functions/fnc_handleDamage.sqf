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
#include "script_component.hpp"

params ["_unit", "_selection", "_damage", "_shooter", "_ammo", "_hitPointIndex"];
//diag_log _this;

// HD sometimes triggers for remote units - ignore.
if (!local _unit) exitWith {nil};

// Get missing meta info
private ["_hitPoint", "_oldDamage"];

if (_hitPointIndex < 0) then {
    _hitPoint = "#structural";
    _oldDamage = damage _unit;
} else {
    _hitPoint = toLower (getAllHitPointsDamage _unit select 0 select _hitPointIndex);
    _oldDamage = _unit getHitIndex _hitPointIndex;
};

private _newDamage = _damage - _oldDamage;
_unit setVariable [format [QGVAR(newDamage$%1), _hitPoint], _newDamage];

// Never kill the unit by the critical hit points of the engine.
if (_hitPoint in ["#structural", "hitbody", "hithead"]) then {
    _damage = _damage min 0.99;
};

// These control blood material visuals.
// If damage is in dummy hitpoints, "hands" and "legs", don't change anything
if (_hitPoint in ["hithead", "hitbody", "hithands", "hitlegs"]) exitWith {_oldDamage};

// Add injury
if (_hitPoint isEqualTo "ace_hdbracket") exitWith {
    // --- Head
    private _damageFace = _unit getVariable [QGVAR(newDamage$HitFace), 0];
    private _damageNeck = _unit getVariable [QGVAR(newDamage$HitNeck), 0];
    private _damageHead = (_unit getVariable [QGVAR(newDamage$HitHead), 0]) max _damageFace max _damageNeck;

    // --- Body
    private _damageStructural = _unit getVariable [QGVAR(newDamage$#structural), 0];
    private _damagePelvis = _unit getVariable [QGVAR(newDamage$HitPelvis), 0];
    private _damageAbdomen = _unit getVariable [QGVAR(newDamage$HitAbdomen), 0];
    private _damageDiaphragm = _unit getVariable [QGVAR(newDamage$HitDiaphragm), 0];
    private _damageChest = _unit getVariable [QGVAR(newDamage$HitChest), 0];
    private _damageBody = (_unit getVariable [QGVAR(newDamage$HitBody), 0]) max _damagePelvis max _damageAbdomen max _damageDiaphragm max _damageChest max _damageStructural;

    // --- Arms and Legs
    private _damageLeftArm = _unit getVariable [QGVAR(newDamage$HitLeftArm), 0];
    private _damageRightArm = _unit getVariable [QGVAR(newDamage$HitRightArm), 0];
    private _damageLeftLeg = _unit getVariable [QGVAR(newDamage$HitLeftLeg), 0];
    private _damageRightLeg = _unit getVariable [QGVAR(newDamage$HitRightLeg), 0];

    // Find hit point that received the maxium damage.
    private _allDamages = [
        [_damageHead, "Head"],
        [_damageBody, "Body"],
        [_damageLeftArm, "LeftArm"],
        [_damageRightArm, "RightArm"],
        [_damageLeftLeg, "LeftLeg"],
        [_damageRightLeg, "RightLeg"]
    ];

    _allDamages sort false;
    (_allDamages select 0) params ["_receivedDamage", "_woundedHitPoint"];

    // Check for falling damage.
    if (_ammo isEqualTo "") then {
        if (velocity _unit select 2 < -2) then {
            _woundedHitPoint = selectRandom ["LeftLeg", "RightLeg"];
            _ammo = "#falling";
        } else {
            // Assume collision damage.
            // @todo, find a method for detecting burning damage.
            _woundedHitPoint = "Body";
            _ammo = "#collision";
        };
    };

    // Don't trigger for minor damage.
    if (_receivedDamage > 1E-3) then {
        [QGVAR(woundReceived), [_unit, _woundedHitPoint, _receivedDamage, _shooter, _ammo]] call CBA_fnc_localEvent;
    };

    0
};

// Check for drowning damage.
// Don't change the third expression. Safe method for FLOATs.
if (_hitPoint isEqualTo "#structural" && {getOxygenRemaining _unit <= 0.5} && {_damage isEqualTo (_oldDamage + 0.005)}) then {
    [QGVAR(woundReceived), [_unit, "Body", _newDamage, _unit, "#drowning"]] call CBA_fnc_localEvent;
};

_damage
