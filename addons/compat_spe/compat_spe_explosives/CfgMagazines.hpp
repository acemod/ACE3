class CfgMagazines {
    class SPE_Mine_Magazine;
    class SPE_US_TNT_4pound_mag: SPE_Mine_Magazine {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(4LBTNT);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "FireCord", "LIB_LadungPM"};
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

    class SPE_US_TNT_half_pound_mag: SPE_Mine_Magazine {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(halfLBTNT);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "FireCord", "LIB_LadungPM"};
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

    class SPE_US_Bangalore_mag: SPE_Mine_Magazine {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(bangalore);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "FireCord", "LIB_LadungPM"};
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

    class SPE_Ladung_Small_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(smallLadung);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter",  "FireCord", "LIB_LadungPM"};
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

    class SPE_Ladung_Big_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(bigLadung);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter",  "FireCord", "LIB_LadungPM"};
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

    class SPE_US_M1A1_ATMINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(M1A1at);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.062;
            };
        };
    };
    class SPE_US_M3_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(M3ap);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.04;
            };
        };
    };
    class SPE_US_M3_Pressure_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(M3Pressure);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.18;
            };
        };
    };

    class SPE_Shg24x7_Improvised_Mine_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(Shg24x7);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.13;
            };
        };
    };

    class SPE_TMI_42_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(TMI42);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.09;
            };
        };
    };

    class SPE_SMI_35_1_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(SMI35_1);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.1;
            };
        };
    };

    class SPE_SMI_35_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(SMI35);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.04;
            };
        };
    };

    class SPE_SMI_35_Pressure_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(SMI35Pressure);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.19;
            };
        };
    };

    class SPE_STMI_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(STMI);
        useAction = 0;
            class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.04;
            };
        };
    };

        class SPE_shumine_42_MINE_mag: SPE_Mine_Magazine {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = QEXPLOSIVES_PLACE(shumine42);
        useAction = 0;
            class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };
};
