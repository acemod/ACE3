/*
 * Author: Glowbal
 * Either kills a unit or puts the unit in a revivable state, depending on the settings.
 *
 * Arguments:
 * 0: The unit that will be killed <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: yes
 */

#include "script_component.hpp"

private ["_unit", "_force", "_reviveVal", "_lifesLeft"];
_unit = _this select 0;
_force = false;
if (count _this >= 2) then {
    _force = _this select 1;
};

if (!alive _unit) exitwith{true};
if (!local _unit) exitwith {
    [[_unit, _force], QUOTE(DFUNC(setDead)), _unit, false] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    false;
};

_reviveVal = _unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)];
if (((_reviveVal == 1 && {[_unit] call EFUNC(common,isPlayer)} || _reviveVal == 2)) && !_force) exitwith {
    if (_unit getvariable [QGVAR(inReviveState), false]) exitwith {
        if (GVAR(amountOfReviveLives) > 0) then {
            _lifesLeft = _unit getvariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
            if (_lifesLeft == 0) then {
                [_unit, true] call FUNC(setDead);
            };
        };

        false;
    };

    _unit setvariable [QGVAR(inReviveState), true, true];
    _unit setvariable [QGVAR(reviveStartTime), ACE_time];
    [_unit, true] call FUNC(setUnconscious);

    [{
        private ["_args","_unit","_startTime"];
        _args = _this select 0;
        _unit = _args select 0;
        _startTime = _unit getvariable [QGVAR(reviveStartTime), 0];

        if (ACE_time - _startTime > GVAR(maxReviveTime)) exitwith {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
            _unit setvariable [QGVAR(inReviveState), nil, true];
            _unit setvariable [QGVAR(reviveStartTime), nil];
            [_unit, true] call FUNC(setDead);
        };

        if !(_unit getvariable [QGVAR(inReviveState), false]) exitwith {
            // revived without dieing, so in case we have lifes, remove one.
            if (GVAR(amountOfReviveLives) > 0) then {
                _lifesLeft = _unit getvariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
                _unit setvariable [QGVAR(amountOfReviveLives), _lifesLeft - 1, true];
            };

            _unit setvariable [QGVAR(reviveStartTime), nil];
            [(_this select 1)] call cba_fnc_removePerFrameHandler;
        };
        if (GVAR(level) >= 2) then {
            if (_unit getvariable [QGVAR(heartRate), 60] > 0) then {
                _unit setvariable [QGVAR(heartRate), 0];
            };
        };
    }, 1, [_unit] ] call CBA_fnc_addPerFrameHandler;
    false;
};

_unit setvariable ["ACE_isDead", true, true];
if (isPLayer _unit) then {
    _unit setvariable ["isDeadPlayer", true, true];
};

["medical_onSetDead", [_unit]] call EFUNC(common,localEvent);

_unit setdamage 1;
true;
