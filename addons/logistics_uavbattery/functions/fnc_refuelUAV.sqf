/* fnc_refuel.sqf
*
* Author: marc_book (modified by PabstMirror)
*
* Starts refueling/recharging the 'Dartar' UAVs
*
* Argument:
* 0: OBJECT - Player unit
* 1: OBJECT - UAV
*
* Return value:
* NOTHING
*/

#include "script_component.hpp"

PARAMS_2(_caller,_target);

if (!(_this call FUNC(canRefuelUAV))) exitWith {};

_onFinish = {
   EXPLODE_2_PVT((_this select 0),_caller,_target);
  _target setFuel 1;
  _caller removeItem "ACE_UAVBattery";
};

_onFailure = {
  EXPLODE_2_PVT((_this select 0),_caller,_target);
  [_caller, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
};

[_caller, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

[10, [_caller, _target], _onFinish, _onFailure, (localize "STR_ACE_logistics_uavbattery_Battery_Recharge"), {(_this select 0) call FUNC(canRefuelUAV)}] call EFUNC(common,progressBar);
