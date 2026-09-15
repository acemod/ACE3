#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Generate a "Text to Texture"
 *
 * Arguments:
 * 0: Display Text <STRING>
 * 1: Text Size <NUMBER> (default: 0.3)
 * 2: Text Color (in HEX 6 or 8) <STRING> (default: "000000" - black)
 * 3: Background Color (in HEX 6 or 8) <STRING> (default: "00000000" - transparent)
 * 4: Auto newlines <BOOL> (default: true)
 * 5: Texture Dimensions <NUMBER> (default: 512)
 *
 * Return Value:
 * Texture <STRING>
 *
 * Example:
 * ["your text"] call ace_tagging_fnc_generateStencilTexture
 *
 * Public: No
 */

params [
    ["_text", "", [""]],
    ["_textSize", 0.3, [0]],
    ["_textColor", "000000", [""]],
    ["_backgroundColor", "00000000", [""]],
    ["_autoMultiline", true, [false]],
    ["_dimension", 512, [0]]
];

if (_textColor select [0, 1] == "#") then {_textColor = _textColor select [1];};
if (_backgroundColor select [0, 1] == "#") then {_backgroundColor = _backgroundColor select [1];};
if !((count _textColor) in [6,8]) exitWith {ERROR_1("bad Tcolor %1",_textColor); ""};
if !((count _backgroundColor) in [6,8]) exitWith {ERROR_1("bad Bcolor %1",_textColor); ""};

if (_autoMultiline) then {
    private _magicWidth = 0.75;
    private _words = _text splitString " ";
    private _lines = [];
    while {_words isNotEqualTo []} do {
        private _size = count _words;
        while {_size > 1} do {
            private _testLine = (_words select [0, _size]) joinString " ";
            if ((_testLine getTextWidth ["ACE_Stencil", _textSize]) < _magicWidth) exitWith {};
            _size = _size - 1;
        };
        _lines pushBack ((_words select [0, _size]) joinString " ");
        _words = _words select [_size, (count _words) - _size];
    };
    _text = _lines joinString "\n";
};

// return
format ['#(rgb,%1,%1,3)text(1,1,"ACE_Stencil",%2,"#%3","#%4","%5")', _dimension, _textSize, _backgroundColor, _textColor, _text]
