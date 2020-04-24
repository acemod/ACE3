#include "script_component.hpp"
/*
 * Author: commy2, Glowbal, GitHawk
 * Display a structured text.
 *
 * Arguments:
 * 0: Text <ANY>
 * 1: Size of the textbox <NUMBER> (default: 1.5)
 * 2: Target Unit. Will only display if target is the player controlled object <OBJECT> (default: ACE_player)
 * 3: Custom Width <NUMBER> (default: 10)
 *
 * Return Value:
 * None
 *
 * Example:
 * [["Test: %1", 123], 1.5] call ace_common_fnc_displayTextStructured
 * ["wow", 1, ace_player, 3] call ace_common_fnc_displayTextStructured
 *
 * Public: Yes
 */

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

if (_target != ACE_player) exitWith {};

if (typeName _text != "TEXT") exitwith {
    if (_text isEqualType []) then {
        if (count _text > 0) then {
            {
                if (_x isEqualType "" && {isLocalized _x}) then {
                    _text set [_foreachIndex, localize _x];
                };
            }foreach _text;
            _text = format _text;
        };
    };
    if (_text isEqualType "" && {isLocalized _text}) then {
        _text = localize _text;
    };
    (format ["<t align='center'>%1</t>", _text]) call CBA_fnc_notify;
};

str(_text) call CBA_fnc_notify;
