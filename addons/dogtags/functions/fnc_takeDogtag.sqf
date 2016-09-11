/*
 * Author: SzwedzikPL
 * If dogtag is not already taken triggers event on server.
 * If dogtag already taken displays info about it.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_takeDogtag
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_target"];

if ((_target getVariable [QGVAR(dogtagTaken), objNull]) == _target) then {
    [localize LSTRING(dogtagAlreadyTaken)] call EFUNC(common,displayText);
} else {
    _target setVariable [QGVAR(dogtagTaken), _target, true];
    [QGVAR(getDogtagItem), [_player, _target]] call CBA_fnc_serverEvent;
};
