class CfgVehicles {
    class rhsusf_stryker_base;
    class rhsusf_stryker_m1126_base: rhsusf_stryker_base {
        class EGVAR(interaction,anims) {
            class Hide_FCans {
                positions[] = {{-0.7, -3, -0.4}};
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
    class rhsusf_stryker_m1127_base: rhsusf_stryker_m1126_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_FCans: Hide_FCans {
                positions[] = {{-0.5, -3, -0.4}};
            };
        };
    };

    class rhsusf_stryker_m1126_m2_base: rhsusf_stryker_m1126_base {};
    class rhsusf_stryker_m1132_m2_base: rhsusf_stryker_m1126_m2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_FCans: Hide_FCans {
                positions[] = {{-1, -4, -0.4}};
            };
        };
    };
    class rhsusf_stryker_m1134_base: rhsusf_stryker_m1126_m2_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class Hide_FCans: Hide_FCans {
                positions[] = {{-0.7, -3, -0.7}};
            };
        };
    };

    class rhsusf_m1a2tank_base;
    class rhsusf_m1a2sep2_base: rhsusf_m1a2tank_base {
        class EGVAR(interaction,anims) {
            class fuelcans_hide {
                // Rotate interactions with turret rotation
                positions[] = {
                    "[0.23, -0.6, 0] vectorAdd ([[1.1, -3.6, 0.6], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)",
                    "[0.23, -0.6, 0] vectorAdd ([[-1.1, -3.6, 0.6], [0, 0, 1], deg (_target animationPhase 'MainTurret')] call CBA_fnc_vectRotate3D)"
                };
                items[] = {"Land_CanisterFuel_F", "Land_CanisterFuel_F"};
                name = ECSTRING(refuel,TakeFuelCanister);
                text = ECSTRING(refuel,TakeFuelCanisterAction);
            };
        };
    };
};
