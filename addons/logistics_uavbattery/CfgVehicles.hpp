class CfgVehicles {
    class Helicopter_Base_F;
    class UAV_01_base_F: Helicopter_Base_F {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(RefuelUAV) {
                    displayName = "$STR_ACE_logistics_uavbattery_Recharge";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player, _target)] call FUNC(canRefuelUAV));
                    statement = QUOTE([ARR_2(_player, _target)] call FUNC(refuelUAV));
                    showDisabled = 0; \
                    priority = 1.245; \
                    icon = QUOTE(PATHTOF(ui\UAV_battery_ca.paa));
                };
            };
        };
    };

    // Misc box content
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class _xx_ACE_UAVBattery {
                count = 6;
                name = "ACE_UAVBattery";
            };
        };
    };
};
