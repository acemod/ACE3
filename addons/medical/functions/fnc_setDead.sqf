/*
 * Author: Glowbal
 * Either kills a unit or puts the unit in a revivable state, depending on the settings.
 *
 * Arguments:
 * 0: The unit that will be killed <OBJECT>
 * 1: Force Dead (ignore revive setting) <BOOL>
 * 1: Delay setDamage for a frame  <BOOL>
 *
 * ReturnValue:
 * Did he died? <BOOL>
 *
 * Public: yes
 */

#include "script_component.hpp"

private ["_reviveVal", "_lifesLeft"];
params ["_unit", ["_force", false], ["_delaySetDamage", false]];

if ((!alive _unit) || {_unit getVariable ["ACE_isDead", false]}) exitWith {true};
if (!local _unit) exitwith {
    [[_unit, _force], QUOTE(DFUNC(setDead)), _unit, false] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    false;
};

_reviveVal = _unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)];
if (((_reviveVal == 1 && {[_unit] call EFUNC(common,isPlayer)} || _reviveVal == 2)) && !_force) exitwith {
    if (_unit getVariable [QGVAR(inReviveState), false]) exitwith {
        if (GVAR(amountOfReviveLives) > 0) then {
            _lifesLeft = _unit getVariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
            if (_lifesLeft == 0) then {
                [_unit, true] call FUNC(setDead);
            };
        };

        false;
    };

    _unit setVariable [QGVAR(inReviveState), true, true];
    _unit setVariable [QGVAR(reviveStartTime), ACE_time];
    [_unit, true] call FUNC(setUnconscious);

    [{
        private "_startTime";
        params ["_args", "_idPFH"];
        _args params ["_unit"];
        _startTime = _unit getVariable [QGVAR(reviveStartTime), 0];

        if (GVAR(maxReviveTime) > 0 && {ACE_time - _startTime > GVAR(maxReviveTime)}) exitwith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
            _unit setVariable [QGVAR(inReviveState), nil, true];
            _unit setVariable [QGVAR(reviveStartTime), nil];
            [_unit, true] call FUNC(setDead);
        };

        if !(_unit getVariable [QGVAR(inReviveState), false]) exitwith {
            // revived without dieing, so in case we have lifes, remove one.
            if (GVAR(amountOfReviveLives) > 0) then {
                _lifesLeft = _unit getVariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
                _unit setVariable [QGVAR(amountOfReviveLives), _lifesLeft - 1, true];
            };

            _unit setVariable [QGVAR(reviveStartTime), nil];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
        if (GVAR(level) >= 2) then {
            if (_unit getVariable [QGVAR(heartRate), 60] > 0) then {
                _unit setVariable [QGVAR(heartRate), 0];
            };
        };
    }, 1, [_unit] ] call CBA_fnc_addPerFrameHandler;
    false;
};

_unit setVariable ["ACE_isDead", true, true];
if (isPLayer _unit) then {
    _unit setVariable ["isDeadPlayer", true, true];
};

["medical_onSetDead", [_unit]] call EFUNC(common,localEvent);

//Delay a frame before killing the unit via scripted damage 
//to avoid triggering the "Killed" Event twice (and having the wrong killer)

if (!_delaySetDamage) then {
    [_unit, 1] call FUNC(setStructuralDamage);
} else {
    [FUNC(setStructuralDamage), [_unit, 1]] call EFUNC(common,execNextFrame);
};

true;
