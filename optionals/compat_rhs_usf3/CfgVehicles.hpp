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
};