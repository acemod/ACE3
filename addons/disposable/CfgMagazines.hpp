class CfgMagazines {
    class NLAW_F;
    class ACE_PreloadedMissileDummy: NLAW_F {  // The dummy magazine
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        displayName = CSTRING(PreloadedMissileDummy);
        picture = QPATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy {
        count = 0;
    };
};
