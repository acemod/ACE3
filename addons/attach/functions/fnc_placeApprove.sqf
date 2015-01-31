/*
Name: FUNC(placeApprove)
Author(s):
  Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
Description:
  Approves placement of the lightObject, releases the placement object for it to settle in a location
Parameters:
  Nothing
Returns:
  Nothing
Example:
  call FUNC(placeApprove);
*/
#include "script_component.hpp"

private ["_setupObject", "_setupClassname", "_itemClassname", "_placementText", "_attachToVehicle", "_placer", "_startingPosition", "_startingOffset", "_distanceFromCenter", "_closeInUnitVector", "_keepGoingCloser", "_closeInDistance", "_endPosTestOffset", "_endPosTest", "_startingPosShifted", "_startASL", "_endPosShifted", "_endASL", "_attachedObject", "_currentObjects", "_currentItemNames"];


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

_distanceFromCenter = vectorMagnitude _startingOffset;
_closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);
_keepGoingCloser = true;
_closeInDistance = 0;

while {_keepGoingCloser} do {
  if (_closeInDistance >= _distanceFromCenter) exitWith {};

  _closeInDistance = _closeInDistance + 0.01; //10mm
  _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
  _endPosTestOffset set [2, (_startingOffset select 2)];
  _endPosTest = _attachToVehicle modelToWorld _endPosTestOffset;

  {
    _startingPosShifted = _startingPosition vectorAdd _x;
    _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
    {
      _endPosShifted = _endPosTest vectorAdd _x;
      _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};
      
      //Uncomment to see the lazor show, and see how the scanning works:
      drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];

      if (_attachToVehicle in lineIntersectsWith [_startASL, _endASL, _placer, _setupObject]) exitWith {_keepGoingCloser = false};
    } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
  } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];
};

//Delete Local Placement Object
deleteVehicle _setupObject;

//Checks
if (_closeInDistance >= _distanceFromCenter) exitWith {ERROR("no valid spot found")};
if (!([_placer,_attachToVehicle,_itemClassname] call FUNC(canAttach))) exitWith {ERROR("canAttach failed")};

//Move it out slightly, for visability sake (better to look a little funny than be embedded//sunk in the hull)
_closeInDistance = (_closeInDistance - 0.0085);

//Create New 'real' Object
_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];
_attachedObject = _setupClassname createVehicle (getPos _placer);
_attachedObject attachTo [_attachToVehicle, _endPosTestOffset];

//Remove Item from inventory
_placer removeItem _itemClassname;

//Add Object to ACE_AttachedObjects and ACE_AttachedItemNames
_currentObjects = _attachToVehicle getVariable ["ACE_AttachedObjects", []];
_currentObjects pushBack _attachedObject;
_attachToVehicle setVariable ["ACE_AttachedObjects", _currentObjects, true];
_currentItemNames = _attachToVehicle getVariable ["ACE_AttachedItemNames", []];
_currentItemNames pushBack _itemClassname;
_attachToVehicle setVariable ["ACE_AttachedItemNames", _currentItemNames, true];

[_placementText] call EFUNC(common,displayTextStructured);
