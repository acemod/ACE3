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

private ["_setupObject", "_setupClassname", "_itemClassname", "_placementText", "_attachToVehicle", "_player", "_position0", "_closeInRatio", "_offset", "_keepGoingCloser", "_pos0temp", "_position1", "_attachedObject", "_currentObjects", "_currentItemNames"];

if (GVAR(pfeh_running)) then {
  [QGVAR(PlacementEachFrame),"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
  GVAR(pfeh_running) = false;
};

_setupObject = GVAR(setupObject);
_setupClassname = typeOf _setupObject;
_itemClassname = GVAR(SetupPlacmentItem);
_placementText = GVAR(SetupPlacmentText);
_attachToVehicle = GVAR(SetupAttachVehicle);

GVAR(SetupPlacmentItem) = "";
GVAR(SetupPlacmentText) = "";
GVAR(setupObject) = objNull;
GVAR(SetupAttachVehicle) = objNull;
[GVAR(placer), QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
GVAR(placer) = objNull;

_player = ACE_player;
[_player, "DefaultAction", _player getVariable [QGVAR(placeActionEH), -1]] call EFUNC(common,removeActionEventHandler);
[_player, "MenuBack", _player getVariable [QGVAR(cancelActionEH), -1]] call EFUNC(common,removeActionEventHandler);
call EFUNC(interaction,hideMouseHint);

//A player can release the attachObject with it floating in mid-air.
//This will use lineIntersectsWith to scan towards the center of the vehicle to find a collision
//ArmA's collision detection is of couse terrible and often misses collisions (difference between what we see and collision LOD)
//So it does multiple scans at slighly different angles
//This is VERY computationaly intensive, but doesn't happen that often.

_position0 = getPosAtl _setupObject;
_closeInRatio = 1;
_offset = _attachToVehicle worldToModel _position0;
_keepGoingCloser = true;
while {_keepGoingCloser} do {
  _closeInRatio = _closeInRatio - 0.004;
  if (_closeInRatio <= 0) exitWith {};
  {
    _pos0temp = _position0 vectorAdd _x;
    {
      _position1 = [(_offset select 0) * _closeInRatio, (_offset select 1) * _closeInRatio, (_offset select 2)];
      _position1 = _attachToVehicle modelToWorld _position1;
      _position1 = _position1 vectorAdd _x;
      //Uncomment to see the lazor show, and see how the scanning works:
      // drawLine3D [_pos0temp, _position1, [1,0,0,1]];
      if (_attachToVehicle in lineIntersectsWith [(ATLToASL _pos0temp), (ATLToASL _position1), player, _setupObject]) exitWith {_keepGoingCloser = false};
    } forEach [[0,0,0], [0,0,0.075], [0,0,-0.075], [0,0.075,0], [0,-0.075,0], [0.075,0,0], [-.075,0,0]];
  } forEach [[0,0,0], [0,0,0.075], [0,0,-0.075]];
};
//Move it out slightly, for visability sake (better to look a little funny than be embedded//sunk in the hull)
_closeInRatio = (_closeInRatio + 0.006) min 1;

//Delete Local Placement Object
deleteVehicle _setupObject;

//Create New 'real' Object
_attachedObject = _setupClassname createVehicle (getPos _player);
_attachedObject attachTo [_attachToVehicle, [(_offset select 0) * _closeInRatio, (_offset select 1) * _closeInRatio, (_offset select 2)]];

//Remove Item from inventory
_player removeItem _itemClassname;

//Add Object to ACE_AttachedObjects and ACE_AttachedItemNames
_currentObjects = _attachToVehicle getVariable ["ACE_AttachedObjects", []];
_currentObjects pushBack _attachedObject;
_attachToVehicle setVariable ["ACE_AttachedObjects", _currentObjects, true];
_currentItemNames = _attachToVehicle getVariable ["ACE_AttachedItemNames", []];
_currentItemNames pushBack _itemClassname;
_attachToVehicle setVariable ["ACE_AttachedItemNames", _currentItemNames, true];

[_placementText] call EFUNC(common,displayTextStructured);
