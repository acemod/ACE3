class CfgMagazines {
    class 1Rnd_HE_Grenade_shell;
    class ACE_40mm_Pike: 1Rnd_HE_Grenade_shell {
        displayName = CSTRING(magazine_displayName);
        displayNameShort = "Pike SALH";
        descriptionShort = "";
        // picture = QPATHTOF(data\inventory_ca.paa);
        ammo = QGVAR(ammo_gl);
        model = QPATHTOF(models\ace_pike_ammo.p3d);
        initSpeed = 40;
        mass = 10;
    };
};
