class CfgVehicles {
    // Vehicle animation interactions
    // Easier to not inherit
    class Offroad_01_base_lxWS;
    class Offroad_01_armor_base_lxWS: Offroad_01_base_lxWS {
        class EGVAR(interaction,anims) {
            class HideBackpacks {
                positions[] = {{-1.15, -1.17, -0.66}, {1.05, -1.17, -0.66}, {1.05, -2.52, -0.66}};
                items[] = {"B_TacticalPack_blk", "B_TacticalPack_blk", "B_Carryall_khk", "B_Carryall_khk"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };

    class Offroad_01_AT_lxWS;
    class Offroad_01_armor_AT_lxWS: Offroad_01_AT_lxWS {
        class EGVAR(interaction,anims) {
            class HideBackpacks {
                positions[] = {{-1.15, -1.27, -0.66}, {1.05, -1.27, -0.66}, {1.05, -2.62, -0.66}};
                items[] = {"B_TacticalPack_blk", "B_TacticalPack_blk", "B_Carryall_khk", "B_Carryall_khk"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };
};
