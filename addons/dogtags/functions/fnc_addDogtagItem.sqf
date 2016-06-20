/*
 * Author: SzwedzikPL
 * Adds dogtag item to unit (triggered by server)
 *
 * Arguments:
 * 0: Item class <STRING>
 * 1: Dogtag data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_dogtagData"];

if (_item == "") exitWith {};

[ace_player, _item] call CBA_fnc_addItem;

_dogtagData params ["_nickName"];
private _displayText = format [localize LSTRING(takeDogtagSuccess), _nickName];
[_displayText] call EFUNC(common,displayText);
