class SPE_Mine_Magazine;
class SPE_US_TNT_4pound_mag: SPE_Mine_Magazine {
    EGVAR(explosives,DelayTime) = 1;
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_explosive_4LBTNT";
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

class SPE_US_TNT_half_pound_mag: SPE_Mine_Magazine {
    EGVAR(explosives,DelayTime) = 1;
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_explosive_halfLBTNT";
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

class SPE_US_Bangalore_mag: SPE_Mine_Magazine {
    EGVAR(explosives,DelayTime) = 1;
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_explosive_bangalore";
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

class SPE_Ladung_Small_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,DelayTime) = 1;
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_explosive_smallLadung";
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

class SPE_Ladung_Big_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,DelayTime) = 1;
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_explosive_bigLadung";
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

class SPE_US_M1A1_ATMINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_M1A1at";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.062; //good depth, blows up good
        };
    };
};
class SPE_US_M3_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_M3ap";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.04; //good depth, blows up good
        };
    };
};
class SPE_US_M3_Pressure_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_M3Pressure";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.18; //good depth, blows up good
        };
    };
};

class SPE_Shg24x7_Improvised_Mine_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_Shg24x7";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.13; //good depth, blows up good
        };
    };
};

class SPE_TMI_42_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_TMI42";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.09; //good depth, blows up good
        };
    };
};

class SPE_SMI_35_1_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_SMI35_1";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.1; //poifect
        };
    };
};

class SPE_SMI_35_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_SMI35";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.04; //poifect
        };
    };
};

class SPE_SMI_35_Pressure_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_SMI35Pressure";
    useAction = 0;
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.19; //poifect
        };
    };
};

class SPE_STMI_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_STMI";
    useAction = 0;
        class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.04; //poifect
        };
    };
};

    class SPE_shumine_42_MINE_mag: SPE_Mine_Magazine {
    EGVAR(explosives,Placeable) = 1;
    EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_spe_mine_shumine42";
    useAction = 0;
        class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.03; //poifect
        };
    };
};