#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Server: creates new dogtag item and send it to client.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, unit] call ace_dogtags_fnc_getDogtagItem
 *
 * Public: No
 */

if(!isServer) exitWith {};

params ["_player", "_target"];
TRACE_2("getDogtagItem",_player,_target);

private _allDogtags = missionNamespace getVariable [QGVAR(allDogtags), []];
private _allDogtagDatas = missionNamespace getVariable [QGVAR(allDogtagDatas), []];

private _nextID = count _allDogtags + 1;

if (_nextID > 999) exitWith {ERROR("Ran out of IDs");};

private _dogTagData = [_target] call FUNC(getDogTagData);
private _item = format ["ACE_dogtag_%1", _nextID];
_allDogtags pushBack _item;
_allDogtagDatas pushBack _dogTagData;

missionNamespace setVariable [QGVAR(allDogtags), _allDogtags];
missionNamespace setVariable [QGVAR(allDogtagDatas), _allDogtagDatas];

[QGVAR(addDogtagItem), [_item, _dogTagData], [_player]] call CBA_fnc_targetEvent;
