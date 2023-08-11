#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets available ammo sources for loading a CSW
 *
 * Arguments:
 * 0: Unit or vehicle attempting to load <OBJECT>
 * 1: Skip vehicle sources <BOOL> (default: false)
 * 2: Include CSW crew <BOOL> (default: false)
 *
 * Return Value:
 * Ammo sources <ARRAY of OBJECT>
 *
 * Example:
 * [player] call ace_csw_fnc_getNearbySources
 *
 * Public: No
 */
[_this, {
    params ["_unit", ["_skipVehicles", false], ["_includeCrew", false]];
    private _nearSupplies = (_unit nearSupplies 5) select {
        isNull (group _x) ||
        {!([_x] call EFUNC(common,isPlayer)) && {[side group _unit, side group _x] call BIS_fnc_sideIsFriendly}}
    };

    if (_includeCrew) then {
        _nearSupplies append (crew _unit);
    };

    if (_skipVehicles) then {
        _nearSupplies = _nearSupplies select {
            private _source = _x;
            (["Ship", "Car", "Air", "Tank"] findIf {_source isKindOf _x}) == -1
        };
    };

    _nearSupplies pushBackUnique _unit;
    {
        if (_x isKindOf "CAManBase") then {
            _nearSupplies append [uniformContainer _x, vestContainer _x, backpackContainer _x];
            continue;
        };

        {
            _x params ["", "_container"];
            _nearSupplies pushBack _container;
        } forEach (everyContainer _x);
    } forEach _nearSupplies;

    _nearSupplies select {!(_x isKindOf "CAManBase")}  // return
}, _this select 0, QGVAR(nearbySourcesCache), NEARBY_SOURCES_CACHE_EXPIRY, QGVAR(clearNearbySourcesCache)] call EFUNC(common,cachedCall);
