class CfgVehicles {
    // Vehicle animation interactions
    class SPE_Car_base;
    class SPE_G503_MB_base: SPE_Car_base {
        class EGVAR(interaction,anims) {
            class hide_tools_source {
                positions[] = {{-0.7, 0, -0.9}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class SPE_US_G503_MB_M1919_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_US_G503_MB_M1919_Armoured_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_US_G503_MB_M1919_PATROL_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_US_G503_MB_M2_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_US_G503_MB_M2_Armoured_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_US_G503_MB_M2_PATROL_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };
    class SPE_G503_MB_Ambulance_base: SPE_G503_MB_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools_source: hide_tools_source {
                positions[] = {{-0.7, 0.45, -0.9}};
            };
        };
    };

    class SPE_R200_base: SPE_Car_base {
        class EGVAR(interaction,anims) {
            class hide_shovel_source {
                positions[] = {{0.5, 1.2, -1.05}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    class SPE_Tank_base;
    class SPE_PzKpfwV_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class tools_hide_source {
                positions[] = {{-1.45, 0.7, -0.4}};
                items[] = {"ACE_EntrenchingTool", "ACE_wirecutter"};
                name = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
                text = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
            };
        };
    };

    class SPE_PzKpfwVI_H1_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class tools_hide_source {
                positions[] = {{0, 1, -0.6}, {1.1, 0.1, -0.6}};
                items[] = {"ACE_EntrenchingTool", "ACE_wirecutter"};
                name = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
                text = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
            };
        };
    };

    class SPE_StuG_III_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class hide_tools_left_source {
                positions[] = {{-1.4, -1.4, -0.7}, {-1, -2.2, -0.65}};
                items[] = {"ACE_EntrenchingTool", "ACE_wirecutter"};
                name = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
                text = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
            };
        };
    };

    class SPE_Jagdpanther_G1_base: SPE_Tank_base {
        class EGVAR(interaction,anims) {
            class hide_tools_left_source {
                positions[] = {{-1.4, 0.5, -0.7}};
                items[] = {"ACE_EntrenchingTool", "ACE_wirecutter"};
                name = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
                text = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
            };
        };
    };
};
