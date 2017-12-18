//boot.sqf
intercept_params_var = [];
diag_log text format["Initializing Intercept"];
private _res = "intercept" callExtension "init:";
diag_log text format["Intercept initialization part 1/3: %1", _res];
_res = "intercept" callExtension format["init_patch:%1", (productVersion select 3)]; // find a patch
"intercept" callExtension "invoker_begin_register:";


_registerTypesResult = (call compile "interceptRegisterTypes parsingNamespace") param [0, false];

diag_log text format["Intercept initialization part 2/3: %1", _registerTypesResult];

private _intercept_projects = configFile >> "Intercept";
for "_i" from 0 to (count _intercept_projects)-1 do {
    private _project = _intercept_projects select _i;
    if(isClass _project) then {
        for "_x" from 0 to (count _project)-1 do {
            private _module = _project select _x;
            if(isClass _module) then {
                private _plugin_name = getText(_module >> "pluginName");
                if(_plugin_name != "") then {
                    diag_log text format["Intercept Loading Plugin: %1", _plugin_name];
                    _cert = getText(_module >> "certificate");
                    if (_cert != "") then {
                        "intercept" callExtension ("load_extension:" + _plugin_name+","+_cert);
                    } else {
                        "intercept" callExtension ("load_extension:" + _plugin_name);
                    };
                };
            };
        };
    };
};

if (_registerTypesResult) then {
    uiNamespace setVariable ["intercept_fnc_event", compileFinal preprocessFileLineNumbers "\z\intercept\rv\addons\core\event.sqf"];
} else {
    uiNamespace setVariable ["intercept_fnc_event", compileFinal ""];
};

["pre_start",[]] call (uiNamespace getVariable "intercept_fnc_event");

_res = "intercept" callExtension "invoker_end_register:";

diag_log text format["Intercept initialization part 3/3: %1", _res];

//diag_log text format["_________________________________________Intercept Res: %1", _res];
