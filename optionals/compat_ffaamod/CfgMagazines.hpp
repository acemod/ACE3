class CfgMagazines {
    class CA_Magazine;
    class ffaa_556x45_ameli: CA_Magazine {
        ACE_isBelt=1;
    };
    class ffaa_762x51_mg3: CA_Magazine {
        ACE_isBelt=1;
    };
    class ffaa_556x45_mg4: CA_Magazine {
        ACE_isBelt=1;
    };
    class ffaa_mag_c90;
    class ffaa_mag_c100;
    class ACE_PreloadedMissileDummy_C90_FFAA: ffaa_mag_c90 {              // The dummy magazine
        author="$STR_FFAA_AUTOR_FFAAMOD";
        scope=1;
        scopeArsenal=1;
        displayName="Preloaded Missile";
        //displayName="$STR_ACE_Disposable_PreloadedMissileDummy";
        picture=PATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable=0;
    };
    class ACE_UsedTube_C90: ffaa_mag_c90 {
        author="$STR_FFAA_AUTOR_FFAAMOD";
        displayName="$STR_ACE_Disposable_UsedTube";
        descriptionShort="$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort="-";
        count=0;
        weaponPoolAvailable=0;
        modelSpecial="";
        mass=0;
    };
    class ACE_PreloadedMissileDummy_C100_FFAA: ffaa_mag_C100 {              // The dummy magazine
        author="$STR_FFAA_AUTOR_FFAAMOD";
        scope=1;
        scopeArsenal=1;
        displayName="Preloaded Missile";
        //displayName="$STR_ACE_Disposable_PreloadedMissileDummy";
        picture=PATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable=0;
    };
    class ACE_UsedTube_C100: ffaa_mag_C100 {
        author="$STR_FFAA_AUTOR_FFAAMOD";
        displayName="$STR_ACE_Disposable_UsedTube";
        descriptionShort="$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort="-";
        count=0;
        weaponPoolAvailable=0;
        modelSpecial="";
        mass=0;
    };
};
