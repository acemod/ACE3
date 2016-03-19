/*
 * Author: SzwedzikPl
 * Server: returns to client nickname on given dogtag
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

params ["_target", "_item"];
TRACE_2("sendDogtagData",_target,_item);

private _allDogtags = missionNameSpace getVariable [QGVAR(allDogtags), []];
private _allDogtagNicknames = missionNameSpace getVariable [QGVAR(allDogtagNicknames), []];

private _nickname = "";
private _index = _allDogtags find _item;
if(_index >= 0) then {
    _nickname = _allDogtagNicknames select _index;
};

[QGVAR(showDogtag), [_target], [_nickname]] call EFUNC(common,targetEvent);
