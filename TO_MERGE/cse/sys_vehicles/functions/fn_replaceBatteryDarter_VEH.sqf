/**
 * fn_replaceBatteryDarter_VEH.sqf
 * @Descr: REplace the darter battery
 * @Author: Glowbal
 *
 * @Arguments: [darter OBJECT, unit UNIT]
 * @Return: bool
 * @PublicAPI: false
 */

private ["_uav", "_unit"];
_uav = _this select 0;
_unit = _this select 1;

if !(_uav isKindOf "B_UAV_01_F" || _uav isKindOf "O_UAV_01_F" || _uav isKindOf "G_UAV_01_F") exitwith {false;};
if !([_unit, "cse_battery_darter"] call cse_fnc_hasItem) exitwith {false;};

[_unit, "cse_battery_darter"] call cse_fnc_useItem;
_uav setFuel 1;

true;