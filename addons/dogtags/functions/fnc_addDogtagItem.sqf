/*
 * Author: SzwedzikPl
 * Adds dogtag item to unit (triggered by server)
 *
 * Arguments:
 * 0: Item class <STRING>
 * 1: Nickname on dogtag <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_nickname"];

if(_item == "") exitWith {};

[ace_player, _item] call CBA_fnc_addItem;

private _displayText = format [localize LSTRING(takeDogtagSuccess), _nickname];
[_displayText] call EFUNC(common,displayText);
