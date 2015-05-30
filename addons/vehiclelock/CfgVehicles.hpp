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

    class ACE_Module;
    class ACE_VehicleLock_ModuleSetup: ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_VehicleLock_Module_DisplayName";
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 0;
        icon = QUOTE(PATHTOF(UI\Icon_Module_VehicleLock_ca.paa));
        functionPriority = 0;
        class Arguments {
            class LockVehicleInventory {
                displayName = "$STR_ACE_VehicleLock_LockVehicleInventory_DisplayName";
                description = "$STR_ACE_VehicleLock_LockVehicleInventory_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class VehicleStartingLockState {
                displayName = "$STR_ACE_VehicleLock_VehicleStartingLockState_DisplayName";
                description = "$STR_ACE_VehicleLock_VehicleStartingLockState_Description";
                typeName = "NUMBER";
                class values {
                    class None {name = "$STR_ACE_VehicleLock_VehicleStartingLockState_AsIs"; value = 0; default = 1;};
                    class Side {name = "$STR_ACE_VehicleLock_VehicleStartingLockState_Locked"; value = 1;};
                    class Unique {name = "$STR_ACE_VehicleLock_VehicleStartingLockState_Unlocked"; value = 2;};
                };
            };
            class DefaultLockpickStrength {
                displayName = "$STR_ACE_VehicleLock_DefaultLockpickStrength_DisplayName";
                description = "$STR_ACE_VehicleLock_DefaultLockpickStrength_Description";
                typeName = "NUMBER";
                defaultValue = "10";
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_VehicleLock_Module_Description";
        };
    };

    class ACE_VehicleLock_ModuleSyncedAssign: ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_VehicleLock_VehicleKeyAssign_Module_DisplayName";
        function = QFUNC(moduleSync);
        scope = 2;
        isGlobal = 0;
        icon = QUOTE(PATHTOF(UI\Icon_Module_VehicleKey_ca.paa));
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription {
            description = "$STR_ACE_VehicleLock_VehicleKeyAssign_Module_Description";
            sync[] = {"AnyPlayer", "AnyVehicle"};
        };
    };
};