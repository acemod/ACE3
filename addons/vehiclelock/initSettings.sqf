// CBA Settings [ADDON: ace_vehicleLock]:

[
    QGVAR(defaultLockpickStrength), "SLIDER",
    [LSTRING(DefaultLockpickStrength_DisplayName), LSTRING(DefaultLockpickStrength_Description)],
    LSTRING(DisplayName),
    [-1,60,10,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true, // isGlobal
    {[QGVAR(defaultLockpickStrength), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(lockVehicleInventory), "CHECKBOX",
    [LSTRING(LockVehicleInventory_DisplayName), LSTRING(LockVehicleInventory_Description)],
    LSTRING(DisplayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(lockVehicleInventory), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;

[
    QGVAR(vehicleStartingLockState), "LIST",
    [LSTRING(VehicleStartingLockState_DisplayName), LSTRING(VehicleStartingLockState_Description)],
    LSTRING(DisplayName),
    [[-1,0,1,2],["str_cfg_envsounds_default", LSTRING(VehicleStartingLockState_AsIs), LSTRING(VehicleStartingLockState_Locked), LSTRING(VehicleStartingLockState_Unlocked)], 0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(vehicleStartingLockState), _this] call EFUNC(common,cbaSettings_settingChanged)}
] call CBA_settings_fnc_init;
