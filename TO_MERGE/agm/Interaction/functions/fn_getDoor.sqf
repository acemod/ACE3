// by commy2

private ["_distance", "_position0", "_position1", "_intersections", "_count", "_house", "_door", "_index", "_id"];

_distance = _this select 0;

_position0 = positionCameraToWorld [0, 0, 0];
_position1 = positionCameraToWorld [0, 0, _distance];

_intersections = lineIntersectsWith [ATLToASL _position0, ATLToASL _position1, objNull, objNull, true];

_count = count _intersections;
if (_count == 0) exitWith {[objNull, ""]};

_house = _intersections select (_count - 1);

// shithouse is bugged
if (typeOf _house == "") exitWith {[objNull, ""]};

_intersections = [_house, "GEOM"] intersect [_position0, _position1];

_door = _intersections select 0 select 0;
if (isNil "_door") exitWith {[_house, ""]};
[_house, _door]

/*
_house = cursorTarget;
_actions = "true" configClasses (configFile >> "CfgVehicles" >> typeOf _house >> "UserActions");
_actions = [_actions, {getText (_x >> "statement")}] call AGM_Core_fnc_map;
_actions
*/
