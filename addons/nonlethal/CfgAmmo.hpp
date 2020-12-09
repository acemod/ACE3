class CfgAmmo {
    class B_12Gauge_Slug;
    class ACE_NonLethal_12Gauge_Slug: B_12Gauge_Slug {
        airFriction = -0.01; //30m max effective range
        caliber = 0.2;
        deflecting = 90;
        deflectionSlowDown = 1;
        hit = 2.0;
        ACE_damageType = "punch";
        ACE_nonLethalType = "rubber";
    };
    class ACE_NonLethal_12Gauge_Slug_XREP: ACE_NonLethal_12Gauge_Slug {
        airFriction = -0.02; //20m max effective range
        caliber = 0.2;
        deflecting = 0;
        deflectionSlowDown = 0;
        hit = 0.5;
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
};
