#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Applies medical damage to a unit.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Source <OBJECT>
 * 2: Instigator <OBJECT>
 * 3: Guarantee death? <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, player] call ace_vehicle_damage_fnc_medicalDamage;
 *
 * Public: No
 */

params ["_unit", "_source", "_instigator", ["_guaranteeDeath", false]];

// Check if unit is invulnerable
if !(isDamageAllowed _unit && {_unit getVariable [QEGVAR(medical,allowDamage), true]}) exitWith {};

if (["ace_medical"] call EFUNC(common,isModLoaded)) then {
    for "_i" from 0 to floor (4 + random 3) do {
        [_unit, random [0, 0.66, 1], selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"], selectRandom ["bullet", "shell", "explosive"], _instigator] call EFUNC(medical,addDamageToUnit);
    };
} else {
    {
        _unit setHitPointDamage [_x, (_unit getHitPointDamage _x) + random [0, 0.66, 1], true, _source, _instigator];
    } forEach ["HitFace", "HitNeck", "HitHead", "HitPelvis", "HitAbdomen", "HitDiaphragm", "HitChest", "HitBody", "HitArms", "HitHands", "HitLegs"];
};

// If guaranteed death is wished
if (_guaranteeDeath && {alive _unit}) then {
    [_unit, QGVAR(medicalDamage), _source, _instigator] call EFUNC(common,setDead);
};
