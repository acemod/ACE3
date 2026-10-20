class CfgVehicles {
    class Car_F;
    class CUP_Tigr_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_tools {
                positions[] = {{1.15, -1.5, -0.68}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class CUP_Tigr_STS_PK_Base: CUP_Tigr_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools: hide_tools {};
        };
    };
    class CUP_Tigr_233014_PK_Base: CUP_Tigr_STS_PK_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools: hide_tools {
                positions[] = {{1.15, -1.5, -1}};
            };
        };
    };
    class CUP_Tigr_M_PK_Base: CUP_Tigr_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools: hide_tools {};
        };
    };
    class CUP_Tigr_233114_PK_Base: CUP_Tigr_M_PK_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_tools: hide_tools {
                positions[] = {{1.15, -1.5, -1}};
            };
        };
    };

    // Interaction added to both sides, as the whole vehicle is mirrored if in left/right side
    class CUP_LR_Base: Car_F {
        class EGVAR(interaction,anims) {
            class selection_tool {
                positions[] = {{-0.53, 1.65, -0.2}, {0.53, 1.65, -0.2}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class CUP_LR_MG_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_tool: selection_tool {
                positions[] = {{-0.6, 1.4, 1.4}, {0.45, 1.4, 1.4}};
            };
        };
    };
    class CUP_LR_SPG9_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_tool: selection_tool {};
        };
    };
    class CUP_LR_AA_Base: CUP_LR_SPG9_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_tool: selection_tool {
                positions[] = {{-0.55, 1.77, -0.75}, {0.55, 1.77, -0.75}};
            };
        };
    };
    class CUP_LR_Ambulance_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_tool: selection_tool {
                positions[] = {{-0.55, 2.1, -0.2}, {0.55, 2.1, -0.2}};
            };
        };
    };
    class CUP_LR_Special_Base: CUP_LR_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class selection_tool: selection_tool {
                positions[] = {{-0.6, 1.4, 1.4}, {0.45, 1.4, 1.4}};
            };
        };
    };

    class CUP_ECVHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_front_tool_rack {
                positions[] = {"(_target selectionPosition ['vhc_rear_trunk_door', 'FireGeometry', 'AveragePoint']) vectorAdd [0.37, 4, 0.2]"};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    class Tank_F;
    class CUP_leopard_1A3_base: Tank_F {
        class EGVAR(interaction,anims) {
            class hide_Tools_L {
                positions[] = {{-2.2, 0, 0.2}, {-2.2, -1.8, 0.2}};
                items[] = {"ACE_EntrenchingTool", "ACE_wirecutter"};
                name = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
                text = "$STR_a3_cfgeditorsubcategories_edsubcat_tools0";
            };
            class hide_Tools_R {
                positions[] = {{0.9, -1.5, 0.23}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
};
