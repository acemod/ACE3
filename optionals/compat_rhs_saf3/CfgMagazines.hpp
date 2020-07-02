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
};
