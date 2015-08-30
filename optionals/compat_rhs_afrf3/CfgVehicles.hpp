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
};