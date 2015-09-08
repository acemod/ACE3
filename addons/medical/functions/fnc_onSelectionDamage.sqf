// by commy2
#include "script_component.hpp"

params ["_unit", "_selection", "_newDamage", "_projectile"];

private ["_totalDamage", "_typeOfDamage", "_typeIndex", "_minLethalDamage"];

_totalDamage = (_unit getHit _selection) + _newDamage;

_typeOfDamage = [_projectile] call FUNC(getTypeOfDamage);
_typeIndex = GVAR(allAvailableDamageTypes) find _typeOfDamage;

if (_typeIndex != -1) then {
    _minLethalDamage = GVAR(minLethalDamages) select _typeIndex;
} else {
    _minLethalDamage = 0.01;
};

if (_minLethalDamage <= _newDamage && {[_unit, GVAR(SELECTIONS) find _selection, _newDamage] call FUNC(determineIfFatal)}) then {
    // prevent insta death
    if (_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)]) exitwith {
        _totalDamage = 0.9;
    };

    if ([_unit] call FUNC(setDead)) then {
        _totalDamage = 1;
    } else {
        _totalDamage = _totalDamage min 0.9;
    };
} else {
    _totalDamage = _totalDamage min 0.9;
};

[_unit] call FUNC(addToInjuredCollection);

// prevent insta death
if (_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)]) then {
    if (vehicle _unit != _unit && {damage vehicle _unit >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };

    private "_delayedUnconsicous";
    _delayedUnconsicous = false;
    if (vehicle _unit != _unit && {damage vehicle _unit >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
        _delayedUnconsicous = true;
    };

    if (_damageReturn >= 0.9 && {_selection in ["", "head", "body"]}) exitWith {
        if (_unit getvariable ["ACE_isUnconscious", false]) exitwith {
            [_unit] call FUNC(setDead);
        };

        if (_delayedUnconsicous) then {
            [{
                [_this select 0, true] call FUNC(setUnconscious);
            }, [_unit], 0.7, 0] call EFUNC(common,waitAndExec);
        } else {
            [{
                [_this select 0, true] call FUNC(setUnconscious);
            }, [_unit]] call EFUNC(common,execNextFrame);
        };
    };

    _totalDamage = _totalDamage min 0.89;
};

// revive mode
if (((_unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)]) > 0) && {_damageReturn >= 0.9} && {_selection in ["", "head", "body"]}) then {
    if (vehicle _unit != _unit && {damage vehicle _unit >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };

    [_unit] call FUNC(setDead);

    _totalDamage = _totalDamage min 0.89;
};

_unit setHit [_selection, _totalDamage];

systemChat format ["selection damaged: %1", _this];
