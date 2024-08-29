class CfgMagazines {
    class CA_Magazine;
    class rhsusf_m112_mag: CA_Magazine {
        EGVAR(explosives,placeable) = 1;
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_explosive_m112);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };

    class rhsusf_m112x4_mag: rhsusf_m112_mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_explosive_m112x4);
    };

    class ATMine_Range_Mag;
    class rhs_mine_M19_mag: ATMine_Range_Mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_mine_M19);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.075;
            };
        };
    };

    class rhsusf_mine_m14_mag: ATMine_Range_Mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_mine_m14);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };

    class rhsusf_mine_m49a1_3m_mag: ATMine_Range_Mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_mine_m49a1_3m);
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.125;
            };
        };
    };

    class rhsusf_mine_m49a1_6m_mag: rhsusf_mine_m49a1_3m_mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_mine_m49a1_6m);
    };

    class rhsusf_mine_m49a1_10m_mag: rhsusf_mine_m49a1_3m_mag {
        EGVAR(explosives,setupObject) = QEGVAR(explosives,Place_rhsusf_mine_m49a1_10m);
    };
};
