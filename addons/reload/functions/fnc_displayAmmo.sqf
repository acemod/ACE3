#include "..\script_component.hpp"
/*
 * Author: commy2, esteldunedain
 * Display the ammo of the currently loaded magazine of the target or count rifle grenades.
 *
 * Arguments:
 * 0: Unit equipped with the weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_reload_fnc_displayAmmo
 *
 * Public: No
 */

#define COUNT_BARS 12

params ["_target"];

private _isStaticWeapon = _target isKindOf "StaticWeapon";

// currentWeapon, currentMagazine and weaponState return "" for static weapons before they have been entered once
(if (_isStaticWeapon) then {
    private _weapon = currentWeapon _target;

    if (_weapon == "") then {
        private _weapons = weapons _target;

        if (count _weapons == 1) then {
            _weapon = _weapons select 0;
        };
    };

    private _magazine = currentMagazine _target;

    if (_magazine == "") then {
        // Try to get magazine using magazinesAmmoFull
        {
            if (_x select 2) exitWith {
                _magazine = _x select 0;
            };
        } forEach magazinesAmmoFull _target;
    };

    // currentMuzzle always returns ""
    [_weapon, _weapon, "", _magazine]
} else {
    weaponState _target
}) params ["_weapon", "_muzzle", "", "_magazine"];

TRACE_3("",_weapon,_muzzle,_magazine);

if ("" == _weapon) exitWith {};

private _ammo = _target ammo _muzzle;
private _magazineCfg = configFile >> "CfgMagazines" >> _magazine;
private _maxRounds = getNumber (_magazineCfg >> "count") max 1;
private _count = -1; // Show a count instead of ammo bars (ignore if -1)

// If secondary muzzle is selected or no magazine in current muzzle
if (_muzzle != _weapon || {_magazine == ""}) then {
    // Check if no or empty magazine; If true, just show count of compatible magazines
    if (_ammo == 0) exitWith {
        _magazine = ""; // Make sure, as it could also be secondary muzzle being selected

        private _compatibleMagazines = compatibleMagazines [_weapon, _muzzle];

        _count = {_x in _compatibleMagazines} count (magazines _target);
    };

    // singleShot, so show count of identical mags available instead of ammo bars
    if (_ammo > 0 && {_maxRounds == 1}) exitWith {
        _count = 1 + ({_x == _magazine} count (magazines _target));
    };
};

private _ammoBarsStructuredText = if (_count >= 0) then {
    parseText format ["<t align='center' >%1x</t>", _count]
} else {
    if (_maxRounds >= COUNT_BARS) then {
        _count = round (COUNT_BARS * _ammo / _maxRounds);

        if (_ammo > 0) then {
            _count = _count max 1;
        };

        if (_ammo < _maxRounds) then {
            _count = _count min (COUNT_BARS - 1);
        };
    } else {
        _count = _ammo;
    };

    private _color = [(2 * (1 - _ammo / _maxRounds)) min 1, (2 * _ammo / _maxRounds) min 1, 0];

    private _string = "";

    for "_a" from 1 to _count do {
        _string = _string + "|";
    };

    private _text = [_string, _color] call EFUNC(common,stringToColoredText);

    _string = "";

    for "_a" from (_count + 1) to (_maxRounds min COUNT_BARS) do {
        _string = _string + "|";
    };

    composeText [_text, [_string, "#808080"] call EFUNC(common,stringToColoredText)];
};

if (_isStaticWeapon) then {
    // Vehicle mags usually don't have pictures, so just show the text above ammo count
    private _loadedName = getText (_magazineCfg >> "displayNameShort");

    if (_loadedName == "") then {
        _loadedName = getText (_magazineCfg >> "displayName");
    };

    _loadedName = parseText format ["<t align='center' >%1</t>", _loadedName];

    private _text = composeText [_loadedName, lineBreak, _ammoBarsStructuredText];
    [_text] call EFUNC(common,displayTextStructured);
} else {
    if (_magazine != "") then {
        private _picture = getText (_magazineCfg >> "picture");
        [_ammoBarsStructuredText, _picture] call EFUNC(common,displayTextPicture);
    } else {
        [_ammoBarsStructuredText, 1] call EFUNC(common,displayTextStructured);
    };
};
