/*
 * Author: commy2
 *
 * Calls different scripted fired eventhandlers to reduce number of sanity checks, calls of specific functions, etc.
 * Arguments are passed as _this select 0, additional arguments are passed as _this select 1.
 * Additional arguments:
 *  _this select 1 select 0: the gunner
 *  _this select 1 select 1: turret index that fired
 *
 * Argument:
 * Stuff from fired eh.
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

private "_gunner";

_gunner = _this select 0;

if (local _gunner) then {
    ["firedSoldier", [_this, [_gunner, []]]] call FUNC(localEvent);
};

if (local _gunner) then {
    ["firedSoldierLocal", [_this, [_gunner, []]]] call FUNC(localEvent);

    if (_gunner == ACE_player) then {
        ["firedSoldierPlayer", [_this, [_gunner, []]]] call FUNC(localEvent);
    };
};
