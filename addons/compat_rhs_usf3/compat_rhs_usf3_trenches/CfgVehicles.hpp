class CfgVehicles {
    class rhsusf_stryker_base;
    class rhsusf_stryker_m1126_base: rhsusf_stryker_base {
        class EGVAR(interaction,anims) {
            class Hide_PioKit {
                positions[] = {{-1, -2.2, -0.5}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class rhsusf_stryker_m1127_base: rhsusf_stryker_m1126_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_PioKit: Hide_PioKit {
                positions[] = {{-0.8, -2.2, -0.5}};
            };
        };
    };

    class rhsusf_stryker_m1126_m2_base: rhsusf_stryker_m1126_base {};
    class rhsusf_stryker_m1132_m2_base: rhsusf_stryker_m1126_m2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_PioKit: Hide_PioKit {
                positions[] = {{-1.3, -3.3, -0.5}};
            };
        };
    };
    class rhsusf_stryker_m1134_base: rhsusf_stryker_m1126_m2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_PioKit: Hide_PioKit {
                positions[] = {{-1, -2.2, -0.8}};
            };
        };
    };

    class rhsusf_m1151_base;
    class rhsusf_M1165A1_GMV_SAG2_base: rhsusf_m1151_base {
        class EGVAR(interaction,anims) {
            class tools_hide {
                positions[] = {{0.365, 1.5, -0.4}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
};
