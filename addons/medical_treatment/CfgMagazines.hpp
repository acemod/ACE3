class CfgMagazines {
    class CA_Magazine;
    class ACE_painkillers: CA_Magazine {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(painkillers_Display);
        model = "\A3\Structures_F_EPA\Items\Medical\PainKillers_F.p3d";
        picture = QPATHTOF(ui\painkillers_ca.paa);
        descriptionShort = CSTRING(painkillers_Desc_Short);
        descriptionUse = CSTRING(painkillers_Desc_Use);
        ACE_isMedicalItem = 1;
        ACE_asItem = 1;
        count = 10;
        mass = 1;
    };
};
