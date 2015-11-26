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

    class Plane_CAS_01_base_F;
    class RHS_A10: Plane_CAS_01_base_F {
        weapons[] = {"Gatling_30mm_Plane_CAS_01_F","rhs_weap_SidewinderLauncher","rhs_weap_agm65","rhs_weap_FFARLauncher","rhs_weap_gbu12","CMFlareLauncher"};
        magazines[] = {"rhs_mag_agm65","rhs_mag_agm65","rhs_mag_Sidewinder_2","rhs_mag_gbu12_4","rhs_mag_ANALQ131","rhs_mag_FFAR_14","1000Rnd_Gatling_30mm_Plane_CAS_01_F","240Rnd_CMFlare_Chaff_Magazine"};
    };
};