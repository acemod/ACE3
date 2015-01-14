class CfgWeapons {

    class LauncherCore;
    class Launcher: LauncherCore {
        ACE_Backblast_Angle = 60;
        ACE_Backblast_Range = 10;
        ACE_Backblast_Damage = 0.7;
    };
    class Launcher_Base_F: Launcher {};

    class launch_Titan_base: Launcher_Base_F {
        ACE_Backblast_Angle = 40;
        ACE_Backblast_Range = 8;
        ACE_Backblast_Damage = 0.5;
    };
    class launch_Titan_short_base: launch_Titan_base {
        ACE_Backblast_Angle = 40;
        ACE_Backblast_Range = 8;
        ACE_Backblast_Damage = 0.5;
    };

    class launch_NLAW_F: Launcher_Base_F {
        ACE_Backblast_Angle = 40;
        ACE_Backblast_Range = 5;
        ACE_Backblast_Damage = 0.6;
    };
    class launch_RPG32_F: Launcher_Base_F {
        ACE_Backblast_Angle = 60;
        ACE_Backblast_Range = 15;
        ACE_Backblast_Damage = 0.7;
    };

    class CannonCore;
    class cannon_120mm: CannonCore {
        ACE_DangerZone_Angle = 90;
        ACE_DangerZone_Range = 50;
        ACE_DangerZone_Damage = 0.85;
    };
    class mortar_155mm_AMOS: CannonCore {
        ACE_DangerZone_Angle = 90;
        ACE_DangerZone_Range = 60;
        ACE_DangerZone_Damage = 1;
    };
};
