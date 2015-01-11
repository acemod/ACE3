_target = _this select 0;
_caller = _this select 1;

if !("AGM_UAVBattery" in items _caller) exitWith {};

_target setFuel 1;
_caller removeItem "AGM_UAVBattery";
