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

if (isnil QGVAR(ENABLE_REVIVE_F)) then {
    GVAR(ENABLE_REVIVE_F) = 0;
};

if (((GVAR(ENABLE_REVIVE_F) == 1 && isPlayer _unit) || (GVAR(ENABLE_REVIVE_F) == 2)) && !_force && (alive (vehicle _unit))) exitwith {
    // enter revive state
    _unit setvariable [QGVAR(inReviveState), true, true];

    // Remain unconscious while in revive state
    [_unit] call FUNC(setUnconsciousState);

    // setting the revive default values
    if (isnil QGVAR(REVIVE_TIMER_F)) then {
        GVAR(REVIVE_TIMER_F) = 10;
    };
    if (isnil QGVAR(REVIVE_NUMBER_MAX_F)) then {
        GVAR(REVIVE_NUMBER_MAX_F) = -1;
    };

    [{
        private ["_unit","_playerDead","_counter"];
        _unit = (_this select 0) select 0;
        _playerDead = (_this select 0) select 1;

        // Check if a unit woke up or was already killed
        if (!([_unit] call FUNC(isUnconscious)) || !alive _unit) exitwith {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;

            // Cleaning up the variables, as we no longer need them.
            _unit setvariable [QGVAR(reviveCounter_f), nil];
            _unit setvariable [QGVAR(inReviveState), nil, true];
        };

        _counter = _unit getvariable [QGVAR(reviveCounter_f), 0];
        if (_counter >= GVAR(REVIVE_TIMER_F)) exitwith{
            if (isPlayer _unit) then {
                titleText ["You died..","PLAIN DOWN"];
            };
            [_unit,QGVAR(isDead), true, true] call FUNC(setDefinedVariable);
            if (_playerDead) then {
                [_unit,QGVAR(isDeadPlayer),true,true] call FUNC(setDefinedVariable);
            };

            _unit setdamage 1; // killing a unit will automatically clean up all variables.

            [[_unit, true],"killed"] call FUNC(raiseScriptedEvent_f);
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
        _unit setvariable [QGVAR(reviveCounter_f),_counter + TIME_BETWEEN_REVIVE_RUNS];

    }, TIME_BETWEEN_REVIVE_RUNS, [_unit, isPlayer _unit] ] call CBA_fnc_addPerFrameHandler;

};

[_unit,QGVAR(isDead),true,true] call FUNC(setDefinedVariable);
if (isPLayer _unit) then {
    [_unit,QGVAR(isDeadPlayer),true,true] call FUNC(setDefinedVariable);
};

_unit setdamage 1;

[[_unit, false],"killed"] call FUNC(raiseScriptedEvent_f);
