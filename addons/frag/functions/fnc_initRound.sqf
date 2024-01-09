#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds rounds using their config init EH

 * Arguments:
 * 0: _projectile <OBJECT> - The object created
 * 
 * Return Value:
 * None
 *
 * Example:
 * [_proj] call ace_frag_fnc_initRound;
 *
 * Public: No
 */
params [
	["_projectile", objNull, [objNull]]
];

private _ammo = typeOf _projectile;
if (_ammo isEqualTo "" || {isNull _projectile}) exitWith {
    TRACE_2("bad ammo or projectile",_ammo,_projectile);
};

private _shouldFrag = _ammo call FUNC(shouldFrag);
_shouldFrag params ["_doFrag"]; 

if (_doFrag) then {
    // wait for frag damage to kill units before spawning fragments
    _projectile addEventHandler [
		"Explode",
		{
            if (isServer) then {
                [FUNC(doFrag), [_this]] call CBA_fnc_execNextFrame;
            } else {
                [QGVAR(frag_eh), [_this]] call CBA_fnc_serverEvent;
            };
        }
    ];
};


private _shouldSpall = _ammo call FUNC(shouldSpall);

if (GVAR(spallEnabled) && {_shouldSpall}) then 
{
	_projectile addEventHandler [
        "HitPart",
        {
            if (isServer) then {
                [LINKFUNC(doSpallMomentum), _this] call CBA_fnc_execNextFrame;
            } else {
                [QGVAR(spall_eh), [_this]] call CBA_fnc_serverEvent;
            };
        }
    ];
};