class CfgMagazines {
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
