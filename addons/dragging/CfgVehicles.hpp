
class CBA_Extended_EventHandlers;

class CfgVehicles {
    // Static weapons
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1.2,0};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 1;
        GVAR(dragPosition)[] = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    class StaticCannon: StaticWeapon {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1.2,0};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 1;
        GVAR(dragPosition)[] = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    // Big 1.70 Autonomous AA Turrets
    class StaticMGWeapon;
    class AAA_System_01_base_F: StaticMGWeapon { // Praetorian 1C (aka Phalanx CIWS)
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };
    class SAM_System_01_base_F: StaticMGWeapon { // Mk49 Spartan
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };
    class SAM_System_02_base_F: StaticMGWeapon { // Mk21 Centurion
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    // ammo boxes
    class ThingX;
    class Items_base_F;
    class ReammoBox_F: ThingX {
        GVAR(canCarry) = 0;
        GVAR(carryPosition)[] = {0,1,1};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 0;
        GVAR(dragPosition)[] = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    class Slingload_base_F: ReammoBox_F {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };
    //remove actions from Taru Pods
    class Pod_Heli_Transport_04_base_F: Slingload_base_F {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    class EAST_Box_Base: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    class IND_Box_Base: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    /*class FIA_Box_Base_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };*/
    class NATO_Box_Base: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    class Box_Syndicate_Ammo_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    class Box_IED_Exp_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    class Box_Syndicate_Wps_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    class Box_Syndicate_WpsLaunch_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };

    class Box_NATO_Equip_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(carryDirection) = 270;
        GVAR(canDrag) = 1;
    };
    class Box_NATO_Uniforms_F: ReammoBox_F {
        GVAR(canCarry) = 1;
        GVAR(carryDirection) = 270;
        GVAR(canDrag) = 1;
    };

    // Remove Larger crate dragging support.
    // Would be better to allow some sort of joint push/drag functionality
    // Requiring 2 units to access the larger crates and attaching them together (a crappy method of doing it)
    // in order to move the bigger ones. Currently simply remove support.
    // I believe these crates are currently broken (hitbox doesn't work or something) in 1.22 (2014-07-04)
    class Box_East_AmmoVeh_F: EAST_Box_Base {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    class Box_NATO_AmmoVeh_F: NATO_Box_Base {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    class Box_IND_AmmoVeh_F: IND_Box_Base {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    //Plastic and metal case
    class PlasticCase_01_base_F: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 270;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };
    class MetalCase_01_base_F: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 270;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    // Barrier
    class RoadCone_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1,1};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 1;
        GVAR(dragPosition)[] = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    class RoadBarrier_F: RoadCone_F {
        GVAR(carryPosition)[] = {0,1,0.300671};
    };

    // Misc crates
    class Constructions_base_F;
    class Land_WoodenBox_F: Constructions_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 270;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.4,0};
        GVAR(dragDirection) = 0;
    };
    class Land_WoodenCrate_01_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 270;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.5,0};
        GVAR(dragDirection) = 90;
    };

    class ACE_RepairItem_Base: ThingX {};

    class ACE_Track: ACE_RepairItem_Base {
        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1,1};
        GVAR(carryDirection) = 0;
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1,1};
        GVAR(carryDirection) = 0;
    };

    class Lamps_base_F;
    class Land_PortableLight_single_F: Lamps_base_F {
        GVAR(canCarry) = 1;
        GVAR(carryPosition)[] = {0,1.2,0};
        GVAR(carryDirection) = 180;

        GVAR(canDrag) = 1;
        GVAR(dragPosition)[] = {0,1.2,0};
        GVAR(dragDirection) = 180;
    };
};
