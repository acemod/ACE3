[
    QGVAR(addRopeToVehicleInventory), "CHECKBOX",
    LSTRING(Setting_addRopeToVehicleInventory_DisplayName),
    LELSTRING(OptionsMenu,CategoryLogistics),
    true,
    true,
    {
        if (!_this) exitWith {
            [QGVAR(addRopeToVehicleInventory), _this] call EFUNC(common,cbaSettings_settingChanged);
        };
        if (!isServer || {!isNil QGVAR(addRopeToVehicleInventory_initialized)}) exitWith {};
        GVAR(addRopeToVehicleInventory_initialized) = true;
        ["Tank", "initPost", {call FUNC(addRopeToVehicle)}, true, [], true] call CBA_fnc_addClassEventHandler;
        ["Car", "initPost", {call FUNC(addRopeToVehicle)}, true, [], true] call CBA_fnc_addClassEventHandler;
    },
    true // needs restart only on disabling
] call CBA_fnc_addSetting;
