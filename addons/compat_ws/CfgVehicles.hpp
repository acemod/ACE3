class CfgVehicles {
    // Vehicle animation interactions
    class Offroad_01_base_lxWS;
    class Offroad_01_armor_base_lxWS: Offroad_01_base_lxWS {
        class EGVAR(interaction,anims) {
            class HideBackpacks {
                positions[] = {{-1.15, -1.15, -0.7}, {1.1, -1.15, -0.7}, {1.1, -2.5, -0.7}};
                items[] = {"B_TacticalPack_blk", "B_TacticalPack_blk", "B_Carryall_khk", "B_Carryall_khk"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };

    class I_G_Offroad_01_AT_F;
    class Offroad_01_AT_lxWS: I_G_Offroad_01_AT_F {
        class EGVAR(interaction,anims) {
            class HideBackpacks {
                positions[] = {{-1.15, -1.25, -0.2}, {1.1, -1.25, -0.2}, {1.1, -2.6, -0.2}};
                items[] = {"B_TacticalPack_blk", "B_TacticalPack_blk", "B_Carryall_khk", "B_Carryall_khk"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };
    class Offroad_01_armor_AT_lxWS: Offroad_01_AT_lxWS {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class HideBackpacks: HideBackpacks {
                positions[] = {{-1.15, -1.25, -0.7}, {1.1, -1.25, -0.7}, {1.1, -2.6, -0.7}};
            };
        };
    };

    class I_G_Offroad_01_armed_F;
    class Offroad_01_armed_lxWS: I_G_Offroad_01_armed_F {
        class EGVAR(interaction,anims) {
            class HideBackpacks {
                positions[] = {{-1.15, -1.03, -0.8}, {1.1, -1.03, -0.8}, {1.1, -2.38, -0.8}};
                items[] = {"B_TacticalPack_blk", "B_TacticalPack_blk", "B_Carryall_khk", "B_Carryall_khk"};
                name = "$STR_a3_cfgvehicleclasses_backpacks0";
                text = "$STR_a3_cfgvehicleclasses_backpacks0";
            };
        };
    };
};
