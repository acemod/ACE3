#define MACRO_LOCK_ACTIONS \
    class ACE_SelfActions { \
        class ACE_unlockVehicle { \
            displayName = "$STR_ACE_Vehicle_Action_UnLock"; \
            condition = QUOTE(([ARR_2(_player, _target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(2,3)]}); \
            statement = QUOTE([ARR_3('VehicleLock_SetVehicleLock', [_target], [ARR_2(_target,false)])] call EFUNC(common,targetEvent)); \
            priority = 0.3; \
            icon = QUOTE(PATHTOF(UI\key_menuIcon_ca.paa)); \
        }; \
        class ACE_lockVehicle { \
            displayName = "$STR_ACE_Vehicle_Action_Lock"; \
            condition = QUOTE(([ARR_2(_player, _target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(0,1)]}); \
            statement = QUOTE([ARR_3('VehicleLock_SetVehicleLock', [_target], [ARR_2(_target,true)])] call EFUNC(common,targetEvent)); \
            priority = 0.2; \
            icon = QUOTE(PATHTOF(UI\key_menuIcon_ca.paa)); \
        }; \
        class ACE_lockpickVehicle { \
            displayName = "$STR_ACE_Vehicle_Action_Lockpick"; \
            condition = QUOTE([ARR_3(_player, _target, 'canLockpick')] call FUNC(lockpick)); \
            statement = QUOTE([ARR_3(_player, _target, 'startLockpick')] call FUNC(lockpick)); \
            priority = 0.1; \
        }; \
    }; \
    class ACE_Actions { \
        class ACE_MainActions { \
            class ACE_unlockVehicle { \
                displayName = "$STR_ACE_Vehicle_Action_UnLock"; \
                distance = 4; \
                condition = QUOTE(([ARR_2(_player, _target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(2,3)]}); \
                statement = QUOTE([ARR_3('VehicleLock_SetVehicleLock', [_target], [ARR_2(_target,false)])] call EFUNC(common,targetEvent)); \
                priority = 0.3; \
                icon = QUOTE(PATHTOF(UI\key_menuIcon_ca.paa)); \
            }; \
            class ACE_lockVehicle { \
                displayName = "$STR_ACE_Vehicle_Action_Lock"; \
                distance = 4; \
                condition = QUOTE(([ARR_2(_player, _target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(0,1)]}); \
                statement = QUOTE([ARR_3('VehicleLock_SetVehicleLock', [_target], [ARR_2(_target,true)])] call EFUNC(common,targetEvent)); \
                priority = 0.2; \
                icon = QUOTE(PATHTOF(UI\key_menuIcon_ca.paa)); \
            }; \
            class ACE_lockpickVehicle { \
                displayName = "$STR_ACE_Vehicle_Action_Lockpick"; \
                distance = 4; \
                condition = QUOTE([ARR_3(_player, _target, 'canLockpick')] call FUNC(lockpick)); \
                statement = QUOTE([ARR_3(_player, _target, 'startLockpick')] call FUNC(lockpick)); \
                priority = 0.1; \
            }; \
        }; \
    };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOCK_ACTIONS
    };
    class Tank: LandVehicle {
        MACRO_LOCK_ACTIONS
    };
    class Air;
    class Helicopter: Air {
        MACRO_LOCK_ACTIONS
    };

    class Logic;
    class Module_F: Logic {
        class ModuleDescription {};
    };
    class ACE_VehicleLock_ModuleSetup: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Vehicle Lock Setup";
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 0;
        icon = QUOTE(PATHTOF(UI\Icon_Module_VehicleLock_ca.paa));
        functionPriority = 0;
        class Arguments {
            class LockVehicleInventory {
                displayName = "Lock Vehicle Inventory";
                description = "Locks the inventory of locked vehicles";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class VehicleStartingLockState {
                displayName = "Vehicle Starting Lock State"; // Argument label
                description = "Set lock state for all vehicles (removes ambiguous lock states)"; // Tooltip description
                typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                class values {
                    class None {name = "As Is"; value = 0; default = 1;};
                    class Side {name = "Locked"; value = 1;};
                    class Unique {name = "Unlocked"; value = 2;};
                };
            };
            class DefaultLockpickStrength {
                displayName = "Default Lockpick Strength";
                description = "Default Time to lockpick (in seconds). Default: 10";
                typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                defaultValue = "10"; // Default text filled in the input box
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "Settings for lockpick strength and initial vehicle lock state. Removes ambiguous lock states.<br/>Source: vehiclelock.pbo";
        };
    };

    class ACE_VehicleLock_ModuleSyncedAssign: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Vehicle Key Assign";
        function = QFUNC(moduleSync);
        scope = 2;
        isGlobal = 0;
        icon = QUOTE(PATHTOF(UI\Icon_Module_VehicleKey_ca.paa));
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle. Only valid for objects present at mission start.<br/>Source: vehiclelock.pbo";
            sync[] = {"AnyPlayer", "AnyVehicle"};
        };
    };
};
