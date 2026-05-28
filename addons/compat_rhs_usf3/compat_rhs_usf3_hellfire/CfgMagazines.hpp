class CfgMagazines {
    // 2x ACE Hellfire racks
    class rhs_mag_AGM114K_2;
    class GVAR(pylon_mag_2rnd_hellfire_k): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114K [ACE]";
        descriptionShort = ECSTRING(hellfire,KDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher";
        ammo = "ACE_Hellfire_AGM114K";
    };
    class GVAR(pylon_mag_2rnd_hellfire_n): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114N [ACE]";
        descriptionShort = ECSTRING(hellfire,NDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher_N";
        ammo = "ACE_Hellfire_AGM114N";
    };
    class GVAR(pylon_mag_2rnd_hellfire_l): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114L [ACE]";
        descriptionShort = ECSTRING(hellfire,LDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher_L";
        ammo = "ACE_Hellfire_AGM114L";
    };

    // 4x ACE Hellfire racks that align better on RHS Apaches and Blackhawks than the standard ACE 4x racks
    class rhs_mag_AGM114K_4;
    class GVAR(pylon_mag_4rnd_hellfire_k): rhs_mag_AGM114K_4 {
        displayName = "4x AGM-114K [ACE]";
        descriptionShort = ECSTRING(hellfire,KDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher";
        ammo = "ACE_Hellfire_AGM114K";
    };
    class GVAR(pylon_mag_4rnd_hellfire_n): rhs_mag_AGM114K_4 {
        displayName = "4x AGM-114N [ACE]";
        descriptionShort = ECSTRING(hellfire,NDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher_N";
        ammo = "ACE_Hellfire_AGM114N";
    };
    class GVAR(pylon_mag_4rnd_hellfire_l): rhs_mag_AGM114K_4 {
        displayName = "4x AGM-114L [ACE]";
        descriptionShort = ECSTRING(hellfire,LDescriptionShort);
        pylonWeapon = "ace_hellfire_launcher_L";
        ammo = "ACE_Hellfire_AGM114L";
    };
};
