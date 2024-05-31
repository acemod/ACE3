[
    QGVAR(defaultLockpickStrength), "SLIDER",
    [LSTRING(DefaultLockpickStrength_DisplayName), LSTRING(DefaultLockpickStrength_Description)],
    LSTRING(DisplayName),
    [-1,60,10,1], // [min, max, default value, trailing decimals (-1 for whole numbers only)]
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(lockVehicleInventory), "CHECKBOX",
    [LSTRING(LockVehicleInventory_DisplayName), LSTRING(LockVehicleInventory_Description)],
    LSTRING(DisplayName),
    false, // default value
    true, // isGlobal
    {[QGVAR(lockVehicleInventory), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleStartingLockState), "LIST",
    [LSTRING(VehicleStartingLockState_DisplayName), LSTRING(VehicleStartingLockState_Description)],
    LSTRING(DisplayName),
    [[-1,0,1,2],[LSTRING(VehicleStartingLockState_AsIs), LSTRING(VehicleStartingLockState_RemoveAmbiguousLockState), LSTRING(VehicleStartingLockState_Locked), LSTRING(VehicleStartingLockState_Unlocked)], 0], // [values, titles, defaultIndex]
    true, // isGlobal
    {[QGVAR(vehicleStartingLockState), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;
