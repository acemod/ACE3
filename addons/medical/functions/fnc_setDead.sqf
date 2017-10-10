/*
 * Author: Glowbal
 * Either kills a unit or puts the unit in a revivable state, depending on the settings.
 *
 * Arguments:
 * 0: The unit that will be killed <OBJECT>
 * 1: Force Dead (ignore revive setting) <BOOL> (default: false)
 * 1: Delay setDamage for a frame  <BOOL> (default: false)
 *
 * Return Value:
 * Did he died? <BOOL>
 *
 * Example:
 * [bob, false, false] call ace_medical_fnc_setDead
 *
 * Public: yes
 */

#include "script_component.hpp"

params ["_unit", ["_force", false], ["_delaySetDamage", false]];

if ((!alive _unit) || {_unit getVariable ["ACE_isDead", false]}) exitWith {true};
if (!local _unit) exitwith {
    [QGVAR(setDead), [_unit, _force], _unit] call CBA_fnc_targetEvent;
    false;
};

private _reviveVal = _unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)];
if (((_reviveVal == 1 && {[_unit] call EFUNC(common,isPlayer)} || _reviveVal == 2)) && !_force) exitwith {
    if (_unit getVariable [QGVAR(inReviveState), false]) exitwith {
        if (GVAR(amountOfReviveLives) > 0) then {
            private _lifesLeft = _unit getVariable[QGVAR(amountOfReviveLives), GVAR(amountOfReviveLives)];
            if (_lifesLeft <= 0) then {
                [_unit, true] call FUNC(setDead);
            };
        };

        false;
    };

    _unit setVariable [QGVAR(inReviveState), true, true];
    _unit setVariable [QGVAR(reviveStartTime), CBA_missionTime];
    [_unit, true] call FUNC(setUnconscious);

    // Run the loop that tracks the revive state
    [_unit ] call FUNC(reviveStateLoop);
    false;
};

_unit setVariable ["ACE_isDead", true, true];
if (isPLayer _unit) then {
    _unit setVariable ["isDeadPlayer", true, true];
};

["ace_killed", [_unit]] call CBA_fnc_localEvent;

//Delay a frame before killing the unit via scripted damage
//to avoid triggering the "Killed" Event twice (and having the wrong killer)

if (!_delaySetDamage) then {
    [_unit, 1] call FUNC(setStructuralDamage);
} else {
    [FUNC(setStructuralDamage), [_unit, 1]] call CBA_fnc_execNextFrame;
};

true;
