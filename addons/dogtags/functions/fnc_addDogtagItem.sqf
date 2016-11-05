/*
 * Author: SzwedzikPL
 * Adds dogtag item to unit (triggered by server).
 *
 * Arguments:
 * 0: Item class <STRING>
 * 1: Dogtag data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["itemClass", ["name", "610-27-5955", "A POS"]] call ace_dogtags_fnc_addDogtagItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_dogtagData"];

if (_item == "") exitWith {};

[ace_player, _item] call CBA_fnc_addItem;

_dogtagData params ["_nickName"];
private _displayText = format [localize LSTRING(takeDogtagSuccess), _nickName];

// display message
[{
    [_this, 2.5] call EFUNC(common,displayTextStructured);
}, _displayText, DOGTAG_SHOW_DELAY] call CBA_fnc_waitAndExecute;
