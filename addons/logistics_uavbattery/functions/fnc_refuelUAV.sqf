/*
 * Author: marc_book
 * Starts refueling/recharging the 'Dartar' UAVs
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: UAV <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, theUAV] call ace_logistics_uavbattery_fnc_refuelUAV
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_caller,_target);

private ["_onFinish", "_onFailure"];

if (!(_this call FUNC(canRefuelUAV))) exitWith {};

_onFinish = {
   EXPLODE_2_PVT((_this select 0),_caller,_target);
  _caller removeItem "ACE_UAVBattery";
  playSound3D [QUOTE(PATHTO_R(sounds\exchange_battery.ogg)), objNull, false, getPosASL _caller, 1, 1, 10];
  ["setFuel", [_target], [_target, 1]] call EFUNC(common,targetEvent); //setFuel is local
};

_onFailure = {
  EXPLODE_2_PVT((_this select 0),_caller,_target);
  [_caller, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
};

[_caller, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

[10, [_caller, _target], _onFinish, _onFailure, (localize STRING(Battery_Recharge)), {(_this select 0) call FUNC(canRefuelUAV)}] call EFUNC(common,progressBar);
