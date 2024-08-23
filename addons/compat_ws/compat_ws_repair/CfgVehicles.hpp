class CfgVehicles {
    // Vehicle animation interactions
    class Truck_02_base_F;
    class Truck_02_aa_base_lxWS: Truck_02_base_F {
        class EGVAR(interaction,anims) {
            class hideSpareWheel {
                positions[] = {{1, 1.93, -0.85}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class Truck_02_cargo_base_lxWS: Truck_02_base_F {
        class EGVAR(interaction,anims) {
            class hideSpareWheel {
                positions[] = {{1, 1.93, -0.35}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class Truck_02_box_base_lxWS: Truck_02_base_F {
        class EGVAR(interaction,anims) {
            class hideSpareWheel {
                positions[] = {{1, 1.7, -0.35}};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
};
