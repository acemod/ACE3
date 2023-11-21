[
    QGVAR(addRopeToVehicleInventory), "CHECKBOX",
    LSTRING(Setting_addRopeToVehicleInventory_DisplayName),
    ELSTRING(OptionsMenu,CategoryLogistics),
    true,
    true,
    {
        if !(_this && {isServer} && {isNil QGVAR(addRopeToVehicleInventory_initialized)}) exitWith {};
        GVAR(addRopeToVehicleInventory_initialized) = true;
        ["Tank", "initPost", LINKFUNC(addRopeToVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
        ["Car", "initPost", LINKFUNC(addRopeToVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
    }
] call CBA_fnc_addSetting;
