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
};
