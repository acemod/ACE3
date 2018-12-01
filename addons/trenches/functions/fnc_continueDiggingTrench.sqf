#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support, esteldunedain, Salbei
 * Continue process of digging trench.
 *
 * Arguments:
 * 0: trench <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_continueDiggingTrench
 *
 * Public: No
 */

params ["_trench", "_unit",["_switchingDigger", false]];
TRACE_2("continueDiggingTrench",_trench,_unit);

private _actualProgress = _trench getVariable [QGVAR(progress), 0];
if (_actualProgress == 1) exitWith {};

// Mark trench as being worked on
_trench setVariable [QGVAR(digging), true, true];
_trench setVariable [QGVAR(diggingType), "UP", true];
private _diggerCount = _trench getVariable [QGVAR(diggerCount), 0];

if (_diggerCount > 0) then {
   if !(_switchingDigger) then {
      [_trench, _unit] call FUNC(addDigger);
   };
}else{
   _trench setVariable [QGVAR(diggerCount), 1,true];
};

private _digTime = missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(diggingDuration)), 20];
private _placeData = _trench getVariable [QGVAR(placeData), [[], []]];
_placeData params ["", "_vecDirAndUp"];

if (isNil "_vecDirAndUp") then {
   _vecDirAndUp = [vectorDir _trench, vectorUp _trench];
};

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit", "_trench"];
    _trench setVariable [QGVAR(digging), false, true];
    _trench setVariable [QGVAR(diggingType), nil, true];

    // Save progress global
    _trench setVariable [QGVAR(progress), 1, true];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_trench"];
    _trench setVariable [QGVAR(digging), false, true];
    _trench setVariable [QGVAR(diggingType), nil, true];

    // Save progress global
    private _progress = _trench getVariable [QGVAR(progress), 0];
    _trench setVariable [QGVAR(progress), _progress, true];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_condition = {
   (_this select 0) params ["", "_trench"];

   if !(_trench getVariable [QGVAR(digging), false]) exitWith {false};
   if (_trench getVariable [QGVAR(diggerCount), 0] <= 0) exitWith {false};
   if (GVAR(stopBuildingAtFatigueMax) && (EGVAR(advanced_fatigue,anReserve) <= 0))  exitWith {false};
   true
};

[[_unit, _trench], _fnc_onFinish, _fnc_onFailure, localize LSTRING(DiggingTrench), _fnc_condition] call FUNC(progressBar);

if (_actualProgress == 0) then {
      //Remove grass
    {
        private _trenchGrassCutter = createVehicle ["Land_ClutterCutter_medium_F", [0, 0, 0], [], 0, "NONE"];
        private _cutterPos = AGLToASL (_trench modelToWorld _x);
        _cutterPos set [2, getTerrainHeightASL _cutterPos];
        _trenchGrassCutter setPosASL _cutterPos;
        deleteVehicle _trenchGrassCutter;
    } foreach getArray (configFile >> "CfgVehicles" >> (typeOf _trench) >> "ace_trenches_grassCuttingPoints");
};

[{
  params ["_args", "_handle"];
  _args params ["_trench", "_unit", "_digTime", "_vecDirAndUp"];
  private _actualProgress = _trench getVariable [QGVAR(progress), 0];
  private _diggerCount = _trench getVariable [QGVAR(diggerCount), 0];

  if (
        !(_trench getVariable [QGVAR(digging), false]) ||
        (_diggerCount <= 0) ||
        (_actualProgress >= 1)
     ) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
    _trench setVariable [QGVAR(digging), false, true];
    _trench setVariable [QGVAR(diggerCount), ((_diggerCount -1) max 0), true];
  };

  private _boundingBox = boundingBoxReal _trench;
  _boundingBox params ["_lbfc"];                                         //_lbfc(Left Bottom Front Corner) _rtbc (Right Top Back Corner)
  _lbfc params ["", "", "_lbfcZ"];

  private _pos = (getPosWorld _trench);
  private _posDiff = ((abs((_trench getVariable [QGVAR(diggingSteps), 0]) + _lbfcZ)) * _diggerCount)/(_digTime*5);
  _pos set [2,((_pos select 2) + _posDiff)];

  _trench setPosWorld _pos;
  _trench setVectorDirAndUp _vecDirAndUp;

  //Fatigue impact
  EGVAR(advanced_fatigue,anReserve) = (EGVAR(advanced_fatigue,anReserve) - ((_digTime /12) * GVAR(buildFatigueFactor))) max 0;
  EGVAR(advanced_fatigue,anFatigue) = (EGVAR(advanced_fatigue,anFatigue) + (((_digTime/12) * GVAR(buildFatigueFactor))/1200)) min 1;

  // Save progress
  _trench setVariable [QGVAR(progress), (_actualProgress + ((1/(_digTime *10)) * _diggerCount)), true];

  if (GVAR(stopBuildingAtFatigueMax) && (EGVAR(advanced_fatigue,anReserve) <= 0)) exitWith {
     [_handle] call CBA_fnc_removePerFrameHandler;
     _trench setVariable [QGVAR(digging), false, true];
     _trench setVariable [QGVAR(diggerCount), ((_diggerCount -1) max 0), true];
  };
},0.1,[_trench, _unit, _digTime, _vecDirAndUp]] call CBA_fnc_addPerFrameHandler;

// Play animation
[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
