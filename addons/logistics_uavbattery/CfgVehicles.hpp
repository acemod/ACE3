class CfgVehicles {
    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    class Helicopter_Base_F: Helicopter {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {};
        };
    };
    class UAV_01_base_F: Helicopter_Base_F {
        fuelCapacity = 19; // Around 30 minutes hovering
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(RefuelUAV) {
                    displayName = CSTRING(Recharge);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canRefuelUAV));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(refuelUAV));
                    icon = QPATHTOF(ui\UAV_battery_ca.paa);
                };
            };
        };
    };
    class UAV_06_base_F: Helicopter_Base_F {
        fuelCapacity = 16; // Around 25 minutes hovering
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(RefuelUAV) {
                    displayName = CSTRING(Recharge);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canRefuelUAV));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(refuelUAV));
                    icon = QPATHTOF(ui\UAV_battery_ca.paa);
                };
            };
        };
    };

    class LandVehicle;
    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class Tank_F: Tank {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {};
        };
    };
    class UGV_02_Base_F: Tank_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(RefuelUAV) {
                    displayName = CSTRING(Recharge);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canRefuelUAV));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(refuelUAV));
                    icon = QPATHTOF(ui\UAV_battery_ca.paa);
                };
            };
        };
    };

    // Misc box content
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_UAVBattery,6);
        };
    };
};
