class CfgVehicles {
    class APC_Wheeled_01_base_F;
    class APC_Wheeled_01_atgm_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_atgm_Name);
    };
    class APC_Wheeled_01_command_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_command_Name);
    };
    class APC_Wheeled_01_mortar_base_lxWS: APC_Wheeled_01_base_F {
        displayName = SUBCSTRING(apc_wheeled_01_mortar_Name);
    };

    class Truck_02_base_F;
    class Truck_02_aa_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_aa_Name);
    };
    class Truck_02_cargo_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_cargo_Name);
    };
    class Truck_02_box_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_repair_Name);
    };
    class C_Truck_02_racing_lxWS: Truck_02_box_base_lxWS {
        displayName = SUBCSTRING(truck_02_racing_Name);
    };
    class Truck_02_Ammo_base_lxWS: Truck_02_base_F {
        displayName = SUBCSTRING(truck_02_ammo_Name);
    };

    class Truck_02_cargo_base_lxWS;
    class Truck_02_flatbed_base_lxWS: Truck_02_cargo_base_lxWS {
        displayName = SUBCSTRING(truck_02_flatbed_Name);
    };

    class Heli_Transport_02_base_F;
    class B_UN_Heli_Transport_02_lxWS: Heli_Transport_02_base_F {
        displayName = SUBCSTRING(heli_transport_02_Name);
    };

    class O_APC_Tracked_02_cannon_F;
    class O_APC_Tracked_02_30mm_lxWS: O_APC_Tracked_02_cannon_F {
        displayName = SUBCSTRING(apc_tracked_02_Name);
    };

    class APC_Wheeled_02_base_v2_F;
    class APC_Wheeled_02_hmg_base_lxws: APC_Wheeled_02_base_v2_F {
        displayName = SUBCSTRING(apc_wheeled_02_hmg_Name);
    };
    class APC_Wheeled_02_unarmed_base_lxws: APC_Wheeled_02_base_v2_F {
        displayName = SUBCSTRING(apc_wheeled_02_unarmed_Name);
    };

    class O_Heli_Light_02_dynamicLoadout_F;
    class B_ION_Heli_Light_02_dynamicLoadout_lxWS: O_Heli_Light_02_dynamicLoadout_F {
        displayName = SUBCSTRING(heli_light_02_armed_Name);
    };

    class O_Heli_Light_02_unarmed_F;
    class B_ION_Heli_Light_02_unarmed_lxWS: O_Heli_Light_02_unarmed_F {
        displayName = SUBCSTRING(heli_light_02_unarmed_Name);
    };
};
