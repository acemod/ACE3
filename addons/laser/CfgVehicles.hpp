class CfgVehicles {
    class All;

    class LaserTarget: All {
        // LaserTargets are not visual unless in the visual spectrum
        model = "";
        threat[] = {0,0,0};
    };
    
    // Visual laserTarget override
    class ACE_LaserTarget_Visual : LaserTarget {
        model = "\A3\Weapons_f\laserTgt.p3d";
    };
};