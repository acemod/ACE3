class CfgNonAIVehicles {
    class Bird;
    class ACE_Bloodsplat_1: Bird {
        scope = 1;
        vehicleClass = "";
        displayName = "";
        model = QPATHTOF(splat_1.p3d);
        submerged = 0;
        submergeSpeed = 0;
        timeToLive = 1;
        disappearAtContact = 1;
        maxSpeed = 7000;
        weight = 1;
        gravityFactor = 1;
        canBeShot = 0;
        airFriction2[] = {0,0,0};
        airFriction1[] = {0,0,0};
        airFriction0[] = {0,0,0};
    };
    class ACE_Bloodsplat_2: ACE_Bloodsplat_1 {
        model = QPATHTOF(splat_2.p3d);
    };
};
