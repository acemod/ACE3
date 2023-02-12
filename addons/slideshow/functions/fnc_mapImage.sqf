#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Returns a procedural texture that will display a custom map
 * Needs to be run on all machines
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Scale (1.0 fits entire map in x-dimension) <SCALAR>
 * 2: Markers [_pos, _text, _icon, _color] <ARRAY>
 * 3: MapType (0: Normal, 1: Topographic, 2: Satelite) or any custom class (even mission config) <SCALAR><STRING>
 * 4: Code to run on init (passed [_map, _display, _displayID]) <CODE>
 * 5: Resolution <SCALAR>
 *
 * Return Value:
 * Texture <STRING>
 *
 * Example:
 * [] call ace_slideshow_fnc_mapImage
 * [getPos player, 0.3, [], 1] call ace_slideshow_fnc_mapImage
 * [[5000, 5000], 0.5, [[getpos player, "obj"]], 2, {},] call ace_slideshow_fnc_mapImage
 *
 * Public: Yes
 */

params [
    ["_pos", [worldSize/2,worldSize/2], [[]]],
    ["_scale", 1.25, [0]],
    ["_markers", [], [[]]],
    ["_mapType", 1, [0, ""]],
    ["_userCode", {}, [{}]],
    ["_resolution", 4096, [0]]
];
TRACE_5("",_pos,_scale,count _markers,_mapType,_userCode isEqualTo {},_resolution);

_markers = _markers apply { // convert marker array to draw command
    _x params [["_xPos", [0,0,0], [[]]], ["_xText", "", [""]], ["_xIcon", "mil_dot", [""]], ["_xColor", [1,0,0,1], [[]]]];
    private _size = 0;
    if (isClass (configFile >> "CfgMarkers" >> _xIcon)) then {
        _size = 0.5 * getNumber (configFile >> "CfgMarkers" >> _xIcon >> "size");
        _xIcon = getText (configFile >> "CfgMarkers" >> _xIcon >> "icon"); // don't swap order
    } else {
        if (_xIcon != "") then { _size = 16 }; // could be file or CfgVehicleIcons
    };
    [_xIcon, _xColor, _xPos, _size, _size, 0, _xText, 0, 0.08]
};

if (_mapType isEqualType 0) then {
    _mapType = [QGVAR(mapNormal), QGVAR(mapTopo), QGVAR(mapSat)] select _mapType;
};
if (!isClass (configFile >> _mapType)) then { WARNING_1("bad map %1",_mapType); };

// set data in hash
if (isNil QGVAR(mapData)) then { GVAR(mapData) = createHashMap; };
private _displayID = format ["ace_s_%1", count GVAR(mapData)];
TRACE_1("setting hash",_displayID);
GVAR(mapData) set [_displayID, [_pos, _scale, _markers, _mapType, _userCode]];

// return texture name
format ['#(rgb,%1,%1,1)ui("%2","%3")', _resolution, QGVAR(mapDisplay), _displayID]
