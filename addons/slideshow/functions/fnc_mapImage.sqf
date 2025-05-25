#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Returns a procedural texture that will display a custom map.
 * Needs to be run on all machines.
 *
 * Arguments:
 * 0: Position <ARRAY> (default: center of map)
 * 1: Scale (1.0 fits entire map in x-dimension) <NUMBER> (default: 1.25)
 * 2: Markers <ARRAY> (default: [])
 * - 0: Position 2D/3D <ARRAY> (default: [0, 0, 0])
 * - 1: Text <STRING> (default: "")
 * - 2: Marker Type or Icon Name <STRING> (default: "mil_dot")
 * - 3: Color <ARRAY> (default: [1, 0, 0, 1])
 * 3: Map Type (0: Normal, 1: Topographic, 2: Satellite) or any custom class (even mission config) <NUMBER or STRING> (default: 0)
 * 4: Code to run on init (will be passed [_map, _display, _displayID]) <CODE> (default: {})
 * 5: Resolution <NUMBER> (default: 4096)
 *
 * Return Value:
 * Procedural Texture <STRING>
 *
 * Example:
 * [] call ace_slideshow_fnc_mapImage
 * [getPos player, 0.3, [], 1] call ace_slideshow_fnc_mapImage
 * [[5000, 5000], 0.5, [[getpos player, "obj"]], 2, {}] call ace_slideshow_fnc_mapImage
 *
 * Public: Yes
 */

params [
    ["_pos", [worldSize / 2, worldSize / 2], [[]]],
    ["_scale", 1.25, [0]],
    ["_markers", [], [[]]],
    ["_mapType", 0, [0, ""]], // 2.14 may allow config type as well
    ["_userCode", {}, [{}]],
    ["_resolution", 4096, [0]]
];
TRACE_6("",_pos,_scale,count _markers,_mapType,_userCode isEqualTo {},_resolution);

_markers = _markers apply { // convert marker array to draw command
    _x params [["_xPos", [0,0,0], [[]]], ["_xText", "", [""]], ["_xIcon", "mil_dot", [""]], ["_xColor", [1,0,0,1], [[]]]];
    private _size = 0;
    private _config = configFile >> "CfgMarkers" >> _xIcon;
    if (isClass _config) then {
        _size = 0.5 * getNumber (_config >> "size");
        _xIcon = getText (_config >> "icon"); // don't swap order
    } else {
        if (_xIcon != "") then { _size = 16 }; // could be a file or a CfgVehicleIcons class
    };
    [_xIcon, _xColor, _xPos, _size, _size, 0, _xText, 0, 0.08]
};

if (_mapType isEqualType 0) then {
    _mapType = [QGVAR(mapNormal), QGVAR(mapTopo), QGVAR(mapSat)] select _mapType;
};
if ((!isClass (configFile >> _mapType)) && {(!isClass (missionConfigFile >> _mapType))}) then {
    ERROR_1("bad map type %1",_mapType);
};

// set data in hash
if (isNil QGVAR(mapData)) then { GVAR(mapData) = createHashMap; };
private _displayID = format ["ace_s_%1", count GVAR(mapData)];
TRACE_1("setting hash",_displayID);
GVAR(mapData) set [_displayID, [_pos, _scale, _markers, _mapType, _userCode]];

// return texture name
format ['#(rgb,%1,%1,1)ui("%2","%3")', _resolution, QGVAR(mapDisplay), _displayID]
