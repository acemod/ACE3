/*
 * Author: KoffeinFlummi, Glowbal, commy2
 * Main HandleDamage EH function.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <OBJECT/STRING>
 *
 * Return Value:
 * Damage To Be Inflicted <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_selection", "_damage", "_shooter", "_projectile"];
TRACE_5("ACE_DEBUG: HandleDamage Called",_unit,_selection,_damage,_shooter,_projectile);

// bug, apparently can fire for remote units in special cases
if !(local _unit) exitWith {
    TRACE_2("ACE_DEBUG: HandleDamage on remote unit!",_unit,isServer);
    nil
};

// bug, assumed fixed, @todo excessive testing, if nothing happens remove
if (typeName _projectile == "OBJECT") then {
    TRACE_3("ACE_DEBUG: HandleDamage found projectile instead of classname of ammo!",_unit,_projectile,typeOf _projectile);
    _projectile = typeOf _projectile;
    _this set [4, _projectile];
};



// Exit now we disable damage, replaces "allowDamage false"
// @todo Needs testing. I think this doesn't work, because handleDamage never returns the numbers if you use exitWith. You simply exit the scope with nothing - commy2
if !(_unit getVariable [QGVAR(allowDamage), true]) exitWith {
    TRACE_2("ACE_DEBUG: HandleDamage damage disabled.",_selection,_unit);
    if (_selection == "") then {
        damage _unit
    } else {
        _unit getHit _selection
    };
};

//player sideChat str _this;//

private ["_damageReturn", "_newDamage"];

// apply damage scripted
if (_selection == "") then {
    _damageReturn = _damage;
    _newDamage = _damage - damage _unit;

    private "_cachedStructuralDamage";
    _cachedStructuralDamage = _unit getVariable [QGVAR(cachedStructuralDamageNew), 0];

    // handle damage always tries to start and end with the same structural damage call. Use that to find and set the final damage. discard everything the game discards too.
    if (_damage == _cachedStructuralDamage) then {
        private "_cachedNewHitpointDamages";
        _cachedNewHitpointDamages = _unit getVariable [QGVAR(cachedNewHitpointDamages), [0,0,0,0,0,0]];

        // this is the only point damage actually counts. all additional vitality functions should use these values.
        {
            private "_selection";
            _selection = GVAR(Selections) select _forEachIndex;

            //systemChat str [_selection, _x];//
            _unit setHit [_selection, (_unit getHit _selection) + _x];
        } forEach _cachedNewHitpointDamages;
    } else {
        // check for fall damage. this triggers twice, but seems to happen on the same frame. shouldn't fall twice in a few frames anyway. tested at 7FPS on local host MP
        if (animationState _unit select [0,4] == "afal") then {
            private "_cachedLastFallDamageFrame";
            _cachedLastFallDamageFrame = _unit getVariable [QGVAR(cachedLastFallDamageFrame), -1];

            if (diag_frameno != _cachedLastFallDamageFrame) then {
                ["medical_onFallDamage", [_unit, _newDamage]] call EFUNC(common,localEvent);
                _unit setVariable [QGVAR(cachedLastFallDamageFrame), diag_frameno];
            };

            _damageReturn = damage _unit;
        };

        // check for drowning damage. Pretty relyable damage output. triggers only once.
        if (getOxygenRemaining _unit < 0.5) then {
            // typical drowning damage
            if (_newDamage == 0.005) then {
                ["medical_onDrowningDamage", [_unit, _newDamage]] call EFUNC(common,localEvent);
                _damageReturn = damage _unit - 0.005; // engine applies damage before hd call. subtract again here.
            };

            // suffocated under water might use atypical new damage (mostly 1.005)
            if (getOxygenRemaining _unit == 0) then {
                ["medical_onDrowningDamage", [_unit, _newDamage min 1]] call EFUNC(common,localEvent);
                _damageReturn = damage _unit; // you will die regardless of hd return value
            };
        };
    };

    // reset everything, get ready for the next bullet
    _unit setVariable [QGVAR(cachedNewHitpointDamages), [0,0,0,0,0,0]];
    _unit setVariable [QGVAR(cachedStructuralDamageNew), _damage];

} else {
    // selections are done scripted. return same value to change nothing.
    _damageReturn = _unit getHit _selection;
    _newDamage = _damage - _damageReturn; // _damageReturn because it saves one getHit call

    private "_index";
    _index = GVAR(SELECTIONS) find _selection;

    // a selection we care for was hit. now save the new damage to apply it by a later structural damage call
    if (_index != -1) then {
        private "_cachedNewHitpointDamages";
        _cachedNewHitpointDamages = _unit getVariable [QGVAR(cachedNewHitpointDamages), [0,0,0,0,0,0]];

        // prevents multiple selections from being hit by one bullet due to hitpoint radius system
        {
            // ignore this damage if it's a secondary selection (minor damage)
            if (_x > _newDamage) exitWith {
                _newDamage = 0;
            };

            // overwrite minor damage in secondary selections
            if (_x > 0) then {
                _cachedNewHitpointDamages set [_forEachIndex, 0];
            };
        } forEach _cachedNewHitpointDamages;

        // apply these by the next matching hd call with selection "". If that one is not matching, this gets discarded
        _cachedNewHitpointDamages set [_index, _newDamage];
        _unit setVariable [QGVAR(cachedNewHitpointDamages), _cachedNewHitpointDamages];
    };
};

//systemChat str (velocity _unit select 2);//
diag_log text _selection;
diag_log text str _damage;//
diag_log text animationState _unit;//

private ["_typeOfDamage", "_typeIndex", "_minLethalDamage", "_preventDeath"];

_typeOfDamage = [_projectile] call FUNC(getTypeOfDamage);
_typeIndex = (GVAR(allAvailableDamageTypes) find _typeOfDamage);

_minLethalDamage = if (_typeIndex >= 0) then {
    GVAR(minLethalDamages) select _typeIndex
} else {
    0.01
};

if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {isNull _shooter} && {_projectile == ""} && {_selection == ""}) then {
    if (GVAR(enableVehicleCrashes)) then {
        _selection = GVAR(SELECTIONS) select (floor(random(count GVAR(SELECTIONS))));
    };
};

// @todo, figure out what this does and then re-implement
/*if ((_minLethalDamage <= _newDamage) && {[_unit, [_selection] call FUNC(selectionNameToNumber), _newDamage] call FUNC(determineIfFatal)}) then {
    if ((_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)])) exitwith {
        _damageReturn = 0.9;
    };
    if ([_unit] call FUNC(setDead)) then {
        _damageReturn = 1;
    } else {
        _damageReturn = _damageReturn min 0.89;
    };
} else {
    _damageReturn = _damageReturn min 0.89;
};*/

[_unit] call FUNC(addToInjuredCollection);

// @todo, reimplement prevent insta death
/*if (_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)]) exitWith {
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };

    private "_delayedUnconsicous";
    _delayedUnconsicous = false;
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
        _delayedUnconsicous = true;
    };

    if (_damageReturn >= 0.9 && {_selection in ["", "head", "body"]}) exitWith {
        if (_unit getvariable ["ACE_isUnconscious", false]) exitwith {
            [_unit] call FUNC(setDead);
            0.89;
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
        0.89;
    };
    _damageReturn min 0.89;
};*/

// @todo, reimplement zombie mode
/*if (((_unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)]) > 0) && {_damageReturn >= 0.9} && {_selection in ["", "head", "body"]}) exitWith {
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };
    [_unit] call FUNC(setDead);
    0.89;
};*/

TRACE_3("ACE_DEBUG: HandleDamage damage return",_selection,_damageReturn,_unit);

_damageReturn
