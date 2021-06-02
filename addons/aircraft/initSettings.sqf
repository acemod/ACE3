[
    QGVAR(droneWaypointInteractions), "CHECKBOX",
    [LSTRING(droneWaypointInteractions_name), LSTRING(droneWaypointInteractions_tooltip)],
    [ELSTRING(common,ACEKeybindCategoryVehicles), "STR_A3_CfgEditorSubcategories_EdSubcat_Drones0"],
    true, // default value
    true, // isGlobal
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(droneShowLaserOnMap), "CHECKBOX",
    [LSTRING(droneShowLaserOnMap_name), LSTRING(droneShowLaserOnMap_tooltip)],
    [ELSTRING(common,ACEKeybindCategoryVehicles), "STR_A3_CfgEditorSubcategories_EdSubcat_Drones0"],
    false, // default value
    true, // isGlobal
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;
