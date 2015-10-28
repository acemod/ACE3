
class CfgVehicles {
    // Static weapons
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1.2,0};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    //remove actions from Taru Pods
    class Pod_Heli_Transport_04_base_F: StaticWeapon {
        GVAR(canCarry) = 0;
        GVAR(canDrag) = 0;
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1.2,0};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 1;
        GVAR(dragPosition[]) = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    // ammo boxes
    class ThingX;
    class ReammoBox_F: ThingX {
        XEH_ENABLED;
        GVAR(canCarry) = 0;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 0;

        GVAR(canDrag) = 0;
        GVAR(dragPosition[]) = {0,1.2,0};
        GVAR(dragDirection) = 0;
    };

    class Slingload_base_F: ReammoBox_F {
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

    // Barrier
    class RoadCone_F: thingX{
        GVAR(canCarry) = 1;
        GVAR(canDrag) = 1;
    };
    
    class ACE_RepairItem_Base: ThingX {};

    class ACE_Track: ACE_RepairItem_Base {
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 0;
    };

    class ACE_Wheel: ACE_RepairItem_Base {
        GVAR(canCarry) = 1;
        GVAR(carryPosition[]) = {0,1,1};
        GVAR(carryDirection) = 0;
    };
};
