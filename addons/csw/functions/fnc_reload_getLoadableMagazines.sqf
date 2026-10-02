#include "..\script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Gets nearby magazines that can be loaded into the CSW.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Unit <OBJECT>
 * 2: AI reloading, only check the unit's own turret <BOOL> (default: false)
 *
 * Return Value:
 * Mags <ARRAY>
 *   [Carry Magazine <STRING>, Turret Path <ARRAY>, Load Info <ARRAY>, Magazine Source <OBJECT>, Magazine Ammo <NUMBER>]
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_reload_getLoadableMagazines
 *
 * Public: No
 */

params ["_vehicle", "_unit", ["_aiReload", false]];

// Hashmap rather than an array, the source each magazine came from has to be carried along
private _availableMagazines = createHashMap;

// Once for the CSW rather than once per source
private _compatibleMagazines = _vehicle call FUNC(compatibleMagazines);

{
    private _xSource = _x;
    private _handledSourceMags = [];

    {
        _x params ["_classname", "_ammo"];

        // Sources come back grouped by classname with the fullest first, so only the first counts
        if (_classname in _handledSourceMags) then {continue};
        _handledSourceMags pushBack _classname;

        // Across sources, take whichever holds the fullest magazine of this type
        if (_ammo > ((_availableMagazines getOrDefault [_classname, [objNull, 0]]) select 1)) then {
            _availableMagazines set [_classname, [_xSource, _ammo]];
        };
    } forEach ([_xSource, _vehicle, _compatibleMagazines] call FUNC(getSourceCompatibleMagazines));
} forEach (_unit call FUNC(getNearbySources));

if (_availableMagazines isEqualTo createHashMap) exitWith {[]}; // fast exit if no available mags

// AI only ever reloads the turret it is sitting in, no reason to walk the rest.
// unitTurret gives [] when nobody is in a turret and [-1] when the gunner is also the driver
private _allTurrets = allTurrets _vehicle;
private _turrets = _allTurrets;

if (_aiReload) then {
    private _turretPath = _vehicle unitTurret _unit;
    _turrets = [[0], _turretPath] select (_turretPath in _allTurrets);
    _turrets = [_turrets];
};

private _return = [];

{
    private _turretPath = _x;
    {
        //IGNORE_PRIVATE_WARNING ["_x", "_y"];
        private _carryMag = _x;
        _y params ["_magSource", "_ammo"];

        // No source passed, the source was picked above and is known to hold the magazine
        private _loadInfo = [_vehicle, _turretPath, _carryMag] call FUNC(reload_canLoadMagazine);
        if (_loadInfo select 0) then {
            _return pushBack [_carryMag, _turretPath, _loadInfo, _magSource, _ammo];
        };
    } forEach _availableMagazines;
} forEach _turrets;

_return
