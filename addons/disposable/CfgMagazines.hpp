class CfgMagazines {
    class NLAW_F;
    class ACE_PreloadedMissileDummy: NLAW_F {  // The dummy magazine
        author = ECSTRING(common,ACETeam);
        scope = 1;
        scopeArsenal = 1;
        displayName = CSTRING(PreloadedMissileDummy);
        picture = "\a3\ui_f\data\IGUI\Cfg\Targeting\Empty_ca.paa";
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy {
        count = 0;
    };
};
