//pragma SKIP_COMPILE
diag_log text "-------------------------------------------";
INFO("Showing entries with custom configs");
diag_log text "-------------------------------------------";


private _fnc_showPropertyDefined = {
    params ["_configBase", "_configProperty"];

    private _customAll = 'isNumber (_x >> _configProperty)' configClasses _configBase; // Would have to use configProperties if configs inherited subclasses
    private _customExplicit = _customAll select {_x == inheritsFrom (_x >> _configProperty)};
    diag_log text format ["%1 with custom %2: %3 Explicit, %4 Total]", configName _configBase, _configProperty, count _customExplicit, count _customAll];
    diag_log text format [" - Defined:   %1", _customExplicit apply {configName _x}];
    diag_log text format [" - Inherited: %1", _customAll apply {[configName _x, getNumber (_x >> _configProperty)]}];
};

[configFile >> "CfgMagazines", QGVAR(airFriction)] call _fnc_showPropertyDefined;
[configFile >> "CfgVehicles", QGVAR(showGunLaying)] call _fnc_showPropertyDefined;
[configFile >> "CfgVehicles", QGVAR(applyCorrections)] call _fnc_showPropertyDefined;

diag_log text "-------------------------------------------";
