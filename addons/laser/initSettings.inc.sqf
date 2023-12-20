private _category = [LELSTRING(common,categoryUncategorized), LLSTRING(laser)];

[
    QGVAR(dispersionCount),  "SLIDER",
    LSTRING(dispersionCount_displayName),
    _category,
    [0, 5, 2, -1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(showLaserOnMap), "LIST",
    [LSTRING(showLaserOnMap), LSTRING(showLaserOnMap_tooltip)],
    _category,
    [
        [0, 1, 2, 3],
        [LELSTRING(Common,Disabled), "STR_A3_CfgEditorSubcategories_EdSubcat_Drones0", "str_dn_vehicles", LELSTRING(common,Always)],
        1
    ],
    true
] call CBA_fnc_addSetting;
