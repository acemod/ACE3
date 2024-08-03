#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Blacklist an ammo class, thus preventing it from producing fragments or spall. This function will not allow you to force a projectile to produce fragments or spall.
 * The function takes three arguments, although the last two are optional. The first argument is the ammo class name to ignore, while the second and third are
 * whether the class should be blacklisted from producing fragments and spall, respectively. Once an ammo has been blacklisted, it can be removed from the blacklist
 * using this function without restarting the mission.
 *
 * Arguments:
 * 0: Class name of the ammo to be blacklisted <STRING>
 * 1: Should a projectile be blacklisted from producing fragments <BOOL>
 * 2: Should a projectile be blacklisted from producing spall <BOOL>
 *
 * Return Value:
 * Were the changes properly applied <BOOL>
 *
 * Example:
 * ["ACE_20mm_HE", false, true] call ace_frag_fnc_addClassBlackList;
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
    INFO_1("Invalid ammo class",_ammo);
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
