#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support and esteldunedain
 * Confirms trench dig
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_placeConfirm
 *
 * Public: No
 */

params ["_unit"];

// enable running again
[_unit, "forceWalk", "ACE_Trenches", false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_Trenches", false] call EFUNC(common,statusEffect_set);

// remove dig pfh
[GVAR(digPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(digPFH) = -1;

// remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Dig), -1]] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(isPlacing), false, true];

// Delete placement dummy and create real trench
params ["_unit"];
if (isNull GVAR(trench)) exitWith {};

private _trenchClass = typeOf GVAR(trench);
private _vecDirAndUp = [vectorDir GVAR(trench), vectorUp GVAR(trench)];
private _pos = getPosWorld GVAR(trench);
deleteVehicle GVAR(trench);

private _trench = createVehicle [_trenchClass, [0,0,0], [], 0, "CAN_COLLIDE"];
_trench setPosWorld _pos;
_trench setVectorDirAndUp _vecDirAndUp;
_trench setObjectTextureGlobal [0, [_trench] call FUNC(getSurfaceTexturePath)];

private _boundingBox = 0 boundingBoxReal _trench;
_boundingBox params ["_lbfc", "_rtbc"];                                         //_lbfc(Left Bottom Front Corner) _rtbc (Right Top Back Corner)
_lbfc params ["", "", "_lbfcZ"];
_rtbc params ["", "", "_rtbcZ"];

private _posDiff = abs _lbfcZ + abs _rtbcZ;
private _newPos = _trench modelToWorldWorld [0, 0, -_posDiff];
_trench setPosWorld _newPos;

private _digTime = missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(diggingDuration)), 20];
_trench setVariable [QGVAR(diggingSteps), _posDiff/_digTime, true];
_trench setVectorDirAndUp _vecDirAndUp;

_trench setVariable [QGVAR(placeData), [_newPos, _vecDirAndUp], true];
_trench setVariable [QGVAR(progress), 0, true];

[_trench, _unit, false] call FUNC(continueDiggingTrench);
