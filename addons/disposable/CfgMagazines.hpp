class CfgMagazines {
    class CA_LauncherMagazine;
    class ACE_PreloadedMissileDummy_Base: CA_LauncherMagazine {  // The dummy magazine
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        displayName = CSTRING(PreloadedMissileDummy);
        model = "\A3\weapons_f\empty";
        picture = QPATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy_Base {
        ammo = "M_NLAW_AT_F"; // This needs to be set or the player won't hold the launcher on their shoulder.
        count = 0;
    };
    class ACE_PreloadedMissileDummy_NLAW: ACE_PreloadedMissileDummy_Base { // Dummy NLAW magazine.
        ammo = "M_NLAW_AT_F";
        initSpeed = 40;
        maxLeadSpeed = 40;
        mass = 80;
    };
};
