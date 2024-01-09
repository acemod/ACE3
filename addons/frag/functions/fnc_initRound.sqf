#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should cause fragmentation
 * and whether any submunitions exist
 * 
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
 * 
 * Return Value:
 * _shouldFrag <ARRAY>
 * 	0 - Should the specific round fragment
 *  1 - Does the munition have a child submunition 
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_shouldFrag;
 *
 * Public: No
 */
 params ["_projectile"];
private _ammo = typeOf _proj;
systemChat (str _ammo + " " + str _projectile);
 if (isNil "_ammo" || 
        {_ammo isEqualTo "" || 
        {isNil "_projectile" || 
        {isNull _projectile}}}) exitWith {
    WARNING("bad ammo or projectile");
};

/******* _shouldFrag format *****/
// 0: doFragmnent - will the piece fragment
// 1: hasSubmuntion - will the round create submunitions 
private _shouldFrag = _ammo call FUNC(shouldFrag);
_shouldFrag params ["_doFrag", "_doSubmunit"]; 

if (_doFrag) then {
    // wait for frag damage to kill units before spawning fragments
    _projectile addEventHandler ["Explode",	{
            if (isServer) then {
                [FUNC(doFrag), [_this]] call CBA_fnc_execNextFrame;
            } else {
                [QGVAR(frag_eh), [_this]] call CBA_fnc_serverEvent;
            };
        }
    ];
};

if (_doSubmunit && {GVAR(enSubMunit)> 0}) then {
    _projectile addEventHandler ["SubmunitionCreated", {_this call FUNC(submunition)}];
};

private _shouldSpall = _ammo call FUNC(shouldSpall);

if (GVAR(spallEnabled) && {_shouldSpall}) then 
{_projectile addEventHandler [
        "HitPart",
        {
            [LINKFUNC(doSpallMomentum), _this] call CBA_fnc_execNextFrame;
            [QGVAR(spall_eh), [_this]] call CBA_fnc_serverEvent;
        }
    ];
};