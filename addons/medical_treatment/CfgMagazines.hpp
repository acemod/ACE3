class CfgMagazines {
    class CA_Magazine;
    class ACE_surgicalKit_mag: CA_Magazine {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName= CSTRING(SurgicalKit_Display);
        model = QPATHTOF(data\surgical_kit.p3d);
        picture = QPATHTOF(ui\surgicalKit_ca.paa);
        descriptionShort = CSTRING(SurgicalKit_Desc_Short);
        deleteIfEmpty = 1;
        mass = 15;
    };
};
