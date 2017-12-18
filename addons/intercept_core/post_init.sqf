//post_init.sqf

if !(intercept_invoker_ok) exitWith {};

diag_log text format["Intercept Post-Init..."];
["post_init",[]] call (uiNamespace getVariable "intercept_fnc_event");
diag_log text format["Intercept Post-Init Finished..."];