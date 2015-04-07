class CfgAmmo {
    class MissileBase;

    class M_PG_AT : MissileBase {
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        manualControl = 0;
        timeToLive = 120;
    };
    
    class ACE_Hydra70_DAGR : M_PG_AT {
        displayName = "ACE Hydra-70 DAGR Missile";
		displayNameShort = "$STR_A3_CfgMagazines_24Rnd_PG_missiles_dns";
		descriptionShort = "$STR_A3_CfgMagazines_24Rnd_PG_missiles1";
    };
    
    class ACE_Hellfire_AGM114K : ACE_Hydra70_DAGR {
        displayName = "$STR_A3_CfgMagazines_24Rnd_PG_missiles0";
		displayNameShort = "$STR_A3_CfgMagazines_24Rnd_PG_missiles_dns";
		descriptionShort = "$STR_A3_CfgMagazines_24Rnd_PG_missiles1";
    };
};