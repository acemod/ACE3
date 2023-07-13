#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets available ammo sources for loading a CSW
 *
 * Arguments:
 * 0: Unit attempting to load <OBJECT>
 *
 * Return Value:
 * Ammo sources <ARRAY of OBJECT>
 *
 * Example:
 * [player] call ace_csw_fnc_getNearbySources
 *
 * Public: No
 */
params ["_unit"];

[_unit, {
    params ["_unit"];
    private _nearSupplies = (_unit nearSupplies 5) select {
        isNull (group _x) ||
        {!([_x] call EFUNC(common,isPlayer)) && {[side group _unit, side group _x] call BIS_fnc_sideIsFriendly}}
    };

    _nearSupplies pushBack _unit;
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
}, _unit, QGVAR(nearbySourcesCache), NEARBY_SOURCES_CACHE_EXPIRY, QGVAR(clearNearbySourcesCache)] call EFUNC(common,cachedCall);
