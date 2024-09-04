class CfgVehicles {
    class Wheeled_APC_F;
    class rhs_btr_base: Wheeled_APC_F {
        class EGVAR(interaction,anims) {
            class wheel_1_unhide {
                positions[] = {{-0.8, -1.7, 0}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
            class wheel_2_unhide {
                positions[] = {{0.35, -2.9, -0.1}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class rhs_btr70_vmf: rhs_btr_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class wheel_1_unhide: wheel_1_unhide {
                positions[] = {{-1.2, -2.6, 0.2}};
            };
            class wheel_2_unhide: wheel_2_unhide {
                positions[] = {{-0.3, -3.8, 0}};
            };
        };
    };

    class rhs_btr70_msv: rhs_btr70_vmf {};
    class rhs_btr80_msv: rhs_btr70_msv {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class wheel_1_unhide: wheel_1_unhide {
                positions[] = {{-1, -2.5, 0.6}};
            };
            class wheel_2_unhide: wheel_2_unhide {
                enabled = 0;
            };
        };
    };

    class Truck_F;
    class rhs_truck: Truck_F {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class rhs_gaz66_vmf: rhs_truck {};
    class rhs_gaz66_ammo_base: rhs_gaz66_vmf {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_hide: spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'FireGeometry', 'AveragePoint']"};
            };
        };
    };
    class rhs_gaz66_repair_base: rhs_gaz66_vmf {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_hide: spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'FireGeometry', 'AveragePoint']"};
            };
        };
    };
    class rhs_gaz66_ap2_base: rhs_gaz66_vmf {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class spare_hide: spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'FireGeometry', 'AveragePoint']"};
            };
        };
    };

    class RHS_Ural_BaseTurret: Truck_F {
        class EGVAR(interaction,anims) {
           class spare_hide {
               positions[] = {"_target selectionPosition ['spare', 'ViewGeometry', 'AveragePoint']"};
               items[] = {"ACE_Wheel"};
               name = ECSTRING(repair,RemoveWheel);
               text = ECSTRING(repair,RemovingWheel);
           };
       };
    };

    class rhs_zil131_base: Truck_F {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class rhs_kraz255_base;
    class rhs_kraz255b1_base: rhs_kraz255_base {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class O_Truck_02_covered_F;
    class rhs_kamaz5350: O_Truck_02_covered_F {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class MRAP_02_base_F;
    class rhs_tigr_base: MRAP_02_base_F {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };

    class Offroad_01_base_f;
    class RHS_UAZ_Base: Offroad_01_base_f {
        class EGVAR(interaction,anims) {
            class spare_hide {
                positions[] = {"_target selectionPosition ['spare', 'ViewGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
};
