class CfgMagazines {
    class CUP_M136_M;
    class ACE_PreloadedMissileDummy_CUP: CUP_M136_M {              // The dummy magazine
        author = "$STR_ACE_Common_ACETeam";
        scope = 1;
        scopeArsenal = 1;
        displayName = "$STR_ACE_Disposable_PreloadedMissileDummy";
        picture = PATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy: ACE_PreloadedMissileDummy {
        count = 0;
    };
    class ACE_UsedTube_F: CUP_M136_M {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_Disposable_UsedTube";
        descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort = "-";
        count = 0;
        weaponPoolAvailable = 0;
        modelSpecial = "";
        mass = 0;
    };
};