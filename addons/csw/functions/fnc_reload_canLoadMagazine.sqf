#include "script_component.hpp"
/*
 * Author: PabstMirror & TCVM
 * Tests if unit can load a magazine into a static weapon.
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Carryable Magazine <STRING>
 * 3: Player <OBJECT>
 *
 * Return Value:
 * [CanLoad<BOOL>, LoadedMag<STRING>, AmmoNeeded<NUMBER>, IsBeltLinking<BOOL>]<ARRAY>
 *
 * Example:
 * [cursorObject, [0], "ACE_csw_100Rnd_127x99_mag_red", player] call ace_csw_fnc_reload_canLoadMagazine
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_carryMag", ["_unit", objNull]];
// TRACE_4("reload_canLoadMagazine",_vehicle,_turret,_carryMag,_unit);

// Handle disassembled or deleted
if (!alive _vehicle) exitWith { [false, "", -1, false] };
// Verify unit has carry magazine
if ((!isNull _unit) && {((_vehicle distance _unit) > 5) || {((magazines _unit) findIf {_x == _carryMag}) == -1}}) exitWith { [false, "", -2, false] };

private _desiredAmmo = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> QUOTE(ADDON) >> "desiredAmmo");
if (_desiredAmmo == 0) then { _desiredAmmo = 100; };
private _ammoNeeded = _desiredAmmo min getNumber (configFile >> "CfgMagazines" >> _carryMag >> "count"); // assume it needs full carry mag
private _loadedMag = "";
private _isBeltLinking = false;

scopeName "main";
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if (_xTurret isEqualTo _turret) then {
        if (_loadedMag != "") exitWith { [false, _loadedMag, -3, false] breakOut "main"; }; // Exit if static has multiple mags
        _loadedMag = _xMag;
        if (_xAmmo > 0) then {
            // There is a magazine with ammo loaded in the turret (are there any multi-muzzle static weapons??), see if we can add to this mag
            if (getNumber (configFile >> QGVAR(groups) >> _carryMag >> _xMag) != 1) exitWith {
                [false, _loadedMag, -4, false] breakOut "main"; // Carry mag cannot be added to existing vehicle mag (e.g. red to green tracers)
            };
            if (getNumber (configFile >> "CfgMagazines" >> _carryMag >> "ACE_isBelt") == 0) exitWith {
                [false, _loadedMag, -5, false] breakOut "main"; // Non-linkable mag loaded, can't add any more
            };
            private _maxMagazineAmmo = _desiredAmmo min getNumber (configFile >> "CfgMagazines" >> _xMag >> "count");
            if (_xAmmo >= _maxMagazineAmmo) exitWith {
                [false, _loadedMag, -6, false] breakOut "main"; // Already at capicity
            };
            _ammoNeeded = _maxMagazineAmmo - _xAmmo;
            _isBeltLinking = true;
        };
    };
} forEach (magazinesAllTurrets _vehicle);

[true, _loadedMag, _ammoNeeded, _isBeltLinking]
