#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Server: returns to client data on given dogtag.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_sendDogtagData
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_target", "_item"];
TRACE_2("sendDogtagData",_target,_item);

private _allDogtags = missionNameSpace getVariable [QGVAR(allDogtags), []];
private _allDogtagDatas = missionNameSpace getVariable [QGVAR(allDogtagDatas), []];

private _dogtagData = [];
private _index = _allDogtags find _item;
if (_index >= 0) then {
    _dogtagData = _allDogtagDatas select _index;
};

[QGVAR(showDogtag), [_dogtagData], [_target]] call CBA_fnc_targetEvent;
