
#define MACRO_REARM_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(Rearm) { \
                    displayName = CSTRING(Rearm); \
                    distance = REARM_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canRearm)); \
                    statement = QUOTE(_player call FUNC(rearm)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = QPATHTOF(ui\icon_rearm_interact.paa); \
                }; \
            }; \
        };

#define MACRO_REARM_TRUCK_ACTIONS \
        class ACE_Actions: ACE_Actions { \
            class ACE_MainActions: ACE_MainActions { \
                class GVAR(TakeAmmo) { \
                    displayName = CSTRING(TakeAmmo); \
                    distance = REARM_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canTakeAmmo)); \
                    insertChildren = QUOTE(_target call FUNC(addRearmActions)); \
                    exceptions[] = {"isNotInside"}; \
                    showDisabled = 0; \
                    priority = 2; \
                    icon = QPATHTOF(ui\icon_rearm_interact.paa); \
                }; \
                class GVAR(StoreAmmo) { \
                    displayName = CSTRING(StoreAmmo); \
                    distance = REARM_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canStoreAmmo)); \
                    statement = QUOTE(_this call FUNC(storeAmmo)); \
                    exceptions[] = {"isNotInside"}; \
                    icon = QPATHTOF(ui\icon_rearm_interact.paa); \
                }; \
            }; \
        };

class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class ACE_moduleRearmSettings: ACE_Module {
        scope = 2;
        displayName = CSTRING(RearmSettings_Module_DisplayName);
        icon = QPATHTOF(ui\icon_module_rearm.paa);
        category = "ACE_Logistics";
        function = QFUNC(moduleRearmSettings);
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class level {
                displayName = CSTRING(RearmSettings_level_DisplayName);
                description = CSTRING(RearmSettings_level_Description);
                typeName = "NUMBER";
                class values {
                    class vehicle {
                        name = CSTRING(RearmSettings_vehicle);
                        value = 0;
                    };
                    class magazine {
                        name = CSTRING(RearmSettings_magazine);
                        value = 1;
                    };
                    class caliber  {
                        name = CSTRING(RearmSettings_caliber);
                        value = 2;
                        default = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(RearmSettings_Module_Description);
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_REARM_ACTIONS
    };

    class Tank: LandVehicle {
        MACRO_REARM_ACTIONS
    };

    class StaticWeapon: LandVehicle {
        MACRO_REARM_ACTIONS
    };

    class Air;
    class Helicopter: Air {
        MACRO_REARM_ACTIONS
    };

    class Plane: Air {
        MACRO_REARM_ACTIONS
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_REARM_ACTIONS
    };


    // Ammo Vehicles (with full inheritance for granted ACE_Actions)
    class Car_F: Car {};
    class Truck_F: Car_F {};
    class Tank_F: Tank {};

    class Truck_03_base_F: Truck_F {};
    class O_Truck_03_ammo_F: Truck_03_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class Truck_02_base_F: Truck_F {};
    class Truck_02_Ammo_base_F: Truck_02_base_F {};
    class I_Truck_02_ammo_F: Truck_02_Ammo_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };
    class O_Truck_02_Ammo_F: Truck_02_Ammo_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class Truck_01_base_F: Truck_F {};
    class B_Truck_01_transport_F: Truck_01_base_F {};
    class B_Truck_01_mover_F: B_Truck_01_transport_F {};
    class B_Truck_01_ammo_F: B_Truck_01_mover_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class APC_Tracked_01_base_F: Tank_F {};
    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};
    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class Helicopter_Base_F: Helicopter {};
    class Helicopter_Base_H: Helicopter_Base_F {};
    class Heli_Transport_04_base_F: Helicopter_Base_H {};
    class O_Heli_Transport_04_ammo_F: Heli_Transport_04_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class ThingX;
    class ReammoBox_F: ThingX {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Slingload_base_F: ReammoBox_F {};
    class Slingload_01_Base_F: Slingload_base_F {};

    class Pod_Heli_Transport_04_base_F: Slingload_base_F {};
    class Land_Pod_Heli_Transport_04_ammo_F: Pod_Heli_Transport_04_base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class B_Slingload_01_Ammo_F: Slingload_01_Base_F {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    class NATO_Box_Base: ReammoBox_F{};
    class Box_NATO_AmmoVeh_F: NATO_Box_Base {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };
    class EAST_Box_Base: ReammoBox_F{};
    class Box_East_AmmoVeh_F: EAST_Box_Base {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };
    class IND_Box_Base: ReammoBox_F{};
    class Box_IND_AmmoVeh_F: IND_Box_Base {
        transportAmmo = 0;
        MACRO_REARM_TRUCK_ACTIONS
    };

    // Dummy Vehicles
    class GVAR(defaultCarriedObject): ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        displayName = QGVAR(dummy_obj);
        scope = 1;
        scopeCurator = 1;
        model = "\A3\Weapons_F\AmmoBoxes\AmmoBox_F.p3d";
        EGVAR(cargo,size) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(PickUpAmmo);
                distance = REARM_ACTION_DISTANCE;
                condition = QUOTE(_this call FUNC(canTakeAmmo));
                statement = QUOTE(_this call FUNC(grabAmmo));
                exceptions[] = {"isNotInside"};
                showDisabled = 0;
                priority = 2;
                icon = QPATHTOF(ui\icon_rearm_interact.paa);
            };
        };
    };
    class GVAR(Bo_GBU12_LGB): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F\Ammo\Bomb_01_F.p3d";
    };
    class GVAR(Bo_Mk82): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F\Ammo\Bomb_02_F";
    };
    class GVAR(Bomb_04_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Bomb_04_F.p3d";
    };
    class GVAR(Bomb_03_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Bomb_03_F.p3d";
    };
    class GVAR(Missile_AA_04_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AA_04_F.p3d";
    };
    class GVAR(Missile_AA_03_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AA_03_F.p3d";
    };
    class GVAR(Missile_AGM_02_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_02_F.p3d";
    };
    class GVAR(Missile_AGM_01_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Missile_AGM_01_F.p3d";
    };
    class GVAR(R_230mm_fly): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F\Ammo\Missile_AT_02_F";
    };
    class GVAR(R_230mm_HE): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F\Ammo\Missile_AT_02_F";
    };
    class GVAR(M_PG_AT): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F\Ammo\Rocket_01_F";
    };
    class GVAR(Rocket_04_HE_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_04_HE_F.p3d";
    };
    class GVAR(Rocket_03_HE_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_F.p3d";
    };
    class GVAR(Rocket_04_AP_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_04_AP_F.p3d";
    };
    class GVAR(Rocket_03_AP_F): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_AP_F.p3d";
    };
    // Using wrong model
    class GVAR(R_80mm_HE): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_F.p3d";
    };
    class GVAR(R_60mm_HE): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_F.p3d";
    };
    class GVAR(R_Hydra_HE): GVAR(defaultCarriedObject) {
        model = "\A3\Weapons_F_EPC\Ammo\Rocket_03_HE_F.p3d";
    };
};
