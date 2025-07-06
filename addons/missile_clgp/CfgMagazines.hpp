class CfgMagazines {
    class 32Rnd_155mm_Mo_shells;
    class ace_1rnd_155mm_m712: 32Rnd_155mm_Mo_shells {
        author = ECSTRING(common,ACETeam);
        displayNameMFDFormat = "M712";
        displayNameShort = "M712";
        displayName = "Copperhead";
        ammo = "ace_155mm_m712_launch";
        count = 1;
        GVAR(copperheadInterface) = 1;
        muzzleImpulseFactor[]={0.5,1}; // needed for compat with other mods (cup howitzer goes flying)
    };
    class ace_8rnd_155mm_m712: ace_1rnd_155mm_m712 {
        count = 8;
    };

    class 1Rnd_HE_Grenade_shell;
    class ACE_40mm_Pike: 1Rnd_HE_Grenade_shell {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(pike_magazine_displayName);
        displayNameShort = CSTRING(pike_magazine_displayNameShort);
        descriptionShort = CSTRING(pike_magazine_descriptionShort);
        picture = QPATHTOF(ui\gear_pike_ca.paa);
        ammo = QGVAR(pike_launch);
        count = 1;
        // model = QPATHTOF(data\ace_pike_ammo.p3d); // just use default pouch
        initSpeed = 50;
        mass = 12; // ~1.7 Pounds, but high density
    };
};
