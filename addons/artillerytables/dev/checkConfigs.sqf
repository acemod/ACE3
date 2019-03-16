diag_log text "-------------------------------------------";
INFO("Showing entries with custom configs");
diag_log text "-------------------------------------------";

private _customMags = configProperties [(configFile >> "CfgMagazines"), 'isClass _x && {isNumber (_x >> QGVAR(airFriction))}', true];
_customMags = _customMags apply {[configName _x, getNumber (_x >> QGVAR(airFriction))]};
diag_log text format ["CfgMagazines with custom airFriction [%1]", count _customMags];
diag_log text format ["%1", _customMags];

private _customVeh = configProperties [(configFile >> "CfgVehicles"), 'isClass _x && {isNumber (_x >> QGVAR(showGunLaying))}', true];
_customVeh = _customVeh apply {[configName _x, getNumber (_x >> QGVAR(showGunLaying))]};
diag_log text format ["CfgVehicles with custom showGunLaying [%1]", count _customVeh];
diag_log text format ["%1", _customVeh];

private _customVeh = configProperties [(configFile >> "CfgVehicles"), 'isClass _x && {isNumber (_x >> QGVAR(applyCorrections))}', true];
_customVeh = _customVeh apply {[configName _x, getNumber (_x >> QGVAR(applyCorrections))]};
diag_log text format ["CfgVehicles with custom applyCorrections [%1]", count _customVeh];
diag_log text format ["%1", _customVeh];
