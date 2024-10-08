class CfgVehicles {
    class Car_F;
    class CUP_Datsun_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hideSpareTire {
                positions[] = {{-0.23, -0.25, -0.8}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class CUP_Datsun_AA_Base: CUP_Datsun_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hideSpareTire: hideSpareTire {
                enabled = 0;
            };
        };
    };

    class CUP_Tigr_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_ReserveWheel {
                positions[] = {{0.57, -2.3, -0.55}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class CUP_Tigr_STS_PK_Base: CUP_Tigr_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_ReserveWheel: hide_ReserveWheel {};
        };
    };
    class CUP_Tigr_233014_PK_Base: CUP_Tigr_STS_PK_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_ReserveWheel: hide_ReserveWheel {
                positions[] = {{0.57, -2.3, -0.85}};
            };
        };
    };
    class CUP_Tigr_M_PK_Base: CUP_Tigr_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_ReserveWheel: hide_ReserveWheel {};
        };
    };
    class CUP_Tigr_233114_PK_Base: CUP_Tigr_M_PK_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_ReserveWheel: hide_ReserveWheel {
                positions[] = {{0.57, -2.3, -0.85}};
            };
        };
    };

    class CUP_LR_Base: Car_F {
        class EGVAR(interaction,anims) {
            class selection_wheelfront {
                positions[] = {"_target selectionPosition ['selection_wheelfront', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
            class selection_wheels {
                positions[] = {
                    "(_target selectionPosition ['selection_wheels', 'ViewGeometry', 'AveragePoint']) vectorAdd [-1.1, 0, 0]",
                    "(_target selectionPosition ['selection_wheels', 'ViewGeometry', 'AveragePoint']) vectorAdd [1.1, 0, 0]"
                };
                items[] = {"ACE_Wheel", "ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class CUP_nHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_spare_wheel {
                positions[] = {"_target selectionPosition ['vhc_spare_wheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    // Don't inherit, as it's easier for the main compat
    class CUP_nM1025_SOV_Base: CUP_nHMMWV_Base {
        class EGVAR(interaction,anims) {
            class hide_spare_wheel {
                positions[] = {"_target selectionPosition ['vhc_spare_wheel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class CUP_RG31_BASE: Car_F {
        class EGVAR(interaction,anims) {
            class left_spare {
                positions[] = {"_target selectionPosition ['left_spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
            class right_spare {
                positions[] = {"_target selectionPosition ['right_spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class CUP_UAZ_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_spare_wheel {
                positions[] = {"_target selectionPosition ['spare_wheel', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class CUP_UAZ_Armed_Base: CUP_UAZ_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {};
        };
    };
    class CUP_UAZ_AA_Base: CUP_UAZ_Armed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.18, -1.8, 0.75}};
            };
        };
    };
    class CUP_UAZ_AGS30_Base: CUP_UAZ_Armed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.18, -1.9, 0.75}};
            };
        };
    };
    class CUP_UAZ_MG_Base: CUP_UAZ_Armed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.18, -1.9, 0.2}};
            };
        };
    };
    // Visual is bugged, but it works
    class CUP_UAZ_METIS_Base: CUP_UAZ_Armed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.18, -1.9, 0.65}};
            };
        };
    };
    class CUP_UAZ_SPG9_Base: CUP_UAZ_Armed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.18, -1.9, 1.05}};
            };
        };
    };

    class CUP_UAZ_Unarmed_Base: CUP_UAZ_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {};
        };
    };
    class CUP_UAZ_Open_Base: CUP_UAZ_Unarmed_Base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_spare_wheel: hide_spare_wheel {
                positions[] = {{0.135, -1.3, 0.7}};
            };
        };
    };

    class CUP_ECVHMMWV_Base: Car_F {
        class EGVAR(interaction,anims) {
            class hide_spare_tire {
                positions[] = {"(_target selectionPosition ['vhc_rear_trunk_door', 'FireGeometry', 'AveragePoint']) vectorAdd [0.05, -0.4, 0.2]"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
            class hide_deploy1 {
                positions[] = {"(_target selectionPosition ['vhc_rear_trunk_door', 'FireGeometry', 'AveragePoint']) vectorAdd [0.05, 0.5, 0.7]"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
};
