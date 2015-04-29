
class CfgAmmo
{
    class BulletBase;
    class rhsusf_B_300winmag: BulletBase
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.489;
        ACE_bulletMass=220;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.310};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={847, 867, 877};
        ACE_barrelLengths[]={20, 24, 26};
    };
    class B_556x45_Ball;
    class rhs_ammo_556x45_Mk318_Ball: B_556x45_Ball
    {
        ACE_caliber=0.224;
        ACE_bulletLength=0.906;
        ACE_bulletMass=62;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.307};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={780, 886, 950};
        ACE_barrelLengths[]={10, 15.5, 20};
    };
    class rhs_ammo_556x45_Mk262_Ball: B_556x45_Ball
    {
        ACE_caliber=0.224;
        ACE_bulletLength=0.906;
        ACE_bulletMass=77;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.361};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={624, 816, 832, 838};
        ACE_barrelLengths[]={7.5, 14.5, 18, 20};
    };
    class rhs_ammo_762x51_M80_Ball: BulletBase
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.14;
        ACE_bulletMass=146;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.2};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={700, 800, 820, 833, 845};
        ACE_barrelLengths[]={10, 16, 20, 24, 26};
    };
    class rhs_ammo_762x51_M118_Special_Ball: rhs_ammo_762x51_M80_Ball
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.24;
        ACE_bulletMass=175;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.243};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={750, 780, 790, 794};
        ACE_barrelLengths[]={16, 20, 24, 26};
    };
    class rhs_ammo_762x51_M993_Ball: rhs_ammo_762x51_M80_Ball
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.24;
        ACE_bulletMass=127;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.377};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={875, 910, 930};
        ACE_barrelLengths[]={13, 16, 20};
    };
    class rhs_ammo_45ACP_MHP: BulletBase
    {
        ACE_caliber=0.452;
        ACE_bulletLength=0.68;
        ACE_bulletMass=230;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.195};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={230, 250, 285};
        ACE_barrelLengths[]={4, 5, 9};
    };
};