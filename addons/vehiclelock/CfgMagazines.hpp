class CfgMagazines {
    class CA_Magazine;
    class ACE_key_customKeyMagazine: CA_Magazine {
        picture = QPATHTOF(ui\keyBlack.paa);
        displayName = "ACE Vehicle Key";   //!!!CANNOT be localized!!!: because it is used as part of the magazineDetail string
        descriptionShort = CSTRING(Item_Custom_Description);
        count = 1;
        mass = 0;
        ACE_isUnique = 1;
    };
};
