// by commy2

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

AGM_Fatigue_Module = true;

AGM_Fatigue_CoefFatigue = parseNumber (_logic getVariable "CoefFatigue");
AGM_Fatigue_CoefRecover = parseNumber (_logic getVariable "CoefRecover");

diag_log text "[AGM]: Fatigue Module Initialized.";
