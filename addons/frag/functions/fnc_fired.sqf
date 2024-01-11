#include "script_component.hpp"
/*
 * Author: nou, jaynus, PabstMirror, Lambda.Tiger
 * Called from the unified fired EH for all.
 * If spall is not enabled (default), then cache and only track those that will actually trigger fragmentation.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];

if (isNil "_ammo" || 
        {_ammo isEqualTo "" || 
        {isNil "_projectile" || 
        {isNull _projectile}}}) exitWith {
    TRACE_2("bad ammo or projectile",_projectile,_ammo);
};

/******* _shouldFrag format *****/
// 0: doFragmnent - will the piece fragment
// 1: hasSubmuntion - will the round create submunitions 
private _shouldFrag = _ammo call FUNC(shouldFrag);
_shouldFrag params ["_doFrag", "_doSubmunit"]; 

if (_doFrag) then {
    // wait for frag damage to kill units before spawning fragments
    _projectile addEventHandler ["Explode",
        {
            if (isServer) then {
                [FUNC(doFrag), [_this]] call CBA_fnc_execNextFrame;
            } else {
                [QGVAR(frag_eh), [_this]] call CBA_fnc_serverEvent;
            };
        }
    ];
};

if (_doSubmunit && {GVAR(fragSimComplexity)> 0}) then {
    _projectile addEventHandler ["SubmunitionCreated", {_this call FUNC(submunition)}];
};

private _shouldSpall = _ammo call FUNC(shouldSpall);

if (GVAR(spallEnabled) && {_shouldSpall}) then 
{_projectile addEventHandler [
        "HitPart",
        {
            if (isServer) then {
                [LINKFUNC(doSpall), _this] call CBA_fnc_execNextFrame;
            } else {
                [QGVAR(spall_eh), [_this]] call CBA_fnc_serverEvent;
            };
        }
    ];
};