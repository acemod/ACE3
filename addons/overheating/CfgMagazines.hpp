class CfgMagazines {
    class CA_Magazine;
    class ACE_SpareBarrel: CA_Magazine {
        descriptionshort = CSTRING(SpareBarrelDescription);
        picture = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
        displayName = "ACE Spare Barrel";   //!!!CANNOT be localized!!!: because it is used as part of the magazineDetail string
        count = 1;
        mass = 40;
        ACE_isUnique = 1;
    };
};
