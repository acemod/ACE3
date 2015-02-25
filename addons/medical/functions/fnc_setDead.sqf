/**
 * fn_setDead.sqf
 * @Descr: Kills a unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

#define TIME_BETWEEN_REVIVE_RUNS    0.5

private ["_unit"];
_unit = _this select 0;
_force = false;
if (count _this >= 2) then {
    _force = _this select 1;
};

if (!alive _unit) exitwith{};
if (!local _unit) exitwith {
    [[_unit, _force], QUOTE(FUNC(setDead)), _unit, false] call BIS_fnc_MP;
};

if (isnil QGVAR(ENABLE_REVIVE)) then {
    GVAR(ENABLE_REVIVE) = 0;
};

if (((GVAR(ENABLE_REVIVE) == 1 && isPlayer _unit) || (GVAR(ENABLE_REVIVE) == 2)) && !_force && (alive (vehicle _unit))) exitwith {
    // enter revive state
    _unit setvariable ["ACE_inReviveState", true, true];

    // Remain unconscious while in revive state
    [_unit] call FUNC(setUnconsciousState);

    // setting the revive default values
    if (isnil QGVAR(REVIVE_TIMER)) then {
        GVAR(REVIVE_TIMER) = 10;
    };
    if (isnil QGVAR(REVIVE_NUMBER_MAX)) then {
        GVAR(REVIVE_NUMBER_MAX) = -1;
    };

    [{
        private ["_unit","_playerDead","_counter"];
        _unit = (_this select 0) select 0;
        _playerDead = (_this select 0) select 1;

        // Check if a unit woke up or was already killed
        if (!([_unit] call FUNC(isUnconscious)) || !alive _unit) exitwith {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;

            // Cleaning up the variables, as we no longer need them.
            _unit setvariable ["ACE_reviveCounterValue", nil];
            _unit setvariable ["ACE_inReviveState", nil, true];
        };

        _counter = _unit getvariable ["ACE_reviveCounterValue", 0];
        if (_counter >= GVAR(REVIVE_TIMER)) exitwith{
            if (isPlayer _unit) then {
                titleText ["You died..","PLAIN DOWN"];
            };
            [_unit,"ACE_isDead", true, true] call EFUNC(common,setDefinedVariable);
            if (_playerDead) then {
                [_unit,QGVAR(isDeadPlayer),true,true] call EFUNC(common,setDefinedVariable);
            };

            _unit setdamage 1; // killing a unit will automatically clean up all variables.

            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
        _unit setvariable ["ACE_reviveCounterValue",_counter + TIME_BETWEEN_REVIVE_RUNS];

    }, TIME_BETWEEN_REVIVE_RUNS, [_unit, isPlayer _unit] ] call CBA_fnc_addPerFrameHandler;

};

[_unit,"ACE_isDead",true,true] call EFUNC(common,setDefinedVariable);
if (isPLayer _unit) then {
    [_unit,QGVAR(isDeadPlayer),true,true] call EFUNC(common,setDefinedVariable);
};

_unit setdamage 1;
