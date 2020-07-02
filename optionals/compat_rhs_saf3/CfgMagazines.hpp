class CfgMagazines {

    // ACE Explosives
    class ATMine_Range_Mag;
    class rhssaf_mine_mrud_a_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_mrud_a";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
        };
    };

    class rhssaf_mine_mrud_b_mag: rhssaf_mine_mrud_a_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_mrud_b";
    };

    class rhssaf_mine_mrud_c_mag: rhssaf_mine_mrud_a_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_mrud_c";
    };

    class rhssaf_mine_mrud_d_mag: rhssaf_mine_mrud_a_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_mrud_d";
        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "MK16_Transmitter"};
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
        };
    };

    class rhssaf_mine_pma3_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_pma3";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.026;
            };
        };
    };

    class rhssaf_mine_tma4_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_mine_tma4";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.05;
            };
        };
    };

    class CA_Magazine;
    class rhssaf_tm100_mag: CA_Magazine {
        ace_explosives_DelayTime = 1;
        ace_explosives_Placeable = 1;
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_tm100";
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
        };
    };

    class rhssaf_tm200_mag: rhssaf_tm100_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_tm200";
    };

    class rhssaf_tm500_mag: rhssaf_tm100_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhssaf_tm500";
    };
};
