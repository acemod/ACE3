
class CfgWeapons {

    // Man-Portable launchers, rear-facing backblast

    class LauncherCore;
    class Launcher: LauncherCore {
        GVAR(priority) = 1;
        GVAR(angle) = 60;
        GVAR(range) = 10;
        GVAR(damage) = 0.7;
        GVAR(offset) = 1;
    };

    class Launcher_Base_F: Launcher {};

    class launch_Titan_base: Launcher_Base_F {
        GVAR(priority) = 1;
        GVAR(angle) = 40;
        GVAR(range) = 8;
        GVAR(damage) = 0.5;
        GVAR(offset) = 1;
    };

    class launch_Titan_short_base: launch_Titan_base {
        // Titan is a soft-launch launcher
        GVAR(priority) = 1;
        GVAR(angle) = 30;
        GVAR(range) = 2;
        GVAR(damage) = 0.5;
        GVAR(offset) = 0.85;
    };

    class launch_NLAW_F: Launcher_Base_F {
        // NLAW is a soft-launch launcher
        GVAR(priority) = 1;
        GVAR(angle) = 30;
        GVAR(range) = 2;
        GVAR(damage) = 0.6;
        GVAR(offset) = 1.05;
    };

    class launch_RPG32_F: Launcher_Base_F {
        GVAR(priority) = 1;
        GVAR(angle) = 60;
        GVAR(range) = 15;
        GVAR(damage) = 0.7;
        GVAR(offset) = 1.2;
    };

    class launch_MRAWS_base_F: Launcher_Base_F {
        GVAR(range) = 15;
        GVAR(offset) = 1.05;
    };

    class launch_Vorona_base_F: Launcher_Base_F {
        GVAR(angle) = 50;
        GVAR(offset) = 0.88;
    };

    class launch_RPG7_F: Launcher_Base_F {
        GVAR(angle) = 40;
        GVAR(offset) = 0.9;
    };

    // Vehicle recoilless rifles and missile launchers, rear-facing backblast

    class MissileLauncher: LauncherCore {
        GVAR(priority) = 1;
        GVAR(angle) = 60;
        GVAR(range) = 10;
        GVAR(damage) = 0.7;
        GVAR(offset) = 0.8;
        GVAR(backblast) = 1;
    };

    class missiles_titan;
    class missiles_titan_static: missiles_titan {
        GVAR(angle) = 40;
        GVAR(range) = 8;
        GVAR(damage) = 0.5;
    };

    class missiles_Vorona: MissileLauncher {
        GVAR(angle) = 50;
        GVAR(offset) = 0.5;
    };

    class launcher_SPG9: MissileLauncher {
        GVAR(offset) = 1.25;
    };

    class RocketPods: LauncherCore {
        GVAR(priority) = 1;
        GVAR(angle) = 60;
        GVAR(range) = 10;
        GVAR(damage) = 0.7;
        GVAR(offset) = 0.8;
        GVAR(backblast) = 1;
    };

    class rockets_230mm_GAT: RocketPods {
        GVAR(damage) = 0.85;
        GVAR(offset) = 0.5;
    };

    // Vehicle cannons, forward-facing overpressure

    class CannonCore;
    class cannon_120mm: CannonCore {
        GVAR(priority) = 1;
        GVAR(angle) = 90;
        GVAR(range) = 50;
        GVAR(damage) = 0.85;
    };

    class cannon_125mm: CannonCore {
        GVAR(priority) = 1;
        GVAR(angle) = 90;
        GVAR(range) = 50;
        GVAR(damage) = 0.85;
    };

    class cannon_105mm: CannonCore {
        GVAR(priority) = 1;
        GVAR(angle) = 90;
        GVAR(range) = 50;
        GVAR(damage) = 0.85;
    };

    class mortar_155mm_AMOS: CannonCore {
        GVAR(priority) = 1;
        GVAR(angle) = 90;
        GVAR(range) = 60;
        GVAR(damage) = 1;
    };

    class mortar_82mm: CannonCore {
        GVAR(priority) = 1;
        GVAR(angle) = 80;
        GVAR(range) = 5;
        GVAR(damage) = 0.7;
        GVAR(offset) = 0.6;
    };
};
