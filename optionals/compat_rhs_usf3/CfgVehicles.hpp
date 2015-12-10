class cfgVehicles {
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

    class MBT_01_base_F: Tank_F {};
    class rhsusf_m1a1tank_base: MBT_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1909;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                    class Loader: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };

    class Heli_light_03_base_F;
    class RHS_UH1_Base : Heli_light_03_base_F {
        EGVAR(refuel,fuelCapacity) = 1447;
    };

    class Heli_Transport_01_base_F;
    class RHS_UH60_Base : Heli_Transport_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1360;
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base : Heli_Transport_02_base_F {
        EGVAR(refuel,fuelCapacity) = 3914;
    };

    class Heli_Attack_01_base_F;
    class RHS_AH1Z_base : Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1600;
    };

    class RHS_AH64_base : Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1420;
    };

    class MBT_01_arty_base_F;
    class rhsusf_m109tank_base : MBT_01_arty_base_F {
        EGVAR(refuel,fuelCapacity) = 511;
    };

    class MRAP_01_base_F;
    class rhsusf_hmmwe_base : MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 95;
    };

    class rhsusf_rg33_base : MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 302;
    };

    class Truck_01_base_F;
    class rhsusf_fmtv_base : Truck_01_base_F {
        EGVAR(refuel,fuelCapacity) = 219;
    };

    class APC_Tracked_02_base_F;
    class rhsusf_m113_tank_base : APC_Tracked_02_base_F {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base : APC_Tracked_03_base_F {
        EGVAR(refuel,fuelCapacity) = 746;
    };

    class Plane_CAS_01_base_F;
    class RHS_A10 : Plane_CAS_01_base_F {
        EGVAR(refuel,fuelCapacity) = 6223;
    };

    class Plane_Base_F;
    class RHS_C130J_Base : Plane_Base_F {
        EGVAR(refuel,fuelCapacity) = 25704;
    };
};
