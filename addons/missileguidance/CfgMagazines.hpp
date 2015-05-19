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
    
    // Hellfires
    class 6Rnd_ACE_Hellfire_AGM114K : 12Rnd_PG_missiles {
        count = 12;
        ammo = "ACE_Hellfire_AGM114K";
        displayName = "6Rnd_ACE_Hellfire_AGM114K";
        displayNameShort = "6Rnd_ACE_Hellfire_AGM114K";
        descriptionShort = "6Rnd_ACE_Hellfire_AGM114K";
        weight = 36;
        
    };
    class 12Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hydra70_DAGR {
        count = 12;
        displayName = "12Rnd_ACE_Hellfire_AGM114K";
        displayNameShort = "12Rnd_ACE_Hellfire_AGM114K";
        descriptionShort = "12Rnd_ACE_Hellfire_AGM114K";
        weight = 72;
    };
    class 24Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hydra70_DAGR {
        count = 24;
        displayName = "24Rnd_ACE_Hellfire_AGM114K";
        displayNameShort = "24Rnd_ACE_Hellfire_AGM114K";
        descriptionShort = "24Rnd_ACE_Hellfire_AGM114K";
        weight = 72;
    };
   
};