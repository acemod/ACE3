/*
 * Author: KoffeinFlummi, edited by commy2 and esteldunedain
 *
 * Prepares intersects
 *
 * Arguments:
 * 0: unit
 * 1: vehicle
 * 2: weapon
 *
 * Return Values:
 * [_intersectsMiddle, _intersectsLeft, _intersectsRight, _intersectsDown]
 *
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_unit,_vehicle,_weapon);

private ["_weaponPos", "_weaponDir", "_weaponPosDown"];

_weaponPos = ATLtoASL (_unit modelToWorld (_unit selectionPosition "RightHand"));
_weaponDir = _unit weaponDirection _weapon;
_weaponPosDown = _weaponPos vectorAdd [0,0,-MAXHEIGHT];

private ["_checkPosMiddle", "_checkPosLeft", "_checkPosRight", "_checkPosDown"];

_checkPosMiddle = [
  (_weaponPos select 0) + MAXDISTANCE * (_weaponDir select 0),
  (_weaponPos select 1) + MAXDISTANCE * (_weaponDir select 1),
  (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
];
_checkPosLeft = [
  (_weaponPos select 0) + MAXDISTANCE * sin (((_weaponDir select 0) atan2 (_weaponDir select 1)) + 360 - MAXANGLE),
  (_weaponPos select 1) + MAXDISTANCE * cos (((_weaponDir select 0) atan2 (_weaponDir select 1)) + 360 - MAXANGLE),
  (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
];
_checkPosRight = [
  (_weaponPos select 0) + MAXDISTANCE * sin (((_weaponDir select 0) atan2 (_weaponDir select 1)) + MAXANGLE),
  (_weaponPos select 1) + MAXDISTANCE * cos (((_weaponDir select 0) atan2 (_weaponDir select 1)) + MAXANGLE),
  (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
];
_checkPosDown = [
  (_weaponPos select 0) + MAXDISTANCE * (_weaponDir select 0),
  (_weaponPos select 1) + MAXDISTANCE * (_weaponDir select 1),
  (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2) - MAXHEIGHT
];

/* UNCOMMENT THIS FOR DEBUGGING
weaponPos = ASLtoATL _weaponPos;
weaponPosDown = ASLtoATL _weaponPosDown;
checkPosMiddle = ASLtoATL _checkPosMiddle;
checkPosLeft = ASLtoATL _checkPosLeft;
checkPosRight = ASLtoATL _checkPosRight;
checkPosDown = ASLtoATL _checkPosDown;

onEachFrame {
  drawLine3D [weaponPos, checkPosMiddle, [1,0,0,1]];
  drawLine3D [weaponPos, checkPosLeft, [1,0,0,1]];
  drawLine3D [weaponPos, checkPosRight, [1,0,0,1]];
  drawLine3D [weaponPosDown, checkPosDown, [1,0,0,1]];
};*/

private ["_intersectsMiddle", "_intersectsLeft", "_intersectsRight", "_intersectsDown"];

_intersectsMiddle = lineIntersects [_weaponPos, _checkPosMiddle];
_intersectsLeft = lineIntersects [_weaponPos, _checkPosLeft];
_intersectsRight = lineIntersects [_weaponPos, _checkPosRight];
_intersectsDown = lineIntersects [_weaponPos, _checkPosDown] || {terrainIntersectASL [_weaponPosDown, _checkPosDown]};

[_intersectsMiddle, _intersectsLeft, _intersectsRight, _intersectsDown]
