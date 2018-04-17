class CfgVehicles {
    class LandVehicle;
    class Tank: LandVehicle {
        class NewTurret;
    };
    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;
                };
            };
        };
    };
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Car_F: Car {
        class ViewPilot;
        class NewTurret;
    };
    class Wheeled_APC_F: Car_F {
        class NewTurret;
        class Turrets {
            class MainTurret: NewTurret
            {
                class ViewOptics;
            };
        };
        class CommanderOptics;
    };
    class Air;
    class Helicopter: Air {
        class Turrets;
    };
    class Helicopter_Base_F: Helicopter {
        class Turrets: Turrets {
            class MainTurret;
        };
    };


    class rhs_bmd_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 300;
    };
    class rhs_bmp1tank_base: Tank_F {
        EGVAR(map,vehicleLightColor)[] = {0,1,0,0.1};
        EGVAR(refuel,fuelCapacity) = 460;
    };
    class rhs_bmp3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 460;
    };
    class rhs_btr_base: Wheeled_APC_F {
        EGVAR(map,vehicleLightColor)[] = {0,0,1,0.1};
        EGVAR(refuel,fuelCapacity) = 300;
    };
    class rhs_a3spruttank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 400;
    };

#define ERA(num) QUOTE(era_##num##_hitpoint)
#define ERA_2_28 ERA(2), ERA(3), ERA(4), ERA(5), ERA(6), ERA(7), ERA(8), ERA(9), ERA(10), ERA(11), ERA(12), ERA(13), ERA(14), ERA(15), ERA(16), ERA(17), ERA(18), ERA(19), ERA(20), ERA(21), ERA(22), ERA(23), ERA(24), ERA(25), ERA(26), ERA(27), ERA(28)
#define ERA_2_31 ERA_2_28, ERA(29), ERA(30), ERA(31)
#define ERA_2_32 ERA_2_31, ERA(32)
#define ERA_2_35 ERA_2_32, ERA(33), ERA(34), ERA(35)
#define ERA_2_36 ERA_2_35, ERA(36)

    class rhs_a3t72tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
    };
    class rhs_t72bb_tv: rhs_a3t72tank_base {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_31}}};
    };
    class rhs_t72bc_tv: rhs_a3t72tank_base {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_32}}};
    };
    class rhs_t72bd_tv: rhs_a3t72tank_base {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_32}}};
    };
    class rhs_tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
    };

    class rhs_infantry_msv_base;
    class rhs_pilot_base: rhs_infantry_msv_base {
        ace_gforcecoef = 0.55;
    };

    class O_Plane_CAS_02_F;
    class RHS_su25_base: O_Plane_CAS_02_F {
        EGVAR(refuel,fuelCapacity) = 3600;
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class EventHandlers;
    };
    class Heli_Light_02_base_F: Helicopter_Base_H {};
    class RHS_Mi8_base: Heli_Light_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 3700;
        EGVAR(fastroping,enabled) = 0;
        class EventHandlers: EventHandlers {
            class RHS_EventHandlers;
        };
    };

    class RHS_Mi8amt_base: RHS_Mi8_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class openDoor;
            class closeDoor_L: openDoor {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class RHS_Mi8_VVS_Base: RHS_Mi8_base {};
    class RHS_Mi8mt_vvs: RHS_Mi8_VVS_Base {};
    class RHS_Mi8mt_Cargo_vvs: RHS_Mi8mt_vvs {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class openDoor_L;
            class closeDoor_L: openDoor_L {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class Heli_Attack_02_base_F: Helicopter_Base_F {};
    class RHS_Ka52_base: Heli_Attack_02_base_F {
        EGVAR(refuel,fuelCapacity) = 1870;
        EGVAR(fastroping,enabled) = 0;
    };

    class RHS_Mi24_base: Heli_Attack_02_base_F {
        EGVAR(map,vehicleLightColor)[] = {1,0,0,0.1};
        EGVAR(refuel,fuelCapacity) = 1851;
        EGVAR(fastroping,enabled) = 0;
    };

    class rhs_t80b: rhs_tank_base {
        EGVAR(refuel,fuelCapacity) = 1100;
    };
    class rhs_t80bv: rhs_t80b {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_28}}};
    };
    class rhs_t80a: rhs_t80bv {};
    class rhs_t80u: rhs_t80a {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_35}}};
    };
    class rhs_t80uk: rhs_t80u {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_36}}};
    };
    class rhs_t80ue1: rhs_t80a {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_36}}};
    };
    class rhs_t80um: rhs_t80u {
        ace_repair_hitpointPositions[] = {{ERA(1), {0,0,0}}};
        ace_repair_hitpointGroups[] = {{ERA(1), {ERA_2_36}}};
    };

    class Truck_F: Car_F {};
    class RHS_Ural_BaseTurret: Truck_F {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class RHS_Ural_Base: RHS_Ural_BaseTurret {};
    class RHS_Ural_MSV_Base: RHS_Ural_Base {};
    class RHS_Ural_Support_MSV_Base_01: RHS_Ural_MSV_Base {};
    class RHS_Ural_Fuel_MSV_01: RHS_Ural_Support_MSV_Base_01 {
        transportFuel = 0;
        EGVAR(refuel,hooks)[] = {{-0.05,-3.6,-0.45}};
        EGVAR(refuel,fuelCargo) = 10000;
    };
    class RHS_Ural_Repair_MSV_01: RHS_Ural_Support_MSV_Base_01 {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class rhs_truck: Truck_F {
        EGVAR(refuel,fuelCapacity) = 210;
    };

    class rhs_gaz66_vmf: rhs_truck {};
    class rhs_gaz66_repair_base: rhs_gaz66_vmf {
        transportRepair = 0;
        EGVAR(repair,canRepair) = 1;
    };

    class rhs_gaz66_ammo_base: rhs_gaz66_vmf {
        transportAmmo = 0;
        ace_rearm_defaultSupply = 1200;
    };

    class MRAP_02_base_F;
    class rhs_tigr_base: MRAP_02_base_F {
        EGVAR(refuel,fuelCapacity) = 138;
    };

    class Offroad_01_base_f;
    class RHS_UAZ_Base: Offroad_01_base_f {
        EGVAR(refuel,fuelCapacity) = 78;
    };

    class APC_Tracked_02_base_F: Tank_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };

    class rhs_zsutank_base: APC_Tracked_02_base_F {
        EGVAR(refuel,fuelCapacity) = 515;
    };

    class rhs_btr60_base: rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 290;
    };
    class rhs_btr70_vmf: rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 350;
    };

    class rhs_btr70_msv: rhs_btr70_vmf {};
    class rhs_btr80_msv: rhs_btr70_msv {
        EGVAR(refuel,fuelCapacity) = 300;
    };

    class rhs_2s3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 830;
    };

    class OTR21_Base: Truck_F {
        EGVAR(refuel,fuelCapacity) = 500;
    };
};
