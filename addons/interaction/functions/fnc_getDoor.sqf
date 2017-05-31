/*
 * Author: commy2, Phyma
 * Find door.
 *
 * Arguments:
 * 0: Distance <NUMBER>
 *
 * Return Value:
 * House objects and door <ARRAY>
 * 0: House <OBJECT>
 * 1: Door Name <STRING>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_getDoor
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_distance"];

private ["_position0", "_position1", "_intersections", "_house", "_door"];

_position0 = positionCameraToWorld [0, 0, 0];
_position1 = positionCameraToWorld [0, 0, _distance];

_intersections = lineIntersectsSurfaces [AGLToASL _position0, AGLToASL _position1, cameraOn, objNull, true, 1, "GEOM"];

if (_intersections isEqualTo []) exitWith {[objNull, ""]};

_house = _intersections select 0 select 2;

// shithouse is bugged
if (typeOf _house == "") exitWith {[objNull, ""]};

_intersections = [_house, "GEOM"] intersect [_position0, _position1];

_door = _intersections select 0 select 0;

private _doorParts = [];

//Check if door is glass because then we need to find the proper location of the door so we can use it
if (["glass", _door] call BIS_fnc_inString) then {

	private ["_animName", "_splitStr", "_newString", "_dist", "_animate"];
	private _config = _house call CBA_fnc_getObjectConfig;	
	
	private _animate = configProperties [_config >> "AnimationSources", "true", false];
	
	// calculate all animation names so we know what is there	
	{			
		_animName = configName _x;
		if ((["door", _animName] call BIS_fnc_inString) && !(["locked", _animName] call BIS_fnc_inString) && !(["disabled", _animName] call BIS_fnc_inString) && !(["handle", _animName] call BIS_fnc_inString)) then {			
			_splitStr = _animName splitString "_";			
			_doorParts pushBack ((_splitStr select 0) + "_" + (_splitStr select 1) + "_trigger");
		};
	} forEach _animate;	
	
	private _glassDoor = _door splitString "_";	
	private _glassPos = (_house selectionPosition [(_glassDoor select 0) + "_" + (_glassDoor select 1) + "_effects", "Memory"]);	
	
	private _doorPos = [];
	{
		_doorPos pushBack (_house selectionPosition [_x, "Memory"]);
	} forEach _doorParts;
	
	private _lowestDistance = 0;	
	{		
		private _dist = _glassPos distance  _x;
		if (_lowestDistance == 0) then {
			_lowestDistance = _dist;
			_newString = (_doorParts select _forEachIndex) splitString "_";			
			_door = ((_newString select 0) + "_" + (_newString select 1) + "_rot");
		} else {
			if (_dist < _lowestDistance) then {
				_lowestDistance = _dist;
				_newString = (_doorParts select _forEachIndex) splitString "_";			
				_door = ((_newString select 0) + "_" + (_newString select 1) + "_rot");				
			};			
		};							
	} forEach _doorPos;		
};

if (isNil "_door") exitWith {[_house, ""]};

[_house, _door]
