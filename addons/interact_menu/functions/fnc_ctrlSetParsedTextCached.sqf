/*
 * Author: commy2
 * Sets the controls structured text if it isn't already set.
 *
 * Arguments:
 * 0: Structured Text Ctrl <CONTROL>
 * 1: Index <NUMBER>
 * 2: Text <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 5, "text"] call ACE_interact_menu_fnc_ctrlSetParsedTextCached
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ctrl", "_index", "_text"];

//systemChat str (_text != ARR_SELECT(GVAR(ParsedTextCached),_index,"-1"));

if (_text != (GVAR(ParsedTextCached) param [_index,"-1"])) then {
    GVAR(ParsedTextCached) set [_index, _text];
    _ctrl ctrlSetStructuredText parseText _text;
};
