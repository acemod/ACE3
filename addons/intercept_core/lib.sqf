//lib.sqf

if (canSuspend) exitWith {diag_log "ERROR! Intercept initialization called from scheduled script";};

intercept_invoker_ok = false;

INTERCEPT_DUMMY = [1,2,3];

intercept_fnc_exportOpList = {
    private _version = format["%1 %2.%3 - %4", (productVersion select 0), (productVersion select 2), (productVersion select 3), (productVersion select 4)];
    "intercept" callExtension ("export_ptr_list:" + _version);
};

intercept_fnc_callWrapper = {
    scopeName "main";
    params ["_args", "_code"];
    private _res = [_x] apply {_args call _code} select 0;
    missionNamespace setVariable ["INTERCEPT_CALL_RETURN", _res];
};

intercept_fnc_isNilWrapper = {
	(missionNamespace getVariable "INTERCEPT_CALL_ARGS") call intercept_fnc_callWrapper;
};

diag_log text "Intercept Invoker SQF handler initializing...";
private _res = "intercept" callExtension "init_invoker:";

//Check if invoker is working
private _res = "intercept" callExtension "test_invoker:";
if(_res == profileNameSteam) then {
	intercept_invoker_ok = true;
};
diag_log text format["Intercept Invoker test result: %1 == %2", _res, profileNameSteam];
		
		
if(intercept_invoker_ok) then {
	intercept_fnc_signal = compileFinal preProcessFileLineNumbers "\z\intercept\rv\addons\core\signal.sqf";

	addMissionEventHandler ["EachFrame", "interceptOnFrame"]; //Register our PFH
	
    diag_log text "Intercept Invoker initialized.";
    diag_log text format["Intercept Pre-Init..."];
    ["pre_init",[]] call (uiNamespace getVariable "intercept_fnc_event");
    diag_log text format["Intercept Pre-Init Completed."];
} else {
	diag_log text "Intercept Invoker initialization failed.";
    intercept_fnc_signal =  compileFinal "";

    if (isNull (uiNamespace getVariable ["intercept_fnc_event", scriptNull])) then {
        uiNamespace setVariable ["intercept_fnc_event", compileFinal ""];
    };
};
