class CfgVehicles {
    // Vehicle animation interactions
    class SPE_ArmoredCar_base;
    class SPEX_Humber_LRC_base: SPE_ArmoredCar_base {
        class EGVAR(interaction,anims) {
            class wheel_spare_hide_source {
                positions[] = {"_target selectionPosition ['wheel_spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class SPEX_Humber_MkII_base: SPE_ArmoredCar_base {
        class EGVAR(interaction,anims) {
            class wheel_spare_hide_source {
                positions[] = {"_target selectionPosition ['wheel_spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
    class SPEX_Humber_MkIV_base: SPE_ArmoredCar_base {
        class EGVAR(interaction,anims) {
            class wheel_spare_hide_source {
                positions[] = {"_target selectionPosition ['wheel_spare', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_Wheel"};
                name = ECSTRING(repair,RemoveWheel);
                text = ECSTRING(repair,RemovingWheel);
            };
        };
    };
};
