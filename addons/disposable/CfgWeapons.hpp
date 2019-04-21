class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class launch_NLAW_F: Launcher_Base_F {
        author = "$STR_BWA3_Author";
        scope = 1;
        scopeArsenal = 1;
        baseWeapon = "BWA3_PzF3";

        magazineReloadTime = 0.1;

        class EventHandlers {
            fired = "_this call CBA_fnc_firedDisposable"; // this weapon eventhandler is required!
        };

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = LAUNCHER_MASS;
        };
    };

    class ACE_launch_NLAW_loaded_F: launch_NLAW_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeArsenal = 2;
        baseWeapon = "ACE_launch_NLAW_loaded_F";

        magazines[] = {"CBA_FakeLauncherMagazine"};

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 180; // launcher 100, magazine 80
        };
    };

    class ACE_launch_NLAW_used_F: launch_NLAW_F {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        baseWeapon = "ACE_launch_NLAW_used_F";

        displayName = CSTRING(UsedTube);
        descriptionShort = CSTRING(UsedTubeDescription);
        magazines[] = {"CBA_FakeLauncherMagazine"};
        weaponPoolAvailable = 0;

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = LAUNCHER_MASS;
        };
    };
};
