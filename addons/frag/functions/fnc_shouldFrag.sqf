#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should create fragments.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * Should the specific round fragment <BOOL>
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_shouldFrag;
 *
 * Public: No
 */

params ["_ammo"];

private _shouldFrag = GVAR(shouldFragCache) get _ammo;

if (!isNil "_shouldFrag") exitWith {_shouldFrag};

_shouldFrag = true;

private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
private _skip = getNumber (_ammoConfig >> QGVAR(skip));
if (_skip == 1) then {
    _shouldFrag = false;
    TRACE_1("No frag: skip",_skip);
};

private _force = getNumber (_ammoConfig >> QGVAR(force));
if (_shouldFrag && _force == 0) then {
    private _explosive = getNumber (_ammoConfig >> "explosive");
    if (_explosive < 0.4) exitWith {
        _shouldFrag = false;
        TRACE_3("No frag: _explosive",_skip,_force,_explosive);
    };
    private _indirectHit = getNumber (_ammoConfig >> "indirectHit");
    private _indirectRange = getNumber (_ammoConfig >> "indirectHitRange");
    if (_indirectHit < 3 ||
        {_indirectRange < 5 && _indirectHit < _indirectRange}) then {
        _shouldFrag = false;
        TRACE_5("No frag",_ammo,_skip,_explosive,_indirectRange,_indirectHit);
    };
};

GVAR(shouldFragCache) set [_ammo, _shouldFrag];

_shouldFrag
