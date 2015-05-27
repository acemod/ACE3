class CfgMagazines {
    class NLAW_F;
    class ACE_PreloadedMissileDummy: NLAW_F {              // The dummy magazine
        author = "$STR_ACE_Common_ACETeam";
        scope = 1;
        scopeArsenal = 1;
        displayName = CSTRING(PreloadedMissileDummy);
        picture = PATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy {
        count = 0;
    };
    class ACE_UsedTube_F: NLAW_F {
        author = "$STR_ACE_Common_ACETeam";
        displayName = CSTRING(UsedTube);
        descriptionShort = CSTRING(UsedTubeDescription);
        displayNameShort = "-";
        count = 0;
        weaponPoolAvailable = 0;
        modelSpecial = "";
        mass = 0;
    };
};
