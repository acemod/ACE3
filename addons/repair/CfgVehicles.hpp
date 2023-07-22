#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = CSTRING(Repair); \
                condition = "true"; \
                statement = ""; \
                runOnHover = 1; \
                showDisabled = 0; \
                icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"; \
                distance = 4; \
                exceptions[] = {"isNotSwimming", "isNotOnLadder"}; \
            }; \
        }; \
    };

class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    #include "CfgVehiclesModules.hpp"

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Tank: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Motorcycle: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Air;
    class Helicopter: Air {
        MACRO_REPAIRVEHICLE
    };

    class Plane: Air {
        MACRO_REPAIRVEHICLE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_REPAIRVEHICLE
    };

    class ThingX;
    class ACE_RepairItem_Base: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };
        class ACE_Actions {
            class ACE_MainActions {
                modifierFunction = QUOTE(_this call FUNC(modifyInteraction));
            };
        };

        accuracy = 0.2;
        vehicleClass = "ACE_Logistics_Items";
        editorCategory = "EdCat_Supplies";
        editorSubcategory = QEGVAR(main,subcategory);
    };

    class ACE_Track: ACE_RepairItem_Base {
        EGVAR(cargo,size) = 2;
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,noRename) = 1;
        author = "Hawkins";
        scope = 2;
        model = QPATHTOF(data\ace_track.p3d);
        displayName = CSTRING(SpareTrack);
        icon = "iconObject_2x1";
        mapSize = 0.5;

        // damage handling
        armor = 1000;
        armorStructural = 1;
        minTotalDamageThreshold = 0.01;
        explosionShielding = 1;
        replaceDamagedLimit = 0.9;
        selectionDamage = "mat_track";

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\trailObjects_steel.rvmat),
                QPATHTO_R(data\trailObjects_steel_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel_destruct.rvmat)
            };
        };

        editorPreview = QPATHTOF(data\preview_track.jpg);
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        EGVAR(cargo,noRename) = 1;
        author = "Hawkins";
        scope = 2;
        model = QPATHTOF(data\ace_wheel.p3d);
        displayName = CSTRING(SpareWheel);
        picture = QPATHTOF(ui\tire_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.7;

        // damage handling
        armor = 120;
        armorStructural = 1;
        minTotalDamageThreshold = 0.01;
        explosionShielding = 1;
        replaceDamagedLimit = 0.9;
        selectionDamage = "mat_tyre"; //"mat_rim"

        // necessary because only one "selectionDamage" (== "visual") is allowed for simple damage objects
        // can not take damage individually though, because of limitations of the thingX simulation type
        class HitPoints {
            class HitBody {
                armor = 1;
                material = -1;
                name = "mat_rim";
                visual = "mat_rim";
                passThrough = 1;
                radius = 0.1;
                explosionShielding = 1;
                minimalHit = 1;
            };
        };

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\trailObjects_tyre.rvmat),
                QPATHTO_R(data\trailObjects_tyre_damage.rvmat),
                QPATHTO_R(data\trailObjects_tyre_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel.rvmat),
                QPATHTO_R(data\trailObjects_steel_damage.rvmat),
                QPATHTO_R(data\trailObjects_steel_destruct.rvmat)
            };
        };

        editorPreview = QPATHTOF(data\preview_wheel.jpg);

        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(Patch) {
                    displayName = CSTRING(PatchWheel);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canPatchRemovedWheel));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(patchRemovedWheel));
                    exceptions[] = {"isNotDragging", "isNotCarrying", "isNotOnLadder", "isNotSwimming", "isNotSitting"};
                    icon = QPATHTOF(ui\patch_ca.paa);
                };
            };
        };
    };

    class Helicopter_Base_H;
    class Heli_Transport_04_base_F: Helicopter_Base_H {
        GVAR(hitpointGroups)[] = { {"HitEngine", {"HitEngine1", "HitEngine2"}} };
    };

    class Heli_Transport_02_base_F;
    class I_Heli_Transport_02_F: Heli_Transport_02_base_F {
        GVAR(hitpointPositions)[] = {{"HitVRotor", {-1,-9.4,1.8}}, {"HitHRotor", {0,1.8,1.3}}};
    };

    class Helicopter_Base_F;
    class Heli_light_03_base_F: Helicopter_Base_F {
        GVAR(hitpointPositions)[] = {{"HitVRotor", {-0.5,-5.55,1.2}}, {"HitHRotor", {0,1.8,1.5}}};
    };

    class B_APC_Tracked_01_base_F;
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        GVAR(hitpointPositions)[] = {{"HitTurret", {0,-2,0}}};
    };

    class Car_F: Car {
        class HitPoints;
    };
    class Truck_F: Car_F {
        class HitPoints: HitPoints {
            class HitLBWheel;
            class HitRBWheel;
        };
    };
    class Truck_03_base_F: Truck_F {
        class HitPoints: HitPoints {
            class HitLBWheel: HitLBWheel {
                name = "wheel_1_4_steering"; // return original values back to fix double wheel hitpoint
            };
            class HitRBWheel: HitRBWheel {
                name = "wheel_2_4_steering";
            };
        };
    };

    class Quadbike_01_base_F: Car_F {
        GVAR(hitpointPositions)[] = { {"HitEngine", {0, 0.5, -0.7}}, {"HitFuel", {0, 0, -0.5}} };
    };
    class Hatchback_01_base_F: Car_F {
        GVAR(hitpointPositions)[] = {{"HitBody", {0, 0.7, -0.5}}, {"HitFuel", {0, -1.75, -0.75}}};
    };
};
