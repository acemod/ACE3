#include "..\script_component.hpp"
/*
 * Author: Kerc (SPE), original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
 * Alters the static weapon's height.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: New static weapon (i.e. the weapon to replace the current weapon) <STRING>
 * 2: Use ACE's progress bar <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, getText (configOf cursorObject >> "SPE_AltHeight_Tripod_Name")] call SPE_Weapons_Static_fnc_alter_height
 *
 * Public: No
 */

private _unit = call SPE_fnc_findPlayer;

if !(alive _unit) exitWith {};

params ["_weaponPlatform", "_newStaticWeapon", ["_playProgressBar", false, [false]]];

if (_playProgressBar) exitWith {
    [10 * EGVAR(csw,progressBarTimeCoefficent), [_weaponPlatform, _newStaticWeapon], {
        (_this select 0) params ["_weaponPlatform", "_newStaticWeapon"];

        [_weaponPlatform, _newStaticWeapon] call SPE_Weapons_Static_fnc_alter_height;
    }, {}, LSUBLSTRING(alteringHeight), {
        //IGNORE_PRIVATE_WARNING ["_player"];
        (_this select 0) params ["_weaponPlatform"];

        _player distance _weaponPlatform <= 4 && {[_weaponPlatform, true] call SPE_Weapons_Static_fnc_can_alter_height}
    }] call EFUNC(common,progressBar);
};

private _dir = vectorDir _weaponPlatform;
private _pos = (getPosATL _weaponPlatform) vectorAdd [0, 0, 0.1]; // 10 cm above terrain surface

// Save state
private _magazines = magazinesAmmoFull _weaponPlatform;
private _assemblyModeIndex = _weaponPlatform getVariable QEGVAR(csw,assemblyMode);

// Delete weapon and create new one
deleteVehicle _weaponPlatform;

[{
    params ["_unit", "_newStaticWeapon", "_magazines", "_pos", "_dir", "_assemblyModeIndex"];

    private _weaponPlatform = createVehicle [_newStaticWeapon, _pos, [], 0, "CAN_COLLIDE"];

    if (!isNil "_assemblyModeIndex") then {
        // Don't empty the weapon of its existing mags
        _weaponPlatform setVariable [QEGVAR(csw,assemblyMode), 0, true];

        if (_assemblyModeIndex == 0) exitWith {};

        // Reset variable to original after initVehicle has run
        [{
            (_this select 0) setVariable [QEGVAR(csw,assemblyMode), _this select 1, true];
        }, [_weaponPlatform, _assemblyModeIndex], 1.5] call CBA_fnc_waitAndExecute;
    };

    _weaponPlatform disableCollisionWith _unit;
    _weaponPlatform setVectorDir _dir;

    [{
        _this remoteExecCall ["enableCollisionWith", _this];
    }, [_weaponPlatform, _unit], 0.5] call CBA_fnc_waitAndExecute;

    if (_magazines isEqualTo []) exitWith {};

    // Restore state
    // First remove magazines that were spawned in with new weapon
    _weaponPlatform removeAllMagazinesTurret [0];

    // Remove weapon temporarily and readd it to instantly load previous magazine
    private _weapon = (_weaponPlatform weaponsTurret [0]) param [0, ""];

    if (_weapon != "") then {
        _weaponPlatform removeWeaponTurret [_weapon, [0]];
    };

    // Find loaded magazine
    private _loadedIndex = _magazines findIf {_x select 2};

    // If there was a loaded magazine, add that one first
    if (_loadedIndex != -1) then {
        (_magazines deleteAt _loadedIndex) params ["_magClass", "_ammoCount"];
        _weaponPlatform addMagazineTurret [_magClass, [0], _ammoCount];
    };

    _weaponPlatform addWeaponTurret [_weapon, [0]];

    {
        _x params ["_magClass", "_ammoCount", "_loaded"];

        // In some instances the loaded magazine is listed twice, so we skip it.
        if (!_loaded) then {
            _weaponPlatform addMagazineTurret [_magClass, [0], _ammoCount];
        };
    } forEach _magazines;
}, [_unit, _newStaticWeapon, _magazines, _pos, _dir, _assemblyModeIndex]] call CBA_fnc_execNextFrame;
