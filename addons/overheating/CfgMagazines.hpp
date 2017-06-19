class CfgMagazines {
    class CA_Magazine;
    class ACE_SpareBarrel: CA_Magazine {
        displayName = CSTRING(SpareBarrelName);
        author = ECSTRING(common,ACETeam);
        scope = 2; // Allows it to show up in Virtual Arsenal in 1.64
        descriptionshort = CSTRING(SpareBarrelDescription);
        picture = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
        count = 1;
        mass = 60;
        ACE_isUnique = 1;
    };
};
