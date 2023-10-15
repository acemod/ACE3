class CfgMagazines {
    class 1Rnd_HE_Grenade_shell;
    class ACE_40mm_Pike: 1Rnd_HE_Grenade_shell {
        displayName = CSTRING(magazine_displayName);
        displayNameShort = CSTRING(magazine_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        picture = QPATHTOF(ui\gear_pike_ca.paa);
        ammo = QGVAR(ammo_gl);
        count = 1;
        // model = QPATHTOF(models\ace_pike_ammo.p3d); // kinda ugly, just use pouch thing
        initSpeed = 50;
        mass = 17; // ~1.7 Pounds
        author = ECSTRING(common,ACETeam);
    };
};
