[
    QGVAR(allowAllLayers),
    "CHECKBOX",
    [LSTRING(allowAllLayers), LSTRING(allowAllLayers_Description)],
    format ["ACE %1", LELSTRING(map,Module_DisplayName)],
    true,
    1
] call CBA_fnc_addSetting;
