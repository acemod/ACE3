class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleName);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_UI_ca.paa));
        class Arguments {
            class allowSelectiveUI {
                displayName = CSTRING(AllowSelectiveUI);
                description = CSTRING(AllowSelectiveUI_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // BASIC
            class soldierVehicleWeaponInfo {
                displayName = CSTRING(SoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleRadar {
                displayName = CSTRING(VehicleRadar);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleCompass {
                displayName = CSTRING(VehicleCompass);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class commandMenu {
                displayName = CSTRING(CommandMenu);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class groupBar {
                displayName = CSTRING(GroupBar);
                typeName = "BOOL";
                defaultValue = 0;
            };

            // ADVANCED
            // Soldier
            class weaponName {
                displayName = CSTRING(WeaponName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponNameBackground {
                displayName = CSTRING(WeaponNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class firingMode {
                displayName = CSTRING(FiringMode);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ammoType {
                displayName = CSTRING(AmmoType);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ammoCount {
                displayName = CSTRING(AmmoCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class magCount {
                displayName = CSTRING(MagCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class throwableName {
                displayName = CSTRING(throwableName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class throwableCount {
                displayName = CSTRING(throwableCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class zeroing {
                displayName = CSTRING(Zeroing);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class weaponLowerInfoBackground {
                displayName = CSTRING(WeaponLowerInfoBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class stance {
                displayName = CSTRING(Stance);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class staminaBar {
                displayName = CSTRING(StaminaBar);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Gunner
            class gunnerWeaponName {
                displayName = CSTRING(GunnerWeaponName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerWeaponNameBackground {
                displayName = CSTRING(GunnerWeaponNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerFiringMode {
                displayName = CSTRING(GunnerFiringMode);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerAmmoType {
                displayName = CSTRING(GunnerAmmoType);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerAmmoCount {
                displayName = CSTRING(GunnerAmmoCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerMagCount {
                displayName = CSTRING(GunnerMagCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerLaunchableName {
                displayName = CSTRING(gunnerLaunchableName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerLaunchableCount {
                displayName = CSTRING(gunnerLaunchableCount);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerZeroing {
                displayName = CSTRING(GunnerZeroing);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class gunnerWeaponLowerInfoBackground {
                displayName = CSTRING(GunnerWeaponLowerInfoBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };

            // Vehicle
            class vehicleName {
                displayName = CSTRING(VehicleName);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleNameBackground {
                displayName = CSTRING(VehicleNameBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleFuelBar {
                displayName = CSTRING(VehicleFuelBar);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleSpeed {
                displayName = CSTRING(VehicleSpeed);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleAltitude {
                displayName = CSTRING(VehicleAltitude);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleDamage {
                displayName = CSTRING(VehicleDamage);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class vehicleInfoBackground {
                displayName = CSTRING(VehicleInfoBackground);
                description = CSTRING(RequiresSoldierVehicleWeaponInfo);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };

// neither syntax of currentZeroing works with FFV seats, always returns 0 or [0, -1] depending on the syntax used
// also currentZeroing for laser rangefinder is borked, just shows the last manually selected range, biki says it will work with the alt syntax in v2.20
#define CHECKZERO_ACTIONS \
class ACE_SelfActions { \
    class GVAR(checkWeaponZeroing) { \
        displayName = CSTRING(checkWeaponZeroing); \
        icon = ""; \
        condition = QUOTE(!GVAR(gunnerZeroing) && {currentMuzzle _player != ''}); \
        statement = QUOTE([_player] call FUNC(checkWeaponZeroing)); \
    }; \
}

    class LandVehicle;
    class Car: LandVehicle {
        CHECKZERO_ACTIONS;
    };
    class Motorcycle: LandVehicle {
        CHECKZERO_ACTIONS;
    };
    class StaticWeapon: LandVehicle {
        CHECKZERO_ACTIONS;
    };
    class Tank: LandVehicle {
        CHECKZERO_ACTIONS;
    };
    class Air;
    class Helicopter: Air {
        CHECKZERO_ACTIONS;
    };
    class Plane: Air {
        CHECKZERO_ACTIONS;
    };
    class Ship;
    class Ship_F: Ship {
        CHECKZERO_ACTIONS;
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(checkWeaponZeroing) {
                    displayName = CSTRING(checkWeaponZeroing);
                    condition = QUOTE(!GVAR(zeroing) && {isNull objectParent player} && {currentMuzzle _player != ''});
                    // don't show action if in vehicle because the return is always either [0, -1] or it returns the zero of the vehicle weapon depending on the syntax used
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE([_player] call FUNC(checkWeaponZeroing));
                    showDisabled = 0;
                    icon = "";
                };
            };
        };
    };
};
