diag_log text "-------------------------------------------";
INFO("Showing entries with custom configs");
diag_log text "-------------------------------------------";


private _fnc_showPropertyDefined = {
    params ["_configBase", "_configProperty"];

    private _customAll = configProperties [_configBase, 'isClass _x && {isNumber (_x >> _configProperty)}', true];
    private _customExplicit = _customAll select {!([] isEqualTo configProperties [_x, 'configName _x == _configProperty', false])};
    diag_log text format ["%1 with custom %2: %3 Explicit, %4 Total]", configName _configBase, _configProperty, count _customExplicit, count _customAll];
    diag_log text format [" - Defined:   %1", _customExplicit apply {configName _x}];
    diag_log text format [" - Inherited: %1", _customAll apply {[configName _x, getNumber (_x >> _configProperty)]}];
};

[configFile >> "CfgMagazines", QGVAR(airFriction)] call _fnc_showPropertyDefined;
[configFile >> "CfgVehicles", QGVAR(showGunLaying)] call _fnc_showPropertyDefined;
[configFile >> "CfgVehicles", QGVAR(applyCorrections)] call _fnc_showPropertyDefined;

diag_log text "-------------------------------------------";
