class CfgWeapons {

    class LauncherCore;
    class Launcher: LauncherCore {
        AGM_Backblast_Angle = 60;
        AGM_Backblast_Range = 10;
        AGM_Backblast_Damage = 0.7;
    };
    class Launcher_Base_F: Launcher {};

    class launch_Titan_base: Launcher_Base_F {
        AGM_Backblast_Angle = 40;
        AGM_Backblast_Range = 8;
        AGM_Backblast_Damage = 0.5;
    };
    class launch_Titan_short_base: launch_Titan_base {
        AGM_Backblast_Angle = 40;
        AGM_Backblast_Range = 8;
        AGM_Backblast_Damage = 0.5;
    };

    class launch_NLAW_F: Launcher_Base_F {
        AGM_Backblast_Angle = 40;
        AGM_Backblast_Range = 5;
        AGM_Backblast_Damage = 0.6;
    };
    class launch_RPG32_F: Launcher_Base_F {
        AGM_Backblast_Angle = 60;
        AGM_Backblast_Range = 15;
        AGM_Backblast_Damage = 0.7;
    };

    class CannonCore;
    class cannon_120mm: CannonCore {
        AGM_DangerZone_Angle = 90;
        AGM_DangerZone_Range = 50;
        AGM_DangerZone_Damage = 0.85;
    };
    class mortar_155mm_AMOS: CannonCore {
        AGM_DangerZone_Angle = 90;
        AGM_DangerZone_Range = 60;
        AGM_DangerZone_Damage = 1;
    };
};
