class CfgAmmo {
    class BulletBase;
    class GrenadeHand;
    class ffaa_127x99_he: BulletBase {
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9256;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
        ACE_ballisticCoefficients[]={0.67};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
    };
    class ffaa_127x99_ap: BulletBase {
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9904;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
        ACE_ballisticCoefficients[]={0.67};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
    };
    class ffaa_5x28: BulletBase {
        ACE_caliber=5.7;
        ACE_bulletLength=23.012;
        ACE_bulletMass=15;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
        ACE_ballisticCoefficients[]={0.31};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={280, 300, 320};
        ACE_barrelLengths[]={254.0, 414.02, 508.0};
    };
    class ffaa_granada_m_alhambra: GrenadeHand {
        ace_frag_metal=296;
        ace_frag_charge=180;
        ace_frag_gurney_c=3500;
        ace_frag_gurney_k="1/2";
    };
};
