#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Returns vehicle seat proxies grouped by role and index.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Seat proxies <HASHMAP>
 *
 * Example:
 * cursorObject call ace_quickmount_fnc_getSeatProxies
 *
 * Public: No
 */

params ["_vehicle"];

private _seatProxies = createHashMap;
private _allProxyPaths = [];
private _proxyRolePrefixes = ["driver", "gunner", "commander", "cargo", "pilot"];
private _proxyRoleMappings = ["driver", "gunner", "commander", "cargo", "driver", ""];
private _allLODsNumbers = allLODs _vehicle apply {_x select 2};

{
    private _lodNumber = _x;
    private _proxyPathsUnique = _vehicle selectionNames _lodNumber select {
        _x select [0,6] == "proxy:"
        && {_allProxyPaths pushBackUnique _x > -1}
    };
    {
        private _proxyPath = _x; // ex. "proxy:\ca\temp\proxies\suv\cargo02.005"
        private _substrings = _proxyPath splitString ":\.";
        if (count _substrings < 3) then {continue};
        private _proxyIndex = parseNumber (_substrings select -1); // "005" -> 5
        if (_proxyIndex < 1) then {continue};
        private _proxyRole = toLower (_substrings select -2); // "cargo02"
        // match role by prefix
        private _proxyGroup = _proxyRoleMappings select (_proxyRolePrefixes findIf {_proxyRole find _x == 0}); // "cargo"
        if (_proxyGroup == "") then {continue};
        TRACE_5("proxy",_lodNumber,_proxyPath,_proxyIndex,_proxyRole,_proxyGroup);

        private _proxyHashMap = _seatProxies getOrDefault [_proxyGroup, createHashMap, true];
        _proxyHashMap set [_proxyIndex, [_proxyPath, _lodNumber], true];
    } forEach _proxyPathsUnique;
} forEach _allLODsNumbers;

_seatProxies
