class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class launch_NLAW_F: Launcher_Base_F {
        scope = 2;
        scopeArsenal = 2;
        baseWeapon = "launch_NLAW_F";

        magazineWell[] = {}; // remove magwell, so only the fakeMag can be loaded (inherited by used)
        magazines[] = {"CBA_FakeLauncherMagazine"};
        magazineReloadTime = 0.1;
        reloadMagazineSound[] = {"",1,1};

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 180; // launcher 100, magazine 80
        };
    };

    class ACE_launch_NLAW_ready_F: launch_NLAW_F {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        baseWeapon = "launch_NLAW_F";

        magazines[] = {"NLAW_F"};
        magazineWell[] = {"NLAW"}; // restore magwell

        class EventHandlers {
            fired = "_this call CBA_fnc_firedDisposable"; // this weapon eventhandler is required!
        };

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 100;
        };
    };

    class ACE_launch_NLAW_used_F: launch_NLAW_F {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        baseWeapon = "ACE_launch_NLAW_used_F";

        displayName = CSTRING(UsedTube);
        descriptionShort = CSTRING(UsedTubeDescription);
        weaponPoolAvailable = 0;

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 100;
        };
    };
};
