/*
 * Author: Phyma
 * Find glass door.
 *
 * Arguments:
 * 0: Distance <NUMBER>
 * 1: House <OBJECT>
 * 2: Door name <STRING>
 *
 * Return Value:
 * 0: Door Name <STRING>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_getGlassDoor
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_distance", "_house", "_door"];

private _doorParts = [];
private _doorPos = [];
private _animate = animationNames _house;
private _glassDoor = _door splitString "_";
private _glassPos = (_house selectionPosition [(_glassDoor select 0) + "_" + (_glassDoor select 1) + "_effects", "Memory"]);
// Calculate all animation names so we know what is there
{
    private _animName = toLower _x;
    if (((_animName find "door") != -1) && ((_animName find "locked") == -1) && ((_animName find "disabled") == -1) && ((_animName find "handle") == -1)) then {
        private _splitStr = _animName splitString "_";
        _doorParts pushBack ((_splitStr select 0) + "_" + (_splitStr select 1) + "_trigger");
    };
} forEach _animate;


// Get the pos of all the door components and save the parts
{
    _doorPos pushBack (_house selectionPosition [_x, "Memory"]);
} forEach _doorParts;

// Calculate what door that is closest to the glass door
private _lowestDistance = 0;
{
    private _objDist = _glassPos distance  _x;
    //Make sure we dont take another door by mistake
    if (_objDist <= _distance) then {
        //Need to set the value in the beginning
        if (_lowestDistance == 0) then {
            _lowestDistance = _objDist;
            private _splitStr = (_doorParts select _forEachIndex) splitString "_";
            _door = (_splitStr select 0) + "_" + (_splitStr select 1);
        } else {
            if (_objDist < _lowestDistance) then {
                _lowestDistance = _objDist;
                private _splitStr = (_doorParts select _forEachIndex) splitString "_";
                _door = (_splitStr select 0) + "_" + (_splitStr select 1);
            };
        };
    };
} forEach _doorPos;

// Check if we have a door or if it is the glass part
if ((isNil "_door") || ((_door find "glass") != -1)) exitWith {};

_door

