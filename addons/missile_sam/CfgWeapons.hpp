class CfgWeapons {
    class weapon_mim145Launcher;
    class GVAR(patriot): weapon_mim145Launcher {
        author = "tcvm";
        displayName = CSTRING(patriot);
        magazines[] = { QGVAR(patriot) };
        weaponLockDelay = 0.5;
    };

    class weapon_rim162Launcher;
    class GVAR(RIM162): weapon_rim162Launcher {
        author = "tcvm";
        displayName = CSTRING(essm);
        magazines[] = { QGVAR(RIM162) };
        weaponLockDelay = 0.5;
    };

    class weapon_s750Launcher;
    class GVAR(s400): weapon_s750Launcher {
        author = "tcvm";
        displayName = CSTRING(s400);
        magazines[] = { QGVAR(s400) };
        weaponLockDelay = 0.5;
    };
};

