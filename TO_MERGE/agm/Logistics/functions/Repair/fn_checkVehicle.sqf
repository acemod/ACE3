// commy2

private "_vehicle";

_vehicle = _this select 0;

player playActionNow "Gear";

[8, [_vehicle], "AGM_Repair_fnc_checkVehicleCallback", localize "STR_AGM_Repair_CheckingVehicle"] call AGM_Core_fnc_progressBar;
[_vehicle] call AGM_Core_fnc_closeDialogIfTargetMoves;
