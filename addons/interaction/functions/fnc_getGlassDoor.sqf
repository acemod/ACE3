/*
 * Author: Phyma
 * Find glass door.
 *
 * Arguments:
 * 0: House <OBJECT>
 * 1: Door name <STRING>
 *
 * Return Value:
 * House objects and door <ARRAY>
 * 0: House <OBJECT>
 * 1: Door Name <STRING>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_getGlassDoor
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_house", "_door"]; 

private ["_animName", "_splitStr", "_newString", "_dist", "_animate"];
private _doorParts = [];
private _doorPos = [];
private _config = _house call CBA_fnc_getObjectConfig;  
private _animate = configProperties [_config >> "AnimationSources", "true", false];
private _glassDoor = _door splitString "_"; 
private _glassPos = (_house selectionPosition [(_glassDoor select 0) + "_" + (_glassDoor select 1) + "_effects", "Memory"]);    

// calculate all animation names so we know what is there   
{           
    _animName = configName _x;
    if ((["door", _animName] call BIS_fnc_inString) && !(["locked", _animName] call BIS_fnc_inString) && !(["disabled", _animName] call BIS_fnc_inString) && !(["handle", _animName] call BIS_fnc_inString)) then {         
        _splitStr = _animName splitString "_";          
        _doorParts pushBack ((_splitStr select 0) + "_" + (_splitStr select 1) + "_trigger");
    };
} forEach _animate; 

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

[_house, _door]
