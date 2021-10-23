private _category = format ["ACE %1", localize LSTRING(Category)];

[
    QGVAR(allowSelectiveUI), "CHECKBOX",
    [LSTRING(AllowSelectiveUI), LSTRING(AllowSelectiveUI_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(soldierVehicleWeaponInfo), "CHECKBOX",
    LSTRING(SoldierVehicleWeaponInfo),
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleRadar), "CHECKBOX",
    LSTRING(VehicleRadar),
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleCompass), "CHECKBOX",
    LSTRING(VehicleCompass),
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(commandMenu), "CHECKBOX",
    LSTRING(CommandMenu),
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(groupBar), "CHECKBOX",
    LSTRING(GroupBar),
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(weaponName), "CHECKBOX",
    [LSTRING(WeaponName), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(weaponNameBackground), "CHECKBOX",
    [LSTRING(WeaponNameBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(firingMode), "CHECKBOX",
    [LSTRING(FiringMode), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(ammoType), "CHECKBOX",
    [LSTRING(AmmoType), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(ammoCount), "CHECKBOX",
    [LSTRING(AmmoCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    false,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(magCount), "CHECKBOX",
    [LSTRING(MagCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(throwableName), "CHECKBOX",
    [LSTRING(ThrowableName), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(throwableCount), "CHECKBOX",
    [LSTRING(ThrowableCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(zeroing), "CHECKBOX",
    [LSTRING(Zeroing), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(weaponLowerInfoBackground), "CHECKBOX",
    [LSTRING(WeaponLowerInfoBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(stance), "CHECKBOX",
    [LSTRING(Stance), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(staminaBar), "CHECKBOX",
    [LSTRING(StaminaBar), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerWeaponName), "CHECKBOX",
    [LSTRING(GunnerWeaponName), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerWeaponNameBackground), "CHECKBOX",
    [LSTRING(GunnerWeaponNameBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerFiringMode), "CHECKBOX",
    [LSTRING(GunnerFiringMode), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerAmmoType), "CHECKBOX",
    [LSTRING(GunnerAmmoType), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerAmmoCount), "CHECKBOX",
    [LSTRING(GunnerAmmoCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerMagCount), "CHECKBOX",
    [LSTRING(GunnerMagCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerLaunchableName), "CHECKBOX",
    [LSTRING(GunnerLaunchableName), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerLaunchableCount), "CHECKBOX",
    [LSTRING(GunnerLaunchableCount), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerZeroing), "CHECKBOX",
    [LSTRING(GunnerZeroing), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(gunnerWeaponLowerInfoBackground), "CHECKBOX",
    [LSTRING(GunnerWeaponLowerInfoBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleName), "CHECKBOX",
    [LSTRING(VehicleName), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleNameBackground), "CHECKBOX",
    [LSTRING(VehicleNameBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleFuelBar), "CHECKBOX",
    [LSTRING(VehicleFuelBar), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleSpeed), "CHECKBOX",
    [LSTRING(VehicleSpeed), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleAltitude), "CHECKBOX",
    [LSTRING(VehicleAltitude), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleDamage), "CHECKBOX",
    [LSTRING(VehicleDamage), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleInfoBackground), "CHECKBOX",
    [LSTRING(VehicleInfoBackground), LSTRING(RequiresSoldierVehicleWeaponInfo)],
    _category,
    true,
    0
] call CBA_fnc_addSetting;

if (productVersion select 4 == 'Development') then {
    [
        QGVAR(devWatermark),
        "CHECKBOX",
        LSTRING(devWatermark),
        _category,
        true
    ] call CBA_fnc_addSetting;
};

[
    QGVAR(enableSpeedIndicator),
    "CHECKBOX",
    [LSTRING(EnableSpeedIndicator), LSTRING(EnableSpeedIndicator_Description)],
    "ACE " + LLSTRING(Category),
    true,
    true, {
        if (!_this) then {
            private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];
            _speedIndicator ctrlSetText "";
        };
    }
] call CBA_fnc_addSetting;
