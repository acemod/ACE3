#include "..\script_component.hpp"

// call compileScript ["z\ace\addons\quickmount\dev\drawSeatProxies.sqf"]
// [_showSingleProxies, _minProxyDistance, _showAnyProxy] call compileScript ["z\ace\addons\quickmount\dev\drawSeatProxies.sqf"]

params [["_showSingleProxies", false], ["_minProxyDistance", 0.1], ["_showAnyProxy", false]];

GVAR(showSingleProxies) = _showSingleProxies; // show seats that have only one proxy point
GVAR(minProxyDistance) = _minProxyDistance; // minimum distance between nearby proxies to show both
GVAR(showAnyProxy) = _showAnyProxy; // show any proxy not only seat

if (!isNil QGVAR(draw3DEH)) then {
    removeMissionEventHandler ["Draw3D", GVAR(draw3DEH)];
};

GVAR(draw3DEH) = addMissionEventHandler ["Draw3D", {
    {
        private _vehicle = _x;
        if (!(_vehicle isKindOf "AllVehicles") || {_vehicle isKindOf "Man"}) then {continue};

        // make unique var name to recalc proxies
        private _seatProxies = _vehicle getVariable format ["%1%2", QGVAR(seatProxies), GVAR(draw3DEH)];
        if (isNil "_seatProxies") then {
            // see fnc_getSeatProxies
            _seatProxies = createHashMap;
            private _proxyRolePrefixes = ["driver", "gunner", "commander", "cargo", "pilot"];
            private _proxyRoleMappings = ["driver", "gunner", "commander", "cargo", "driver", ""];
            private _allLODsNumbers = allLODs _vehicle apply {_x select 2};
            {
                private _lodNumber = _x;
                private _proxyPaths = _vehicle selectionNames _lodNumber select {
                    _x select [0,6] == "proxy:"
                };
                private _color = [random 1, random 1, random 1, 1];
                {
                    private _proxyPath = _x;
                    private _substrings = _proxyPath splitString ":\.";
                    if (count _substrings < 3) then {continue};
                    private _proxyIndex = parseNumber (_substrings select -1);
                    if (_proxyIndex < 1) then {continue};
                    private _proxyRole = toLower (_substrings select -2);
                    private _proxyGroup = _proxyRoleMappings select (_proxyRolePrefixes findIf {_proxyRole find _x == 0});
                    if (_proxyGroup == "" && {!GVAR(showAnyProxy)}) then {continue};

                    private _proxyHashMap = _seatProxies getOrDefault [_proxyGroup, createHashMap, true];
                    private _proxies = _proxyHashMap getOrDefault [_proxyIndex, [], true];
                    private _pos = _vehicle selectionPosition [_proxyPath, _lodNumber, "AveragePoint"];
                    // skip nearby proxies
                    if (-1 < _proxies findIf {GVAR(minProxyDistance) > _vehicle selectionPosition (_x select 0) vectorDistance _pos}) then {continue};
                    _proxies pushBack [[_proxyPath, _lodNumber, "AveragePoint"], format ["%1:%2.%3", _lodNumber, _proxyRole, _proxyIndex], _color];
                } forEach _proxyPaths;
            } forEach _allLODsNumbers;
            _vehicle setVariable [format ["%1%2", QGVAR(seatProxies), GVAR(draw3DEH)], _seatProxies];
        };

        {
            {
                if (!GVAR(showSingleProxies) && {count _y < 2}) then {continue}; // skip seats with only one proxy
                {
                    drawIcon3D [
                        "\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa",
                        _x select 2,
                        _vehicle modelToWorldVisual (_vehicle selectionPosition (_x select 0)),
                        0.5, 0.5, 0,
                        _x select 1
                    ];
                } forEach _y;
            } forEach _y;
        } forEach _seatProxies;
    } forEach [cursorObject, objectParent ACE_player];
}];

GVAR(draw3DEH)
