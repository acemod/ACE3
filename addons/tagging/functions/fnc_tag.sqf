#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, esteldunedain
 * Creates a tag on a wall that is on the closest surface within 2m on front of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The colour of the tag (valid colours are black, red, green and blue or full path to custom texture) <STRING>
 * 2: Material of the tag <STRING> (Optional)
 * 3: Tag Model <STRING> (optional)
 *
 * Return Value:
 * Sucess <BOOL>
 *
 * Example:
 * success = [player, "z\ace\addons\tagging\UI\tags\black\0.paa"] call ace_tagging_fnc_tag
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_texture", "", [""]],
    ["_material", "", [""]],
    ["_tagModel", "UserTexture1m_F", [""]]
];

if (isNull _unit || {_texture == ""}) exitWith {
    ERROR_2("Tag parameters invalid. Unit: %1, Texture: %2",_unit,_texture);
};

private _startPosASL = eyePos _unit;
private _cameraPosASL =  AGLToASL positionCameraToWorld [0, 0, 0];
private _cameraDir = (AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff _cameraPosASL;
private _endPosASL = _startPosASL vectorAdd (_cameraDir vectorMultiply 2.5);

// Check for intersections below the unit
private _intersections = lineIntersectsSurfaces [_startPosASL, _endPosASL, _unit, objNull, true, 1, "GEOM", "FIRE"];

// If there's no intersections
if (_intersections isEqualTo []) exitWith {
    TRACE_1("No intersections",_intersections);
    false
};

(_intersections select 0) params ["_touchingPoint", "_surfaceNormal", "", "_object"];
TRACE_3("",_touchingPoint, _surfaceNormal, _object);

// Exit if trying to tag a non static object
if ((!isNull _object) && {
    // If the class is alright, do not exit
    if (_object isKindOf "Static") exitWith {false};

    // If the class is not categorized correctly search the cache
    private _modelName = (getModelInfo _object) select 0;
    private _isStatic = GVAR(cacheStaticModels) getVariable [_modelName, false];
    TRACE_2("Object:",_modelName,_isStatic);
    // If the class in not on the cache, exit
    (!_isStatic)
}) exitWith {
    TRACE_1("Pointed object is non static",_object);
    false
};


// If the surface normal points away, flip it. This happens in weird places like the Stratis Pier
if (_surfaceNormal vectorDotProduct  (_endPosASL vectorDiff _startPosASL) > 0) then {
    _surfaceNormal = _surfaceNormal vectorMultiply -1;
};

// Check if its a valid surface: big enough, reasonably plane
private _v1 = vectorNormalized (_surfaceNormal vectorMultiply -1);
private _v2 = vectorNormalized (_v1 vectorCrossProduct (_endPosASL vectorDiff _startPosASL));
// If the surface is not horizontal (>20º), create vup _v2 pointing upward instead of away
if (abs (_v1 select 2) < 0.94) then {
    private _v3Temp = _v1 vectorCrossProduct [0, 0, 1];
    _v2 = _v3Temp vectorCrossProduct _v1;
};
private _v3 = _v2 vectorCrossProduct _v1;

TRACE_3("Reference:", _v1, _v2, _v3);

private _fnc_isOk = {
    params ["_rx", "_ry"];
    private _startPosASL2 = _touchingPoint vectorAdd (_v2 vectorMultiply _rx) vectorAdd (_v3 vectorMultiply _ry) vectorAdd (_v1 vectorMultiply (-0.06));
    private _endPosASL2   = _startPosASL2 vectorAdd (_v1 vectorMultiply (0.12));
    private _intersections = lineIntersectsSurfaces [_startPosASL2, _endPosASL2, _unit, objNull, true, 1, "GEOM", "FIRE"];
    // If there's no intersections
    if (_intersections isEqualTo []) exitWith {false;};

    if !(((_intersections select 0) select 3) isEqualTo _object) exitWith {false;};

    true
};

if ( !([ 0.5 * TAG_SIZE, 0.5 * TAG_SIZE] call _fnc_isOk) ||
    {!([ 0.5 * TAG_SIZE,-0.5 * TAG_SIZE] call _fnc_isOk) ||
    {!([-0.5 * TAG_SIZE, 0.5 * TAG_SIZE] call _fnc_isOk) ||
    {!([-0.5 * TAG_SIZE,-0.5 * TAG_SIZE] call _fnc_isOk)}}}) exitWith {
    TRACE_1("Unsuitable location:",_touchingPoint);
    false
};

private _vectorDirAndUp = [_surfaceNormal vectorMultiply -1, _v3];

// Everything ok, make the unit create the tag
[_unit, "PutDown"] call EFUNC(common,doGesture);

[{
    params ["", "", "", "", "_unit"];
    TRACE_2("Unit:",_unit,_this);

    playSound3D [QUOTE(PATHTO_R(sounds\spray.ogg)), _unit, false, (eyePos _unit), 5, 1, 15];

    // Tell the server to create the tag and handle its destruction
    [QGVAR(createTag), _this] call CBA_fnc_serverEvent;
}, [_touchingPoint vectorAdd (_surfaceNormal vectorMultiply 0.06), _vectorDirAndUp, _texture, _object, _unit, _material, _tagModel], 0.6] call CBA_fnc_waitAndExecute;

true
