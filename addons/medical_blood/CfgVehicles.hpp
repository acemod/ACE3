class CfgVehicles {
    class Static;
    class ACE_Blooddrop_1: Static {
        htMin = 60;
        htMax = 1800;
        afMax = 200;
        mfMax = 100;
        mFact = 0;
        tBody = 0;
        simulation = "SeaGull";
        armor = 0;
        timeToLive = 1;
        side = -1;
        shadow = 0;
        scope = 1;
        VehicleClass = "";
        displayName = "";
        model = QPATHTOF(drop_1.p3d);
        accuracy = 0;
        camouflage = 0;
        destrType = "DestructNo";
        /* Simulation Seagull Additions */
        minHeight = 0;
        avgHeight = 0;
        maxHeight = 0;
        minSpeed = 0;
        maxSpeed = 0;
        acceleration = 0;
        turning = 0;
        straightDistance = 0;
        flySound[] = { "", 0.0316228, 1, 1 };
        singSound[] = { "", 0.0316228, 1, 1 };
        canBeShot = 0;
        airFriction2[] = { 25, 12, 2.5 };
        airFriction1[] = { 1500, 700, 100 };
        airFriction0[] = { 40, 20, 60 };
        /* Simulation Seagull Additions */
    };
    class ACE_Blooddrop_2: ACE_Blooddrop_1 {
        model = QPATHTOF(drop_2.p3d);
    };
    class ACE_Blooddrop_3: ACE_Blooddrop_1 {
        model = QPATHTOF(drop_3.p3d);
    };
    class ACE_Blooddrop_4: ACE_Blooddrop_1 {
        model = QPATHTOF(drop_4.p3d);
    };
};
