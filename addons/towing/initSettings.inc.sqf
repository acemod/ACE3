[
    QGVAR(addRopeToVehicleInventory), "CHECKBOX",
    LSTRING(Setting_addRopeToVehicleInventory_DisplayName),
    ELSTRING(main,Category_Logistics),
    true,
    true,
    {
        if !(_this && {isServer} && {isNil QGVAR(addRopeToVehicleInventory_initialized)}) exitWith {};
        GVAR(addRopeToVehicleInventory_initialized) = true;
        {
            [_x, "initPost", LINKFUNC(addRopeToVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
        } forEach ["Car", "Ship", "Tank"];
    }
] call CBA_fnc_addSetting;
