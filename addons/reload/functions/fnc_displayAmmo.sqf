/*
 * Author: commy2 and esteldunedain
 * Display the ammo of the currently loaded magazine of the target or count rifle grenades.
 *
 * Argument:
 * 0: Target <OBJECT>
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

#define COUNT_BARS 12

EXPLODE_1_PVT(_this,_target);

private ["_weapon","_muzzle","_magazine","_showNumber","_ammo","_maxRounds","_count","_text","_color","_picture","_ammoBarsStructuredText", "_a", "_loadedName", "_string"];

_weapon = currentWeapon _target;
_muzzle = currentMuzzle _target;
_magazine = currentMagazine _target;

// currentWeapon returns "" for static weapons before they are shot once
if (_target isKindOf "StaticWeapon") then {
    if (_weapon == "") then {
        if (count (weapons _target) == 1) then {
            _weapon = (weapons _target) select 0;
            _muzzle = _weapon;
        };
    };

    if (_magazine == "") then {
        // Try to get magazine using magazinesAmmoFull
        private ["_magazines"];
        _magazines = magazinesAmmoFull _target;
        {
            if (_x select 2) exitWith {
                _magazine = _x select 0;
            };
        } forEach _magazines;
    };
};

if (_magazine == "") exitWith {};
if (_weapon == "") exitWith {};
if (!( _muzzle isEqualType "")) then {_muzzle = _weapon};

_showNumber = false;
_ammo = 0;
_maxRounds = 1;
_count = 0;

// not grenade launcher
if (_muzzle == _weapon) then {
    _maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count") max 1;

    _ammo = _target ammo _weapon;
    if (_maxRounds >= COUNT_BARS) then {
        _count = round (COUNT_BARS * _ammo / _maxRounds);

        if (_ammo > 0) then {_count = _count max 1};
        if (_ammo < _maxRounds) then {_count = _count min (COUNT_BARS - 1)};
    } else {
        _count = _ammo;
    };

    // grenade launcher
} else {
    _showNumber = true;

    _count = if (_magazine != "") then {
        {_x == _magazine} count (magazines _target + [_magazine])
    } else {
        {_x in getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "Magazines")} count magazines _target
    };
};

_ammoBarsStructuredText = if (_showNumber) then {
    parseText format ["<t align='center' >%1x</t>", _count]
} else {
    _color = [((2 * (1 - _ammo / _maxRounds)) min 1), ((2 * _ammo / _maxRounds) min 1), 0];

    _string = "";
    for "_a" from 1 to _count do {
        _string = _string + "|";
    };
    _text = [_string, _color] call EFUNC(common,stringToColoredText);

    _string = "";
    for "_a" from (_count + 1) to (_maxRounds min COUNT_BARS) do {
        _string = _string + "|";
    };

    composeText [_text, [_string, [0.5, 0.5, 0.5]] call EFUNC(common,stringToColoredText)];
};


if (_target isKindOf "StaticWeapon") then {
    //Vehicle mags (usualy) don't have pictures, so just show the text above ammo count
    _loadedName = getText (configFile >> "CfgMagazines" >> _magazine >> "displaynameshort");
    _loadedName = parseText format ["<t align='center' >%1</t>", _loadedName];
    _text = composeText [_loadedName, linebreak, _ammoBarsStructuredText];
    [_text] call EFUNC(common,displayTextStructured);
} else {
    _picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");
    [_ammoBarsStructuredText, _picture] call EFUNC(common,displayTextPicture);
};
