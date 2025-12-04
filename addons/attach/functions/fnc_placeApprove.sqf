#include "..\script_component.hpp"
/*
 * Author: Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
 * Approves placement of the lightObject, scans for an appropriate location and attaches
 * A player can release the attachObject with it floating in mid-air.
 * This will use lineIntersectsSurfaces to scan towards the center of the vehicle to find a collision
 * Arma's collision detection is of couse terrible and often misses collisions (difference between what we see and collision LOD)
 * So it does multiple scans at slighly different angles
 * This is VERY computationaly intensive, but doesn't happen that often.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 * 1: attachToVehicle <OBJECT>
 * 2: Item Classname (CfgWeapon/CfgMagazine) <STRING>
 * 3: Light Vehicle Classname <STRING>
 * 4: On Attach Text <STRING>
 * 5: Starting Pos of dummy item <ARRAY>
 * 6: Orientation of model <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

params ["_unit", "_attachToVehicle", "_itemClassname", "_itemVehClass", "_onAttachText", "_startingPosition", "_itemModelOrientation"];
TRACE_6("params",_unit,_attachToVehicle,_itemClassname,_itemVehClass,_onAttachText,_startingPosition);

private _startingOffset = _attachToVehicle worldToModel _startingPosition;

private _startDistanceFromCenter = vectorMagnitude _startingOffset;
private _closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

private _closeInMax = _startDistanceFromCenter;
private _closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    private _closeInDistance = (_closeInMax + _closeInMin) / 2;
    // systemChat format ["Trying %1 from %2 start %3", _closeInDistance, [_closeInMax, _closeInMin], _startDistanceFromCenter];
    private _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    private _endPosTest = _attachToVehicle modelToWorldVisual _endPosTestOffset;

    private _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        private _startingPosShifted = _startingPosition vectorAdd _x;
        private _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLToASL _startingPosShifted};
        {
            private _endPosShifted = _endPosTest vectorAdd _x;
            private _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLToASL _endPosShifted};

            #ifdef DRAW_ATTACH_SCAN
                [{
                    params ["_args", "_idPFH"];
                    _args params ["_startingPosShifted", "_endPosShifted", "_timeAdded"];
                    drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];
                    if (_timeAdded + 5 < CBA_missionTime) then {
                        [_idPFH] call CBA_fnc_removePerFrameHandler;
                    };
                }, 0, [_startingPosShifted, _endPosShifted, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
            #endif

            // Default max results is 1, so take only first subarray and select parentObject (object itself or parent of proxy)
            private _intersectObject = ((lineIntersectsSurfaces [_startASL, _endASL, _unit]) param [0, objNull]) param [3, objNull];
            if (_attachToVehicle == _intersectObject) exitWith {_doesIntersect = true};
        } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
    } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];

    if (_doesIntersect) then {
        _closeInMax = _closeInDistance;
    } else {
        _closeInMin = _closeInDistance;
    };
};

private _closeInDistance = (_closeInMax + _closeInMin) / 2;

//Checks (too close to center or can't attach)
if (((_startDistanceFromCenter - _closeInDistance) < 0.1) || {!([_attachToVehicle, _unit, _itemClassname] call FUNC(canAttach))}) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visability sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = (_closeInDistance - 0.0085);

//Create New 'real' Object
private _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];
private _attachedObject = _itemVehClass createVehicle (getPos _unit);
_attachedObject attachTo [_attachToVehicle, _endPosTestOffset];

// Get wanted orientation if any is set
_itemModelOrientation params [["_roll", 0], ["_yaw", 90]];
private _dirAndUp = [[[0,1,0],[0,0,1]], -_yaw, 0, _roll] call BIS_fnc_transformVectorDirAndUp;

// Transform dir and up vector from player model to world, then to model-space of _attachToVehicle
private _dir = _unit vectorModelToWorldVisual _dirAndUp#0;
_dir = _attachToVehicle vectorWorldToModelVisual _dir;

private _up = _unit vectorModelToWorldVisual _dirAndUp#1;
_up = _attachToVehicle vectorWorldToModelVisual _up;

_attachedObject setVectorDirAndUp [_dir, _up];

//Remove Item from inventory
_unit removeItem _itemClassname;

//Add Object to attached array
private _attachList = _attachToVehicle getVariable [QGVAR(attached), []];
_attachList pushBack [_attachedObject, _itemClassname];
_attachToVehicle setVariable [QGVAR(attached), _attachList, true];
[QGVAR(attached), [_attachedObject, _itemClassname, false]] call CBA_fnc_localEvent;

[_onAttachText, 2] call EFUNC(common,displayTextStructured);
