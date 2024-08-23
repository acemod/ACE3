class CfgVehicles {
    class Truck_01_base_F;
    class rhsusf_fmtv_base: Truck_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {{1, 1.4, 0}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class rhsusf_M1078A1P2_fmtv_usarmy: rhsusf_fmtv_base {};
    class rhsusf_M1078A1P2_B_fmtv_usarmy: rhsusf_M1078A1P2_fmtv_usarmy {};
    class rhsusf_M1078A1P2_B_M2_fmtv_usarmy: rhsusf_M1078A1P2_B_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 1.4, -0.5}};
            };
        };
    };
    class rhsusf_M1078A1R_SOV_M2_D_fmtv_socom: rhsusf_M1078A1P2_B_M2_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 1, -0.5}};
            };
        };
    };
    class rhsusf_M1083A1P2_fmtv_usarmy: rhsusf_M1078A1P2_fmtv_usarmy {};
    class rhsusf_M1083A1P2_B_fmtv_usarmy: rhsusf_M1083A1P2_fmtv_usarmy {};
    class rhsusf_M1083A1P2_B_M2_fmtv_usarmy: rhsusf_M1083A1P2_B_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 1.4, -0.5}};
            };
        };
    };
    class rhsusf_M1084A1P2_fmtv_usarmy: rhsusf_M1083A1P2_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 1.8, 0}};
            };
        };
    };
    class rhsusf_M1084A1P2_B_M2_fmtv_usarmy: rhsusf_M1083A1P2_B_M2_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 1.8, -0.5}};
            };
        };
    };
    class rhsusf_M1085A1P2_B_Medical_fmtv_usarmy: rhsusf_M1083A1P2_B_fmtv_usarmy {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare: hide_spare {
                positions[] = {{1, 6.1, 0}};
            };
        };
    };

    class rhsusf_HEMTT_A4_base: Truck_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
                distance = 2.5;
            };
        };
    };

    class MRAP_01_base_F;
    class rhsusf_m1151_base: MRAP_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    // Don't inherit, as it's easier for the trenches compat
    class rhsusf_M1165A1_GMV_SAG2_base: rhsusf_m1151_base {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel_gmv', 'Geometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class rhsusf_rg33_base: MRAP_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class rhsusf_M1239_base: MRAP_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class rhsusf_MATV_base: MRAP_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_spare {
                positions[] = {"_target selectionPosition ['sparewheel', 'Geometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
};
