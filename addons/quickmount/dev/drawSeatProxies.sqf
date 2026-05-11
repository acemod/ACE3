#include "..\script_component.hpp"

// call compileScript ["z\ace\addons\quickmount\dev\drawSeatProxies.sqf"]

addMissionEventHandler ["Draw3D", {
    {
        private _vehicle = _x;
        if (
            isNull _vehicle
            || {!(_vehicle isKindOf "AllVehicles")}
            || {_vehicle isKindOf "Man"}
        ) then {continue};

        private _seatProxies = _vehicle getVariable QGVAR(seatProxies);
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
                    if (_proxyGroup == "") then {continue};

                    private _proxyHashMap = _seatProxies getOrDefault [_proxyGroup, createHashMap, true];
                    private _proxies = _proxyHashMap getOrDefault [_proxyIndex, [], true];
                    private _pos = _vehicle selectionPosition [_proxyPath, _lodNumber, "AveragePoint"];
                    if (-1 < _proxies findIf {0.1 > _vehicle selectionPosition (_x select 0) vectorDistance _pos}) then {continue}; // ignore near points
                    _proxies pushBack [[_proxyPath, _lodNumber, "AveragePoint"], format ["%1:%2.%3", _lodNumber, _proxyRole, _proxyIndex], _color];
                } forEach _proxyPaths;
            } forEach _allLODsNumbers;
            _vehicle setVariable [QGVAR(seatProxies), _seatProxies];
        };

        {
            {
                if (count _y < 2) then {continue}; // ignore single points
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
