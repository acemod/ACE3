/*
 * Author: SzwedzikPL
 * Server: creates new dogtag item and send it to client
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

if(!isServer) exitWith {};

params ["_target", "_unit"];
TRACE_2("getDogtagItem",_target,_unit);

private _allDogtags = missionNamespace getVariable [QGVAR(allDogtags), []];
private _allDogtagNicknames = missionNamespace getVariable [QGVAR(allDogtagNicknames), []];

private _nextID = count _allDogtags + 1;

if (_nextID > 999) exitWith {};

private _nickname = [_unit, false, true] call EFUNC(common,getName);
private _item = format ["ACE_dogtag_%1", _nextID];
_allDogtags pushBack _item;
_allDogtagNicknames pushBack _nickname;

missionNamespace setVariable [QGVAR(allDogtags), _allDogtags];
missionNamespace setVariable [QGVAR(allDogtagNicknames), _allDogtagNicknames];

if(isMultiplayer) then {
    [QGVAR(addDogtagItem), [_item, _nickname], [_target]] call CBA_fnc_targetEvent;
} else {
    [QGVAR(addDogtagItem), [_item, _nickname]] call CBA_fnc_localEvent;
};
