class CfgVehicles {
    class Car_F;
    class Wheeled_APC_F: Car_F {
        class Turrets {
            class MainTurret;
        };
    };
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class APC_Wheeled_01_atgm_base_lxWS: APC_Wheeled_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"autocannon_40mm_CTWS", "ACE_LMG_coax_MAG58_mem3", "missiles_titan"}; // For realistic MG name
            };
        };
    };
    class APC_Wheeled_01_command_base_lxWS: APC_Wheeled_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"HMG_127_lxWS", "ACE_LMG_coax_MAG58_mem3"}; // For realistic MG name
            };
        };
    };
};
