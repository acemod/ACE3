#include "..\script_component.hpp"
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

GVAR(idCounter) = GVAR(idCounter) + 1;

if (GVAR(idCounter) > 999) exitWith {ERROR("Ran out of IDs");};

private _dogTagData = [_target] call FUNC(getDogTagData);
private _item = format ["ACE_dogtag_%1", GVAR(idCounter)];


[QGVAR(addDogtagItem), [_item, _dogTagData], [_player]] call CBA_fnc_targetEvent;

// Broadcast data globally, so that clients can use it where needed
[QGVAR(broadcastDogtagInfo), [_item, _dogTagData]] call CBA_fnc_globalEvent;
