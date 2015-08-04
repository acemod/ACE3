/*
 * Author: commy2
 *
 * Revert a key code to a readible text.
 *
 * Argument:
 * 0: Key code (Number)
 *
 * Return value:
 * What input will result in the given key code? (String)
 */
#include "script_component.hpp"

private ["_key", "_alt", "_ctrl", "_shift"];

params ["_keyCode"];

_key = toString ((toArray keyName floor _keyCode) - [34]);

_keyCode = round ((_keyCode % 1) * 10);

switch (_keyCode) do {
    case 8 : {format [localize QUOTE(DOUBLES(STR,GVAR(DoubleTapKey))), _key]};
    case 9 : {format [localize QUOTE(DOUBLES(STR,GVAR(HoldKey))), _key]};
    default {
        _keyCode = toArray ([_keyCode, 3] call FUNC(toBin));

        _alt = "1" == toString [_keyCode select 0];
        _ctrl = "1" == toString [_keyCode select 1];
        _shift = "1" == toString [_keyCode select 2];

        format ["%1%2%3%4",
          ["", format ["%1 + ", localize QUOTE(DOUBLES(STR,GVAR(Alt)))]] select _alt,
          ["", format ["%1 + ", localize QUOTE(DOUBLES(STR,GVAR(Ctrl)))]] select _ctrl,
          ["", format ["%1 + ", localize QUOTE(DOUBLES(STR,GVAR(Shift)))]] select _shift,
          _key
        ]
    };
};
