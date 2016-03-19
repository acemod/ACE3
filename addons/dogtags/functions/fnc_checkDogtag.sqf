/*
 * Author: SzwedzikPl
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

if(_target getVariable [QGVAR(dogtagTaken), false]) then {
    [localize LSTRING(noDogtag)] call EFUNC(common,displayText);
} else {
    private _nickname = [_target, false, true] call EFUNC(common,getName);
    [QGVAR(showDogtag), [_nickname]] call EFUNC(common,localEvent);
};
