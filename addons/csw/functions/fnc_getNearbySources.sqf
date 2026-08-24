#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Gets available ammo sources for loading a CSW. Units are replaced by their containers, since
 * magazineCargo does not read a unit's inventory.
 *
 * Arguments:
 * 0: Unit or vehicle attempting to load <OBJECT>
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

[
    [_unit],
    {
        params ["_unit"];

        // group is grpNull on a vehicle, so a CSW passed straight in has to be asked directly
        private _side = if (_unit isKindOf "CAManBase") then {side group _unit} else {side _unit};

        // group is also grpNull on crates and weapon holders, which is what lets them through
        private _nearSupplies = (_unit nearSupplies DISTANCE_SEARCH_RADIUS) select {
            isNull (group _x) ||
            {!([_x] call EFUNC(common,isPlayer)) && {[_side, side group _x] call BIS_fnc_sideIsFriendly}}
        };

        _nearSupplies pushBackUnique _unit;

        // Built into a second array rather than appended in place, forEach over an array that is
        // growing underneath it has no defined behaviour
        private _sources = [];
        {
            // magazineCargo does not read a unit's inventory, only their containers do
            if (_x isKindOf "CAManBase") then {
                {
                    _sources pushBackUnique _x;
                } forEach [uniformContainer _x, vestContainer _x, backpackContainer _x];
                continue;
            };

            _sources pushBackUnique _x;

            {
                _x params ["", "_container"];
                _sources pushBackUnique _container;
            } forEach (everyContainer _x);
        } forEach _nearSupplies;

        // A unit with no vest or backpack gives objNull back
        _sources select {!isNull _x} // return
    },
    _unit,
    QGVAR(nearbySourcesCache),
    NEARBY_SOURCES_CACHE_EXPIRY,
    QGVAR(clearNearbySourcesCache)
] call EFUNC(common,cachedCall)
