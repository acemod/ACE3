#define MACRO_LOCK_ACTIONS \
    class ACE_SelfActions { \
        class ACE_unlockVehicle { \
            displayName = CSTRING(Action_UnLock); \
            condition = QUOTE(([ARR_2(_player,_target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(2,3)]}); \
            statement = QUOTE([ARR_3(QUOTE(QGVAR(setVehicleLock)),[ARR_2(_target,false)],[_target])] call CBA_fnc_targetEvent); \
            icon = QPATHTOF(ui\key_menuIcon_ca.paa); \
        }; \
        class ACE_lockVehicle { \
            displayName = CSTRING(Action_Lock); \
            condition = QUOTE(([ARR_2(_player,_target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(0,1)]}); \
            statement = QUOTE([ARR_3(QUOTE(QGVAR(setVehicleLock)),[ARR_2(_target,true)],[_target])] call CBA_fnc_targetEvent); \
            icon = QPATHTOF(ui\key_menuIcon_ca.paa); \
        }; \
        class ACE_lockpickVehicle { \
            displayName = CSTRING(Action_Lockpick); \
            condition = QUOTE([ARR_3(_player,_target,'canLockpick')] call FUNC(lockpick)); \
            statement = QUOTE([ARR_3(_player,_target,'startLockpick')] call FUNC(lockpick)); \
        }; \
    }; \
    class ACE_Actions { \
        class ACE_MainActions { \
            class ACE_unlockVehicle { \
                displayName = CSTRING(Action_UnLock); \
                distance = 4; \
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(2,3)]}); \
                statement = QUOTE([ARR_3(QUOTE(QGVAR(setVehicleLock)),[ARR_2(_target,false)],[_target])] call CBA_fnc_targetEvent); \
                exceptions[] = {"isNotSwimming"}; \
                icon = QPATHTOF(ui\key_menuIcon_ca.paa); \
            }; \
            class ACE_lockVehicle { \
                displayName = CSTRING(Action_Lock); \
                distance = 4; \
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(hasKeyForVehicle)) && {(locked _target) in [ARR_2(0,1)]}); \
                statement = QUOTE([ARR_3(QUOTE(QGVAR(setVehicleLock)),[ARR_2(_target,true)],[_target])] call CBA_fnc_targetEvent); \
                exceptions[] = {"isNotSwimming"}; \
                icon = QPATHTOF(ui\key_menuIcon_ca.paa); \
            }; \
            class ACE_lockpickVehicle { \
                displayName = CSTRING(Action_Lockpick); \
                distance = 4; \
                condition = QUOTE([ARR_3(_player,_target,'canLockpick')] call FUNC(lockpick)); \
                statement = QUOTE([ARR_3(_player,_target,'startLockpick')] call FUNC(lockpick)); \
                exceptions[] = {"isNotSwimming"}; \
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
    class Plane: Air {
        MACRO_LOCK_ACTIONS
    };
    class Motorcycle: LandVehicle {
        MACRO_LOCK_ACTIONS
    };
    class Ship;
    class Ship_F: Ship {
        MACRO_LOCK_ACTIONS
    };

    class Logic;
    class Module_F: Logic {
        class ModuleDescription;
    };
    class ACE_Module: Module_F {};
    class ACE_VehicleLock_ModuleSetup: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(ui\Icon_Module_VehicleLock_ca.paa);
        functionPriority = 0;
        class Arguments {
            class LockVehicleInventory {
                displayName = CSTRING(LockVehicleInventory_DisplayName);
                description = CSTRING(LockVehicleInventory_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class VehicleStartingLockState {
                displayName = CSTRING(VehicleStartingLockState_DisplayName);
                description = CSTRING(VehicleStartingLockState_Description);
                typeName = "NUMBER";
                class values {
                    class None {name = CSTRING(VehicleStartingLockState_AsIs); value = 0; default = 1;};
                    class Side {name = CSTRING(VehicleStartingLockState_Locked); value = 1;};
                    class Unique {name = CSTRING(VehicleStartingLockState_Unlocked); value = 2;};
                };
            };
            class DefaultLockpickStrength {
                displayName = CSTRING(DefaultLockpickStrength_DisplayName);
                description = CSTRING(DefaultLockpickStrength_Description);
                typeName = "NUMBER";
                defaultValue = "10";
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class ACE_VehicleLock_ModuleSyncedAssign: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(VehicleKeyAssign_Module_DisplayName);
        function = QFUNC(moduleSync);
        scope = 2;
        isGlobal = 0;
        icon = QPATHTOF(ui\Icon_Module_VehicleKey_ca.paa);
        functionPriority = 0;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = CSTRING(VehicleKeyAssign_Module_Description);
            sync[] = {"AnyPlayer", "AnyVehicle"};
        };
    };
};
