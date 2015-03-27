/*
 * Author: Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
 * Approves placement of the lightObject, scans for an appropriate location and attaches
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_setupObject", "_setupClassname", "_itemClassname", "_placementText", "_attachToVehicle", "_placer", "_startingPosition", "_startingOffset", "_startDistanceFromCenter", "_closeInUnitVector", "_keepGoingCloser", "_closeInMax", "_closeInMin", "_closeInDistance", "_endPosTestOffset", "_endPosTest", "_doesIntersect", "_startingPosShifted", "_startASL", "_endPosShifted", "_endASL", "_attachedObject", "_currentObjects", "_currentItemNames"];

if (GVAR(pfeh_running)) then {
    [QGVAR(PlacementEachFrame),"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
    GVAR(pfeh_running) = false;
};

_setupObject = GVAR(setupObject);
_setupClassname = typeOf _setupObject;
_itemClassname = GVAR(SetupPlacmentItem);
_placementText = GVAR(SetupPlacmentText);
_attachToVehicle = GVAR(SetupAttachVehicle);
_placer = GVAR(placer);

GVAR(SetupPlacmentItem) = "";
GVAR(SetupPlacmentText) = "";
GVAR(setupObject) = objNull;
GVAR(SetupAttachVehicle) = objNull;
GVAR(placer) = objNull;

[_placer, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
[_placer, "DefaultAction", _placer getVariable [QGVAR(placeActionEH), -1]] call EFUNC(common,removeActionEventHandler);
[_placer, "MenuBack", _placer getVariable [QGVAR(cancelActionEH), -1]] call EFUNC(common,removeActionEventHandler);
call EFUNC(interaction,hideMouseHint);

//A player can release the attachObject with it floating in mid-air.
//This will use lineIntersectsWith to scan towards the center of the vehicle to find a collision
//ArmA's collision detection is of couse terrible and often misses collisions (difference between what we see and collision LOD)
//So it does multiple scans at slighly different angles
//This is VERY computationaly intensive, but doesn't happen that often.

_startingPosition = _setupObject modelToWorld [0,0,0];
_startingOffset = _attachToVehicle worldToModel _startingPosition;

_startDistanceFromCenter = vectorMagnitude _startingOffset;
_closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);
_keepGoingCloser = true;

_closeInMax = _startDistanceFromCenter;
_closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    // systemChat format ["Trying %1 from %2 start %3", _closeInDistance, [_closeInMax, _closeInMin], _startDistanceFromCenter];
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    _endPosTest = _attachToVehicle modelToWorld _endPosTestOffset;

    _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        _startingPosShifted = _startingPosition vectorAdd _x;
        _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
        {
            _endPosShifted = _endPosTest vectorAdd _x;
            _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};

            //Uncomment to see the lazor show, and see how the scanning works:
            drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];

            if (_attachToVehicle in lineIntersectsWith [_startASL, _endASL, _placer, _setupObject]) exitWith {_doesIntersect = true};
        } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
    } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];
    
    if (_doesIntersect) then {
        _closeInMax = _closeInDistance;
    } else {
        _closeInMin = _closeInDistance;
    };
};

_closeInDistance = (_closeInMax + _closeInMin) / 2;

//Delete Local Placement Object
deleteVehicle _setupObject;

//Checks
if (((_startDistanceFromCenter - _closeInDistance) < 0.1) || {!([_attachToVehicle, _placer, _itemClassname] call FUNC(canAttach))}) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize "STR_ACE_Attach_Failed"] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visability sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = (_closeInDistance - 0.0085);

//Create New 'real' Object
_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];
_attachedObject = _setupClassname createVehicle (getPos _placer);
_attachedObject attachTo [_attachToVehicle, _endPosTestOffset];

//Remove Item from inventory
_placer removeItem _itemClassname;

//Add Object to ACE_AttachedObjects and ACE_AttachedItemNames
_currentObjects = _attachToVehicle getVariable [QGVAR(Objects), []];
_currentObjects pushBack _attachedObject;
_attachToVehicle setVariable [QGVAR(Objects), _currentObjects, true];
_currentItemNames = _attachToVehicle getVariable [QGVAR(ItemNames), []];
_currentItemNames pushBack _itemClassname;
_attachToVehicle setVariable [QGVAR(ItemNames), _currentItemNames, true];

[_placementText] call EFUNC(common,displayTextStructured);
