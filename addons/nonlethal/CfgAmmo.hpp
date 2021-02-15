class CfgAmmo {
    class B_12Gauge_Pellets_Submunition;
    class B_12Gauge_Pellets_Submunition_Deploy;
    class B_12Gauge_Slug;
    class ACE_NonLethal_12Gauge_Rubber_Buck: B_12Gauge_Pellets_Submunition {
        submunitionAmmo = "ACE_NonLethal_12Gauge_Rubber_Buck_Deploy";
        submunitionConeAngle = 0.8;
        submunitionConeType[] = {"random",15};
    };
    class ACE_NonLethal_12Gauge_Rubber_Buck_Deploy: B_12Gauge_Pellets_Submunition_Deploy {
        airFriction = -0.0085;
        caliber = 0.2;
        deflecting = 90;
        deflectionSlowDown = 1;
        hit = 1.0;
        timeToLive = 0.18; //450 m/s
        ACE_damageType = "punch";
        ACE_nonLethalType = "rubber";
    };
    class ACE_NonLethal_12Gauge_M1012: B_12Gauge_Slug { //12 Gauge Non-Lethal rubber slug
        airFriction = -0.0075; //30m max effective range
        caliber = 0.8;
        deflecting = 90;
        deflectionSlowDown = 1;
        hit = 3.0;
        timeToLive = 0.19;
        ACE_damageType = "punch";
        ACE_nonLethalType = "rubber";
    };
    class ACE_NonLethal_12Gauge_XM1116: B_12Gauge_Slug { //12 Gauge Non-Lethal rubber slug
        airFriction = -0.0069; //Longer range than M1012
        caliber = 0.8;
        deflecting = 90;
        deflectionSlowDown = 1;
        hit = 3.0;
        timeToLive = 0.38;
        ACE_damageType = "punch";
        ACE_nonLethalType = "rubber";
    };
    class ACE_NonLethal_12Gauge_XREP_G1: B_12Gauge_Slug {
        airFriction = -0.0084; //20m max effective range
        caliber = 0.2;
        deflecting = 0;
        deflectionSlowDown = 0;
        hit = 2.0;
        timeToLive = 0.55;
        hitarmor[] = {"soundDefault1", 1};
        hitbuilding[] = {"soundDefault1", 1};
        hitconcrete[] = {"soundDefault1", 1};
        hitdefault[] = {"soundDefault1", 1};
        hitfoliage[] = {"soundDefault1", 1};
        hitglass[] = {"soundDefault1", 1};
        hitglassarmored[] = {"soundDefault1", 1};
        hitgroundhard[] = {"soundDefault1", 1};
        hitgroundsoft[] = {"soundDefault1", 1};
        hitiron[] = {"soundDefault1", 1};
        hitman[] = {"soundDefault1", 1};
        hitmetal[] = {"soundDefault1", 1};
        hitmetalplate[] = {"soundDefault1", 1};
        hitplastic[] = {"soundDefault1", 1};
        hitrubber[] = {"soundDefault1", 1};
        hitwood[] = {"soundDefault1", 1};
        sounddefault1[] = {QPATHTOF(sounds\StunGun_01.wss), 4, 1, 75};
        soundHit[] = {QPATHTOF(sounds\StunGun_01.wss), 4, 1, 75};
        ACE_damageType = "punch";
        ACE_nonLethalType = "taser";
    };
    class ACE_NonLethal_12Gauge_XREP_G2: ACE_NonLethal_12Gauge_XREP_G1 {
        airFriction = -0.00805; //20m max effective range
        timeToLive = 0.58;
    };
};
