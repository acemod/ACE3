class CfgMagazines {
    class 12Rnd_PG_missiles;

    class 6Rnd_ACE_Hydra70_DAGR : 12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        count = 12;
        displayName = "6 Round DAGR";
        displayNameShort = "6 Round DAGR";
        descriptionShort = "6 Round DAGR";
        weight = 36;

    };
    class 12Rnd_ACE_Hydra70_DAGR : 6Rnd_ACE_Hydra70_DAGR {
        count = 12;
        displayName = "16 Round DAGR";
        displayNameShort = "16 Round DAGR";
        descriptionShort = "16 Round DAGR";
        weight = 72;
    };
    class 24Rnd_ACE_Hydra70_DAGR : 6Rnd_ACE_Hydra70_DAGR {
        count = 24;
        displayName = "24 Round DAGR";
        displayNameShort = "24 Round DAGR";
        descriptionShort = "24 Round DAGR";
        weight = 72;
    };

    class PylonRack_12Rnd_PG_missiles;
    class PylonRack_6Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = "6x DAGR [ACE]";
        count = 6;
        pylonWeapon = QGVAR(dagr);
    };

    class PylonRack_12Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = "12x DAGR [ACE]";
        count = 12;
        pylonWeapon = QGVAR(dagr);
    };

    class PylonRack_24Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = "24x DAGR [ACE]";
        count = 24;
        pylonWeapon = QGVAR(dagr);
    };
};
