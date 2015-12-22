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
    class Car;
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
    class rhs_bmd_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 300;
        class Turrets: Turrets {
            class CommanderOptics: NewTurret {
                ace_fcs_Enabled = 0;
            };
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
            };
            class GPMGTurret1: NewTurret {
                ace_fcs_Enabled = 0;
            };
        };
    };
    class rhs_bmp1tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 460;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
            };
            class Com_BMP1: NewTurret {
                ace_fcs_Enabled = 0;
            };
        };
    };
    class rhs_bmp_base: rhs_bmp1tank_base {};
    class rhs_bmp1_vdv: rhs_bmp_base {};
    class rhs_bmp2e_vdv : rhs_bmp1_vdv {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Turrets: Turrets {
                    class CommanderOptics : CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };
    class rhs_bmp3tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 460;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
            class GPMGTurret1: NewTurret {
                ace_fcs_Enabled = 0;
            };
        };
    };
    class rhs_btr_base: Wheeled_APC_F {
        EGVAR(refuel,fuelCapacity) = 300;
        class Turrets: Turrets {
            class MainTurret: MainTurret  {
                ace_fcs_Enabled = 0;
            };
            class CommanderOptics: CommanderOptics {
                ace_fcs_Enabled = 0;
            };
        };
    };
    class rhs_a3spruttank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 400;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics
                    {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
            class GPMGTurret1: NewTurret {
                ace_fcs_Enabled = 0;
            };
        };
    };
    class rhs_a3t72tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                    class CommanderMG: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };
    class rhs_t72bd_tv: rhs_a3t72tank_base {};
    class rhs_t90_tv: rhs_t72bd_tv {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };
    class rhs_tank_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1200;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                    class CommanderMG: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };

    class rhs_infantry_msv_base;
    class rhs_pilot_base : rhs_infantry_msv_base
    {
        ace_gforcecoef = 0.55;
    };

    class O_Plane_CAS_02_F;
    class RHS_su25_base : O_Plane_CAS_02_F {
        EGVAR(refuel,fuelCapacity) = 3600;
    };

    class Heli_Light_02_base_F;
    class RHS_Mi8_base : Heli_Light_02_base_F {
        EGVAR(refuel,fuelCapacity) = 3700;
    };

    class Heli_Attack_02_base_F;
    class RHS_Ka52_base : Heli_Attack_02_base_F {
        EGVAR(refuel,fuelCapacity) = 1870;
    };

    class RHS_Mi24_base : Heli_Attack_02_base_F {
        EGVAR(refuel,fuelCapacity) = 1851;
    };

    class rhs_t80b : rhs_tank_base {
        EGVAR(refuel,fuelCapacity) = 1100;
    };

    class Truck_F;
    class RHS_Ural_BaseTurret : Truck_F {
        EGVAR(refuel,fuelCapacity) = 360;
    };

    class rhs_truck : Truck_F {
        EGVAR(refuel,fuelCapacity) = 210;
    };

    class MRAP_02_base_F;
    class rhs_tigr_base : MRAP_02_base_F {
        EGVAR(refuel,fuelCapacity) = 138;
    };

    class Offroad_01_base_f;
    class RHS_UAZ_Base : Offroad_01_base_f {
        EGVAR(refuel,fuelCapacity) = 78;
    };

    class APC_Tracked_02_base_F;
    class rhs_zsutank_base : APC_Tracked_02_base_F {
        EGVAR(refuel,fuelCapacity) = 515;
    };

    class rhs_btr60_base : rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 290;
    };
    class rhs_btr70_vmf : rhs_btr_base {
        EGVAR(refuel,fuelCapacity) = 350;
    };

    class rhs_btr70_msv : rhs_btr70_vmf {};
    class rhs_btr80_msv : rhs_btr70_msv {
        EGVAR(refuel,fuelCapacity) = 300;
    };

    class rhs_2s3tank_base : Tank_F {
        EGVAR(refuel,fuelCapacity) = 830;
    };

    class OTR21_Base : Truck_F {
        EGVAR(refuel,fuelCapacity) = 500;
    };
};
