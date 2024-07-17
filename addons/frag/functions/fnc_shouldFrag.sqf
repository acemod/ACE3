#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should create fragments.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * An array containing <ARRAY>
 *   0: Should the ammo class generate fragments <BOOL>
 *   1: Should the ammo class create submunitions that may fragment <BOOL>
 *
 * Example:
 * "B_556x45_Ball" call ace_frag_fnc_shouldFrag
 *
 * Public: No
 */

params ["_ammo"];

private _shouldFrag = GVAR(shouldFragCache) get _ammo;

if (!isNil "_shouldFrag") exitWith {_shouldFrag};

_shouldFrag = [true, false];

private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
private _skip = getNumber (_ammoConfig >> QGVAR(skip));
if (_skip == 1) then {
    _shouldFrag set [0, false];
    TRACE_1("No frag: skip",_skip);
};

private _force = getNumber (_ammoConfig >> QGVAR(force));
if (_shouldFrag#0 && _force == 0) then {
    private _explosive = getNumber (_ammoConfig >> "explosive");
    if (_explosive < 0.4) exitWith {
        _shouldFrag set [0, false];
        TRACE_3("No frag: _explosive",_skip,_force,_explosive);
    };
    private _indirectHit = getNumber (_ammoConfig >> "indirectHit");
    private _indirectRange = getNumber (_ammoConfig >> "indirectHitRange");
    if (_indirectHit < 3 ||
        {_indirectRange < 5 && _indirectHit < _indirectRange}) then {
        _shouldFrag set [0, false];
        TRACE_5("No frag",_ammo,_skip,_explosive,_indirectRange,_indirectHit);
    };
};

private _ammoSubmunitionConfigPath = _ammoConfig >> "submunitionAmmo ";
if (isText _ammoSubmunitionConfigPath) then {
    private _submunitionAmmo = getText _ammoSubmunitionConfigPath;
    if (_submunitionAmmo isNotEqualTo "") then {
        private _shouldSubmunitionFrag = _submunitionAmmo call FUNC(shouldFrag);
        _shouldFrag set [1, _shouldSubmunitionFrag#0 || _shouldSubmunitionFrag#1];
    };
} else {
    private _submunitionArray = getArray _ammoSubmunitionConfigPath;
    for "_i" from 0 to count _submunitionArray - 1 step 2 do {
        private _submunitionAmmo = _submunitionArray#_i;
        if (_submunitionAmmo isNotEqualTo "") then {
            private _shouldSubmunitionFrag = _submunitionAmmo call FUNC(shouldFrag);
            _shouldFrag set [1, _shouldSubmunitionFrag#0 || _shouldSubmunitionFrag#1];
        };
    };
};

GVAR(shouldFragCache) set [_ammo, _shouldFrag];

_shouldFrag
