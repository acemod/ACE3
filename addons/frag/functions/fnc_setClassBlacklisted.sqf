#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Blacklist an ammo class preventing it from producing fragments and/or spall.
 * This function will not allow you to force a projectile to produce fragments or spall.
 * Once an ammo class has been blacklisted, it can be removed from the blacklist using this function without restarting the mission.
 *
 * Arguments:
 * 0: Class name of the ammo to be blacklisted <STRING>
 * 1: Should a projectile be blacklisted from producing fragments <BOOL> (default: true)
 * 2: Should a projectile be blacklisted from producing spall <BOOL> (default: true)
 *
 * Return Value:
 * Were the changes properly applied <BOOL>
 *
 * Example:
 * // Stop "ACE_20mm_HE" from producing spall
 * ["ACE_20mm_HE", false, true] call ace_frag_fnc_setClassBlacklisted;
 *
 * Public: Yes
 */
params [
    ["_ammo", "", [""]],
    ["_blacklistFrag", true, [true]],
    ["_blacklistSpall", true, [true]]
];
TRACE_3("addBlackListClass",_ammo,_blacklistFrag,_blacklistSpall);

if (_ammo isEqualTo "" || {!isClass (configFile >> "CfgAmmo" >> _ammo)}) exitWith {
    INFO_1("Invalid ammo class [%1]",_ammo);
    false
};

if (_blacklistFrag) then {
    GVAR(shouldFragCache) set [_ammo, false];
} else {
    GVAR(shouldFragCache) deleteAt _ammo;
    _ammo call FUNC(shouldFrag);
};


if (_blacklistSpall) then {
    GVAR(shouldSpallCache) set [_ammo, false];
} else {
    GVAR(shouldSpallCache) deleteAt _ammo;
    _ammo call FUNC(shouldSpall);
};

true
