#include "..\script_component.hpp"
/*
 * Author: drofseh, commy2, johnb43
 * Unload the magazine from the unit's weapon and attempt to put it in a sensible place.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING> (default: Weapon)
 * 3: Magazine <STRING> (default: Magazine in Weapon)
 * 4: Ammo count <NUMBER> (default: Unit ammo Muzzle)
 * 5: Skip animation? <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player, currentMagazine ACE_player, 23, false] call ace_common_fnc_unloadUnitWeapon
 *
 * Public: No
 */

params ["_unit", "_weapon", "_muzzle", "_magazine", "_ammoCount", ["_skipAnim", false]];
TRACE_6("params",_unit,_weapon,_muzzle,_magazine,_ammoCount,_skipAnim);

if (_unit getVariable [QGVAR(isUnloadingWeapon), false]) exitWith {};

// Only allow 1 weapon to be unloaded at a time (because of animation length)
_unit setVariable [QGVAR(isUnloadingWeapon), true];

if (isNil "_muzzle") then {
    _muzzle = _weapon;
};

if (isNil "_magazine") then {
    private _weaponState = _unit weaponState _muzzle;

    _magazine = _weaponState select 3;
    _ammoCount = _weaponState select 4;
};

if (isNil "_ammoCount") then {
    _ammoCount = _unit ammo _muzzle;
};

// Audiovisual effects
private _delay = 0;

if (!_skipAnim) then {
    _delay = 1.5;

    private _config = configFile >> "CfgWeapons" >> _weapon;

    if (_weapon != _muzzle) then {
        _config = _config >> _muzzle;
    };

    // Get and play animation
    private _unloadAction = getText (_config >> "ACE_unloadAction");

    if (_unloadAction == "") then {
        _unloadAction = getText (_config >> "reloadAction");
    };

    [_unit, _unloadAction, 1] call FUNC(doGesture);

    // Get and play sound
    private _unloadSound = getText (_config >> "ACE_unloadSound");

    if (_unloadSound == "") then {
        _unloadSound = "A3\Sounds_F\arsenal\weapons\Rifles\Katiba\reload_Katiba.wss";

        private _unloadSoundArray = getArray (_config >> "reloadMagazineSound");

        // File extention is required for playSound3D
        if (_unloadSoundArray isNotEqualTo []) then {
            private _wssTest = format ["%1.wss", _unloadSoundArray select 0];

            if (fileExists _wssTest) then {
                _unloadSound = _wssTest;
            } else {
                private _wavTest = format ["%1.wav", _unloadSoundArray select 0];

                if (fileExists _wavTest) then {
                    _unloadSound = _wavTest;
                } else {
                    private _oggTest = format ["%1.ogg", _unloadSoundArray select 0];

                    if (fileExists _oggTest) then {
                        _unloadSound = _oggTest;
                    };
                };
            };
        };
    };

    playSound3D [_unloadSound, _unit];
};

// Remove magazine from weapon and add it to inventory
[{
    params ["_unit", "_weapon", "_muzzle", "_magazine", "_ammoCount"];

    _unit setVariable [QGVAR(isUnloadingWeapon), nil];

    private _returnMagazine = true;

    // Check if it's possible to remove given item from weapon; If possible, remove weapon item
    switch (true) do {
        case (_weapon == primaryWeapon _unit && {_weapon canAdd [_magazine, _muzzle]}): {
            _unit removePrimaryWeaponItem _magazine;
        };
        case (_weapon == handgunWeapon _unit && {_weapon canAdd [_magazine, _muzzle]}): {
            _unit removeHandgunItem _magazine;
        };
        case (_weapon == secondaryWeapon _unit && {_weapon canAdd [_magazine, _muzzle]}): {
            _unit removeSecondaryWeaponItem _magazine;
        };
        default {
            _returnMagazine = false;
        };
    };

    // Avoid duplicating magazines (e.g. by switching weapons mid unload)
    if (!_returnMagazine) exitWith {};

    [_unit, _magazine, _ammoCount, true] call CBA_fnc_addMagazine;
}, [_unit, _weapon, _muzzle, _magazine, _ammoCount], _delay] call CBA_fnc_waitAndExecute;
