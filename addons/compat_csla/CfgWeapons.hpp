class CfgWeapons {
    class CSLA_Launcher_AT;
    class CSLA_Launcher_AA;
    class CSLA_MachinegunBase_7_62;

    class CSLA_RPG7: CSLA_Launcher_AT {
        EGVAR(reloadlaunchers,enabled) = 1;
    };

    class CSLA_9K32: CSLA_Launcher_AA {
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,damage) = 0.5;
        EGVAR(overpressure,range) = 2;
    };

    class CSLA_UK59L: CSLA_MachinegunBase_7_62 {
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,closedBolt) = 0;
    };

    class US85_Launcher_AA;
    class US85_Launcher_AT;
    class US85_MachinegunBase_5_56;
    class US85_MachinegunBase_7_62;

    class US85_M249: US85_MachinegunBase_5_56 {
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,closedBolt) = 0;
    };

    class US85_M60_base: US85_MachinegunBase_7_62 {
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,closedBolt) = 0;
    };

    class US85_FIM92: US85_Launcher_AA {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,damage) = 0.3;
        EGVAR(overpressure,range) = 6;
    };

    class US85_LAW72: US85_Launcher_AT {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.5;
        EGVAR(overpressure,range) = 15;
    };

    class US85_M136: US85_Launcher_AT {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,damage) = 0.3;
        EGVAR(overpressure,range) = 10;
    };

    class US85_MAAWS: US85_Launcher_AT {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 60;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,priority) = 1;
        EGVAR(overpressure,range) = 10;
    };

    class US85_SMAW: US85_Launcher_AT {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 45;
    };
};
