// by commy2

private ["_unit", "_vehicle"];

_unit = _this select 0;
_vehicle = _this select 1;

player playActionNow "Gear";

[2, [_vehicle], "AGM_Resupply_fnc_getFuelAmountCargoCallback", localize "STR_AGM_Resupply_CheckingFuelCargo"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
