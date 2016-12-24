class CfgWeapons {
    class Launcher_Base_F;
    class launch_NLAW_F: Launcher_Base_F {
        ACE_UsedTube = "ACE_launch_NLAW_Used_F";      // The class name of the used tube.
        magazines[] = {"ACE_PreloadedMissileDummy"};  // The dummy magazine
    };
    class ACE_launch_NLAW_Used_F: launch_NLAW_F {   // the used tube should be a sub class of the disposable launcher
        EGVAR(nlaw,enabled) = 0; // disable guidance for the disposabled tube
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(UsedTube);
        descriptionShort = CSTRING(UsedTubeDescription);
        magazines[] = {"ACE_FiredMissileDummy"};  // This will disable the used launcher class from being fired again.
        //picture = "";              @todo
        //model = "";                @todo
        weaponPoolAvailable = 0;
    };
};
