
class CfgWeapons {

    class LauncherCore;
    class Launcher: LauncherCore {
        GVAR(angle) = 60;
        GVAR(range) = 10;
        GVAR(damage) = 0.7;
    };

    class Launcher_Base_F: Launcher {};

    class launch_Titan_base: Launcher_Base_F {
        GVAR(angle) = 40;
        GVAR(range) = 8;
        GVAR(damage) = 0.5;
    };

    class launch_Titan_short_base: launch_Titan_base {
        // Titan is a soft-launch launcher
        GVAR(angle) = 30;
        GVAR(range) = 2;
        GVAR(damage) = 0.5;
    };

    class launch_NLAW_F: Launcher_Base_F {
        // NLAW is a soft-launch launcher
        GVAR(angle) = 30;
        GVAR(range) = 2;
        GVAR(damage) = 0.6;
    };

    class launch_RPG32_F: Launcher_Base_F {
        GVAR(angle) = 60;
        GVAR(range) = 15;
        GVAR(damage) = 0.7;
    };

    class CannonCore;
    class cannon_120mm: CannonCore {
        GVAR(angle) = 90;
        GVAR(range) = 50;
        GVAR(damage) = 0.85;
    };

    class mortar_155mm_AMOS: CannonCore {
        GVAR(angle) = 90;
        GVAR(range) = 60;
        GVAR(damage) = 1;
    };
};
