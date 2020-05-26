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

    class rhs_mine_glasmine43_hz_mag: APERSMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_glasmine43_hz";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.01;
            };
        };
    };

    class rhs_mine_glasmine43_bz_mag: rhs_mine_glasmine43_hz_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_glasmine43_bz";
    };

    class APERSBoundingMine_Range_Mag;
    class rhs_mine_m2a3b_press_mag: APERSBoundingMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_m2a3b_press";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.185;
            };
        };
    };

    class rhs_mine_m2a3b_trip_mag: rhs_mine_m2a3b_press_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_m2a3b_trip";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.13;
            };
        };
    };

    class rhs_mine_m3_pressure_mag: APERSMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_m3_pressure";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = -0.015;
            };
        };
    };

    class APERSTripMine_Wire_Mag;
    class rhs_mine_M3_tripwire_mag: APERSTripMine_Wire_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_M3_tripwire";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0;
            };
        };
    };

    class ATMine_Range_Mag;
    class rhs_mine_TM43_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_TM43";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.057;
            };
        };
    };

    class rhs_mine_M7A2_mag: APERSMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_M7A2";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.062;
            };
        };
    };

    class rhs_mine_mk2_pressure_mag: APERSMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_mk2_pressure";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0;
            };
        };
    };

    class rhs_mine_Mk2_tripwire_mag: APERSTripMine_Wire_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_Mk2_tripwire";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0;
            };
        };
    };

    class rhs_mine_smine35_press_mag: APERSBoundingMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_smine35_press";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.18;
            };
        };
    };

    class rhs_mine_smine35_trip_mag: rhs_mine_smine35_press_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_smine35_trip";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0;
            };
        };
    };

    class rhs_mine_smine44_trip_mag: APERSBoundingMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_smine44_trip";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0;
            };
        };
    };

    class rhs_mine_smine44_press_mag: rhs_mine_smine44_trip_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_smine44_press";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.175;
            };
        };
    };

    class rhs_mine_stockmine43_2m_mag: APERSTripMine_Wire_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_stockmine43_2m";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.25;
            };
        };
    };

    class rhs_mine_stockmine43_4m_mag: rhs_mine_stockmine43_2m_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_stockmine43_4m";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.25;
            };
        };
    };

    class DemoCharge_Remote_Mag;
    class rhs_charge_M2tet_x2_mag: DemoCharge_Remote_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_charge_M2tet_x2";
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
};
