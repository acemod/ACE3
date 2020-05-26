class CfgMagazines {
    class CA_Magazine;
    class rhsgref_50Rnd_792x57_SmE_drum: CA_Magazine { // drum, but still just a belt
        ACE_isBelt = 1;
    };
    class rhsgref_296Rnd_792x57_SmE_belt: CA_Magazine {
        ACE_isBelt = 1;
    };

    // ACE Explosives
    class APERSMine_Range_Mag;
    class rhs_mine_a200_bz_mag: APERSMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_a200_bz";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.05;
            };
        };
    };

    class rhs_mine_a200_dz35_mag: rhs_mine_a200_bz_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_a200_dz35";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.04;
            };
        };
    };
};
