#include "script_component.hpp"
/*
 * Author: Salbei
 * Help digging trench.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_addDigger
 *
 * Public: No
 */

params ["_trench", "_unit"];

private _digginPlayers = _trench getVariable [QGVAR(diggingPlayers), []];

if (
      (count _digginPlayers) < 1
) exitWith {
      [_trench, _unit] call FUNC(continueDiggingTrench);
};

_trench setVariable [QGVAR(diggingPlayerst), _digginPlayers pushBackUnique ACE_player, true];

private _finishCondition = {false};
private _digTime = 0;
switch (_trench getVariable [QGVAR(diggingType), nil]) do {
   case "UP" : {
      _finishCondition = ((_trench getVariable [QGVAR(progress), 0]) >= 1);
      _digTime = missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(diggingDuration)), 20];
   };
   case "Down" : {
      _finishCondition = ((_trench getVariable [QGVAR(progress), 1]) <= 0);
      _digTime = missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(removalDuration)), 20];
   };
   default {ERROR(format ["No value for _type, %1!", _type]);};
};

private _handle = [{
   params ["_args", "_handle"];
    _args params ["_trench", "_unit"];

    if (
      (_trench getVariable [QGVAR(nextDigger), ACE_player]) == ACE_player &&
      count (_trench getVariable [QGVAR(diggingPlayers), []]) < 1 ||
      !(_trench getVariable [QGVAR(digging), false])
    ) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;
   };

},0.1, [_trench, _unit]] call CBA_fnc_addPerFrameHandler;

// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit"];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};

private _fnc_onFailure = {
    (_this select 0) params ["_unit", "_trench"];

    _trench setVariable [QGVAR(diggingPlayers), _trench getVariable [QGVAR(diggingPlayers),[]] - [_unit], true];

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
};
private _fnc_condition = {
   (_this select 0) params ["", "_trench", "_handle"];

   if (count (_trench getVariable [QGVAR(diggingPlayers),[]]) <= 1) exitWith {false};
   if (isNil "_handle") exitWith {false};
   if (GVAR(stopBuildingAtFatigueMax) && (QEGVAR(advanced_fatigue,anReserve) <= 0)) exitWith {false};
   true
};

[_digTime, [_unit, _trench, _handle], _fnc_onFinish, _fnc_onFailure, localize LSTRING(DiggingTrench), _fnc_condition, [], _finishCondition] call EFUNC(common,progressBar);

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call EFUNC(common,doAnimation);
