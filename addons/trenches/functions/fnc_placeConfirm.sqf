/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Confirms trench dig
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_placeConfirm
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// enable running again
[_unit, "forceWalk", "ACE_Trenches", false] call ace_common_fnc_statusEffect_set;

// remove dig pfh
[ace_trenches_digPFH] call CBA_fnc_removePerFrameHandler;
ace_trenches_digPFH = -1;

// remove mouse button actions
call ace_interaction_fnc_hideMouseHint;

[_unit, "DefaultAction", _unit getVariable ["ace_trenches_Dig", -1]] call ace_common_fnc_removeActionEventHandler;

_unit setVariable ["ace_trenches_isPlacing", false, true];

// Delete placement dummy and create real trench
params ["_unit"];
if (isNull ace_trenches_trench) exitWith {};

private _trenchClass = typeOf ace_trenches_trench;
private _vecDirAndUp = [(vectorDir ace_trenches_trench), (vectorUp ace_trenches_trench)];
deleteVehicle ace_trenches_trench;

ace_trenches_trenchPos set [2, -0.2];
private _trench = createVehicle [_trenchClass, ace_trenches_trenchPos, [], 0, "CAN_COLLIDE"];
_trench setObjectTextureGlobal [0,[_trench] call FUNC(getSurfaceTexturePath)];
test_trench = _tench;
publicVariable "test_trench";

private _boundingBox = boundingBoxReal _trench;
_boundingBox params ["_lbfc", "_rtbc"];                                         //_lbfc(Left Bottom Front Corner) _rtbc (Right Top Back Corner)
_lbfc params ["", "", "_lbfcZ"];
_rtbc params ["", "", "_rtbcZ"];

private _boundingBoxOffset =  missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> _trenchClass >> "ace_trenches_boundingBoxOffset"),0];
private _posDiff = (abs(_lbfcZ) + abs(_rtbcZ)) - _boundingBoxOffset;
private _newPos = (_trench modelToWorldWorld [0,0, -(_posDiff)]);
_trench setPosWorld _newPos;

_trench setVariable [QGVAR(diggingSteps), (_posDiff/1000),true];
_trench setVectorDirAndUp _vecDirAndUp;

_trench setVariable ["ace_trenches_placeData", [_newPos, _vecDirAndUp], true];
_trench setVariable [QGVAR(progress), 0, true];

[_trench, _unit, false] call FUNC(continueDiggingTrench);
