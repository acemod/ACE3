#include "script_component.hpp"
/*
 * Author: PabstMirror, LinkIsGrim
 * Gets nearby magazines that can be loaded in the static weapon
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
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

params ["_vehicle", "_player"];

private _magGroupsConfig = configFile >> QGVAR(groups); // so we don't solve in loop every time
private _availableMagazines = createHashMap; // slower than array, still needed for setting source of magazine

// filter enemy & player units while allowing pulling from friendly AI, crates, etc
private _nearSupplies = (_vehicle nearSupplies 5) select {
    isNull (group _x) ||
    {!([_x] call EFUNC(common,isPlayer)) && {[side group _player, side group _x] call BIS_fnc_sideIsFriendly}}
};

// add caller to nearSupplies since players will get filtered out
_nearSupplies pushBack _player;

// send the mag source with the highest ammo
private _bestMagAmmo = createHashMap;

{
    if (_x isKindOf "CAManBase") then {
        // unit inventory needs to be added manually
        _nearSupplies append [uniformContainer _x, vestContainer _x, backpackContainer _x];
        continue;
    };
    private _xSource = _x;
    private _cswMags = (magazinesAmmoCargo _xSource) select {isClass (_magGroupsConfig >> _x select 0)};

    // add containers inside containers
    {
        _x params ["_classname", "_container"];
        _nearSupplies pushBack _container;
    } forEach (everyContainer _x);

    {
        _x params ["_classname", "_ammo"];
        if (_ammo > (_bestMagAmmo getOrDefault [_classname, 0])) then {
            _bestMagAmmo set [_classname, _ammo];
            _availableMagazines set [_classname, _xSource];
        };
    } forEach _cswMags;
} forEach _nearSupplies;

if (_availableMagazines isEqualTo createHashMap) exitWith { [] }; // fast exit if no available mags

private _loadInfo = [];
private _return = [];
// Go through turrets and find weapons that we could reload
{
    private _turretPath = _x;
    {
        private _weapon = _x;
        {
            //IGNORE_PRIVATE_WARNING ["_x", "_y"];
            private _carryMag = _x;
            private _magSource = _y;
            private _carryGroup = _magGroupsConfig >> _carryMag;
            {
                if (
                    ((getNumber (_carryGroup >> _x)) == 1) &&
                    {_loadInfo = [_vehicle, _turretPath, _carryMag, _magSource] call FUNC(reload_canLoadMagazine); _loadInfo select 0}
                ) exitWith {
                    _return pushBack [_carryMag, _turretPath, _loadInfo, _magSource, _player];
                };
            } forEach (compatibleMagazines _weapon);
        } forEach _availableMagazines;
    } forEach (_vehicle weaponsTurret _turretPath);
} forEach (allTurrets _vehicle);
// Note: these nested forEach's looks terrible, but most only have one element

_return
