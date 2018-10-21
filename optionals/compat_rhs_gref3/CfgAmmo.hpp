class CfgAmmo {
    class GrenadeHand;
    class rhsgref_ammo_rkg3em: GrenadeHand { // Scripted shaped charge
        ace_frag_force = 0;
    };
    class BulletBase;
    class rhs_ammo_762x25_Ball: BulletBase {
        ACE_caliber=7.874;
        ACE_bulletLength=13.856;
        ACE_bulletMass=5.5728;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.17};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={360, 380, 400};
        ACE_barrelLengths[]={101.6, 152.4, 228.6};
    };
    class rhs_ammo_792x57_Ball: BulletBase {
        ACE_caliber=8.077;
        ACE_bulletLength=28.651;
        ACE_bulletMass=12.7008;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.315};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={785, 800, 815};
        ACE_barrelLengths[]={508.0, 599.948, 660.4};
    };
};
