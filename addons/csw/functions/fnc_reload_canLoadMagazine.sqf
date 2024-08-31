#include "..\script_component.hpp"
/*
 * Author: PabstMirror, tcvm
 * Tests if unit can load a magazine into a CSW.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Carryable Magazine <STRING>
 * 3: Supplier <OBJECT> (default: objNull)
 *
 * Return Value:
 * [Can Load <BOOL>, Loaded Mag <STRING>, Ammo Needed <NUMBER>, Is Belt Linking <BOOL>] <ARRAY>
 *
 * Example:
 * [cursorObject, [0], "ACE_csw_100Rnd_127x99_mag_red", player] call ace_csw_fnc_reload_canLoadMagazine
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_carryMag", ["_magSource", objNull]];
// TRACE_4("reload_canLoadMagazine",_vehicle,_turret,_carryMag,_magSource);

private _return = [false, "", -2, false];

// Handle disassembled or deleted
if (!alive _vehicle) exitWith { _return };
// Verify holder has carry magazine
if (
    (!isNull _magSource) &&
    {!((_magSource isKindOf "Bag_Base") || {_magSource isKindOf "ContainerSupply"})} && // Hacky workaround for magazines within dropped backpacks
    {
        ((_vehicle distance _magSource) > 10) ||
        {((magazineCargo _magSource) findIf {_x == _carryMag}) == -1}
    }
) exitWith { _return };

// solve config lookups
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgMagazinesCarryMag = _cfgMagazines >> _carryMag;
private _cfgGroupsCarryMag = configFile >> QGVAR(groups) >> _carryMag;

private _desiredAmmo = getNumber (configOf _vehicle >> QUOTE(ADDON) >> "desiredAmmo");
if (_desiredAmmo == 0) then { _desiredAmmo = 100; };
private _ammoNeeded = _desiredAmmo min getNumber (_cfgMagazinesCarryMag >> "count"); // Assume it needs full carry mag
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
            if (getNumber (_cfgGroupsCarryMag >> _xMag) != 1) exitWith {
                [false, _loadedMag, -4, false] breakOut "main"; // Carry mag cannot be added to existing vehicle mag (e.g. red to green tracers)
            };
            if (getNumber (_cfgMagazinesCarryMag >> "ACE_isBelt") == 0) exitWith {
                [false, _loadedMag, -5, false] breakOut "main"; // Non-linkable mag loaded, can't add any more
            };
            private _maxMagazineAmmo = _desiredAmmo min getNumber (_cfgMagazines >> _xMag >> "count");
            if (_xAmmo >= _maxMagazineAmmo) exitWith {
                [false, _loadedMag, -6, false] breakOut "main"; // Already at capacity
            };
            _ammoNeeded = _maxMagazineAmmo - _xAmmo;
            _isBeltLinking = true;
        };
    };
} forEach (magazinesAllTurrets _vehicle);

[true, _loadedMag, _ammoNeeded, _isBeltLinking]
