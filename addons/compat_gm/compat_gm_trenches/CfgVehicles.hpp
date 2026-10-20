class CfgVehicles {
    class gm_wheeled_truck_base;
    class gm_ural375d_base: gm_wheeled_truck_base {
        class EGVAR(interaction,anims) {
            class tools_unhide {
                phase = 0;
                positions[] = {{0.9, 3.15, -0.5}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class gm_ural375d_mlrs_base: gm_ural375d_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class tools_unhide: tools_unhide {
                positions[] = {{0.9, 3.35, -0.65}};
            };
        };
    };
    class gm_ural375d_medic_base: gm_ural375d_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class tools_unhide: tools_unhide {
                positions[] = {{0.9, 3.35, -0.5}};
            };
        };
    };

    class gm_ural4320_base: gm_wheeled_truck_base {
        class EGVAR(interaction,anims) {
            class tools_unhide {
                phase = 0;
                positions[] = {{0.93, 2.7, -0.5}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class gm_ural44202_base: gm_ural4320_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class tools_unhide: tools_unhide {
                positions[] = {{0.9, 2.6, -0.5}};
            };
        };
    };
};
