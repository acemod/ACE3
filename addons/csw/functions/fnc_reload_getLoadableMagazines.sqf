#include "..\script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Gets nearby magazines that can be loaded into the CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 * 2: AI reloading, skip turret checks <BOOL> (default: false)
 *
 * Return Value:
 * Mags <ARRAY>
 * [Carry Magazine <STRING>, Turret Path <ARRAY>, Load Info <NUMBER>, Magazine Source <OBJECT>]
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_reload_getLoadableMagazines
 *
 * Public: No
 */

params ["_vehicle", "_unit", ["_aiReload", false]];

private _availableMagazines = createHashMap; // slower than array, still needed for setting source of magazine

// filter enemy & player units while allowing pulling from friendly AI, crates, etc
private _sources = [_unit] call FUNC(getNearbySources);

{
    // minor optimization: since mags are sorted by ammo count in FUNC(getSourceCompatibleMagazines), we only need to check the first mag of this type in this source
    private _handledSourceMags = [];
    private _xSource = _x;
    {
        _x params ["_classname", "_ammo"];
        if (_classname in _handledSourceMags) then {continue};
        _handledSourceMags pushBack _classname;

        // select mag source with the highest ammo
        if (_ammo > (_availableMagazines getOrDefault [_classname, [objNull, 0]]) select 1) then {
            _availableMagazines set [_classname, [_xSource, _ammo]];
        };
    } forEach ([_x, _vehicle] call FUNC(getSourceCompatibleMagazines));
} forEach _sources;

if (_availableMagazines isEqualTo createHashMap) exitWith {[]}; // fast exit if no available mags

private _loadInfo = [];
private _return = [];
private _turretPath = [_unit] call EFUNC(common,getTurretIndex);

// Go through turrets and find weapons that we could reload
// We can skip checking all turrets if we're doing AI reloading
{
    private _turretPath = _x;
    {
        //IGNORE_PRIVATE_WARNING ["_x", "_y"];
        private _carryMag = _x;
        _y params ["_magSource", "_ammo"];
        _loadInfo = [_vehicle, _turretPath, _carryMag] call FUNC(reload_canLoadMagazine);
        if (_loadInfo select 0) then {
            _return pushBack [_carryMag, _turretPath, _loadInfo, _magSource, _unit, _ammo];
        };
    } forEach _availableMagazines;
} forEach ([(allTurrets _vehicle), [_turretPath]] select _aiReload);

_return
