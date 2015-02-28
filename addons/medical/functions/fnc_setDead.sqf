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

private ["_unit"];
_unit = _this select 0;
_force = false;
if (count _this >= 2) then {
    _force = _this select 1;
};

if (!alive _unit) exitwith{};
if (!local _unit) exitwith {
    [[_unit, _force], QUOTE(DFUNC(setDead)), _unit, false] call EFUNC(common,execRemoteFnc);
};

if (missionName getVariable [QGVAR(enableRevive), false]) exitwith {
    // TODO Implement the revive state
};

_unit setvariable ["ACE_isDead", true, true];
if (isPLayer _unit) then {
    _unit setvariable ["isDeadPlayer", true, true];
};
_unit setdamage 1;
