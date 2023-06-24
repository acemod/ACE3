#include "script_component.hpp"
/*
 * Author: drofseh & Commy2
 * Unload the magazine from the unit's weapon and attempt to put it in a sensible place.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle (optional, default: Weapon)<STRING>
 * 3: Ammo count (optional, default: ammo currentMuzzle Player) <NUMBER>
 * 4: Skip animation? (optional, default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
* [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player, 23, false] call ace_common_fnc_unloadUnitWeapon
 *
 * Public: No
 */

params ["_unit", "_weapon", ["_muzzle", _weapon], ["_ammoCount", _unit ammo _muzzle ], ["_skipAnim", false]];
TRACE_5("params",_unit,_weapon,_muzzle,_ammoCount,_skipAnim);

// audiovisual effects
private _delay = 0;
if !(_skipAnim) then {
    _delay = 1.5;
    private _config = configFile >> "CfgWeapons" >> _weapon;
    if (_weapon != _muzzle) then {
        _config = _config >> _muzzle;
    };

    // get and play animation
    private _unloadAction = getText (_config >> "ACE_unloadAction");

    if (_unloadAction == "") then {
        _unloadAction = getText (_config >> "reloadAction");
    };

    [_unit, _unloadAction, 1] call FUNC(doGesture);

    // get and play sound
    private _unloadSound = getText (_config >> "ACE_unloadSound");

    if (_unloadSound == "") then {
        _unloadSound = "A3\Sounds_F\arsenal\weapons\Rifles\Katiba\reload_Katiba.wss";
        private _unloadSoundArray = getArray (_config >> "reloadMagazineSound");

        // file extention is required for playSound3D
        if (_unloadSoundArray isNotEqualTo []) then {
            private _wssTest = format ["%1.wss", _unloadSoundArray select 0];
            if (fileExists _wssTest) then {
                _unloadSound = _wssTest;
            } else {
                private _wavTest = format ["%1.wav", _unloadSoundArray select 0];
                if (fileExists _wavTest) then {
                    _unloadSound = _wavTest;
                };
            };
        };
    };

    playSound3D [_unloadSound, _unit];
};

// remove magazine from weapon and add it to inventory
[{
    params ["_unit", "_weapon", "_ammoCount"];

    // remove weapon item
    private _magazineClass = currentMagazine _unit;

    switch true do {
        case (_weapon == primaryWeapon _unit): {
            _unit removePrimaryWeaponItem _magazineClass;
        };
        case (_weapon == handgunWeapon _unit): {
            _unit removeHandgunItem _magazineClass;
        };
        case (_weapon == secondaryWeapon _unit): {
            _unit removeSecondaryWeaponItem _magazineClass;
        };
    };

    [_unit, _magazineClass, _ammoCount, true] call CBA_fnc_addMagazine;
}, [_unit, _weapon, _ammoCount], _delay] call CBA_fnc_waitAndExecute;
