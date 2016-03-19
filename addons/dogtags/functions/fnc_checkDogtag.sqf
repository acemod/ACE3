/*
 * Author: SzwedzikPL
 * Checks unit dogtag
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_target"];

private _doubleTags = !(_target getVariable [QGVAR(dogtagTaken), false]);
private _nickname = [_target, false, true] call EFUNC(common,getName);
[QGVAR(showDogtag), [_nickname, _doubleTags]] call EFUNC(common,localEvent);
