/*
 * Author: commy2
 *
 * Reload a launcher
 *
 * Argument:
 * 0: Unit with magazine (Object)
 * 1: Unit with launcher (Object)
 * 2: weapon name (String)
 * 3: missile name (String)
 *
 * Return value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_target", "_weapon", "_magazine"];

_unit = _this select 0;
_target = _this select 1;
_weapon = _this select 2;
_magazine = _this select 3;

//do stuff

/**/

// reload launcher on remote machine
["reloadLauncher", _target, [_target, _weapon, _magazine]] call EFUNC(common,targetEvent);
