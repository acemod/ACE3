class CfgAmmo {
    class MissileBase;
    class CUP_M_47_AT_EP1: MissileBase {
        thrust = 0;
		initTime = 0;
		thrustTime = 0;
		sideAirFriction = 0.5;
        effectsMissile = "";
        effectFlare = "";
        airFriction = 0.5;
        irLock = 0;
		manualControl = 0;
		deflecting = 0;
		fuseDistance = 5;
		whistleDist = 2;
        timeToLive = 20;
        lockType = 0;
        
        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0;          // Minium flap deflection for guidance
            maxDeflection = 0;          // Maximum flap deflection for guidance
            incDeflection = 0;          // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };
            
            onFired = QACEFUNC(hot,onFired);
            
            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 15;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 1000;      // Range from the missile which the seeker can visually search
            
            correctionDistance = 15; // distance from center of crosshair where missile sits. If the missile leaves this the missile will ground itself
            missileLeadDistance = 0; // distance ahead of the missile where the SACLOS system will project to
            offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.
            
            // Attack profile type selection
            defaultAttackProfile = "DRAGON";
            attackProfiles[] = {"DRAGON"};
        };
    };
}