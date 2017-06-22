/*
 * Author: marc_book
 * Starts refueling/recharging the 'Dartar' UAVs
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: UAV <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, theUAV] call ace_logistics_uavbattery_fnc_refuelUAV
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_caller", "_target"];

if (!(_this call FUNC(canRefuelUAV))) exitWith {};

private _onFinish = {
    (_this select 0) params ["_caller", "_target"];
    _caller removeItem "ACE_UAVBattery";
    playSound3D [QUOTE(PATHTO_R(sounds\exchange_battery.ogg)), objNull, false, getPosASL _caller, 1, 1, 10];
      [QEGVAR(common,setFuel), [_target, 1], [_target]] call CBA_fnc_targetEvent; //setFuel is local
};

private _onFailure = {
    (_this select 0) params ["_caller", "_target"];
    [_caller, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
};

[_caller, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

[10, [_caller, _target], _onFinish, _onFailure, (localize LSTRING(Battery_Recharge)), {(_this select 0) call FUNC(canRefuelUAV)}] call EFUNC(common,progressBar);
