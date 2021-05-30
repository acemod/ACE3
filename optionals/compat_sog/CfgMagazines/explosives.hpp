class vn_magazine;

// Claymore (Remote)
class vn_mine_m18_mag: vn_magazine {
    useAction = 0;

    displayNameShort = ""; // Every explosive inherits this and it breaks naming in the placing menu

    EGVAR(Explosives,Placeable) = 1;
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m18);

    class ACE_Triggers {
        SupportedTriggers[] = {"Command", "MK16_Transmitter"};
        class Command {
            digDistance = -0.05;
            fuseTime = 0.5;
        };
        class MK16_Transmitter: Command {};
    };
};
// Claymore (Proximity)
class vn_mine_m18_range_mag: vn_mine_m18_mag {
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = -0.05;
        };
    };
};

// Claymore x3 (Remote)
class vn_mine_m18_x3_mag: vn_mine_m18_mag {
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m18_x3);

    class ACE_Triggers {
        SupportedTriggers[] = {"Command", "MK16_Transmitter"};
        class Command {
            digDistance = 0.02;
            fuseTime = 0.5;
        };
        class MK16_Transmitter: Command {};
    };
};
// Claymore x3 (Proximity)
class vn_mine_m18_x3_range_mag: vn_mine_m18_x3_mag {
    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.02;
        };
    };
};

// Toe-Popper
class vn_mine_m14_mag: vn_mine_m18_mag {
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m14);

    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.001;
        };
    };
};

// Bounding Mine
class vn_mine_m16_mag: vn_mine_m18_mag {
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m16);

    class ACE_Triggers {
        SupportedTriggers[] = {"PressurePlate"};
        class PressurePlate {
            digDistance = 0.02;
        };
    };
};

class vn_mine_tripwire_m16_02_mag: vn_mine_m16_mag {
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m16_tripwire_2m);

    class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.02;
        };
    };
};

class vn_mine_tripwire_m16_04_mag: vn_mine_tripwire_m16_02_mag {
    EGVAR(Explosives,SetupObject) = QEXPLOSIVES_PLACE(m16_tripwire_4m);

    class ACE_Triggers {
        SupportedTriggers[] = {"Tripwire"};
        class Tripwire {
            digDistance = 0.02;
        };
    };
};
