class Launcher_Base_F;

// LAUNCHER
class SPE_LAUNCHER: Launcher_Base_F {};
class SPE_M1A1_Bazooka: SPE_LAUNCHER {
    EGVAR(reloadlaunchers,enabled) = 1;
    EGVAR(overpressure,angle) = 60;
    EGVAR(overpressure,damage) = 0.7;
    EGVAR(overpressure,priority) = 1;
    EGVAR(overpressure,range) = 10;
};
class SPE_PzFaust_30m: SPE_LAUNCHER {
    EGVAR(overpressure,angle) = 60;
    EGVAR(overpressure,damage) = 0.7;
    EGVAR(overpressure,priority) = 1;
    EGVAR(overpressure,range) = 10;
};
