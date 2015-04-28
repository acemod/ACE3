
class CfgAmmo
{
    class BulletBase;
    class B_556x45_Ball;
    class rhs_B_545x39_Ball: B_556x45_Ball
    {
        ACE_caliber=0.220;
        ACE_bulletLength=0.85;
        ACE_bulletMass=52.9;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.168};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={780, 880, 920};
        ACE_barrelLengths[]={10, 16.3, 20};
    };
    class rhs_B_545x39_Ball_Tracer_Green: rhs_B_545x39_Ball
    {
        ACE_caliber=0.220;
        ACE_bulletLength=0.85;
        ACE_bulletMass=49.8;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.168};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={785, 883, 925};
        ACE_barrelLengths[]={10, 16.3, 20};
    };
    class B_762x51_Ball;
    class rhs_B_762x54_Ball: B_762x51_Ball
    {
        ACE_caliber=0.312;
        ACE_bulletLength=1.14;
        ACE_bulletMass=152;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.4};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={700, 800, 820, 833};
        ACE_barrelLengths[]={16, 20, 24, 26};
    };
    class rhs_B_762x54_Ball_Tracer_Green: B_762x51_Ball
    {
        ACE_caliber=0.312;
        ACE_bulletLength=1.14;
        ACE_bulletMass=149;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.395};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={680, 750, 798, 800};
        ACE_barrelLengths[]={16, 20, 24, 26};
    };
    class rhs_B_762x54_7N1_Ball: rhs_B_762x54_Ball
    {
        ACE_caliber=0.312;
        ACE_bulletLength=1.14;
        ACE_bulletMass=152;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.4};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={700, 800, 820, 833};
        ACE_barrelLengths[]={16, 20, 24, 26};
    };
    class rhs_B_762x39_Ball: B_762x51_Ball
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.14;
        ACE_bulletMass=123;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.275};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={650, 716, 750};
        ACE_barrelLengths[]={10, 16.3, 20};
    };
    class rhs_B_762x39_Tracer: rhs_B_762x39_Ball
    {
        ACE_caliber=0.308;
        ACE_bulletLength=1.14;
        ACE_bulletMass=117;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.275};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={650, 716, 750};
        ACE_barrelLengths[]={10, 16.3, 20};
    };
    class B_9x21_Ball;
    class rhs_B_9x19_7N21: B_9x21_Ball
    {
        ACE_caliber=0.355;
        ACE_bulletLength=0.610;
        ACE_bulletMass=80.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.14};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={445, 460, 480};
        ACE_barrelLengths[]={4, 5, 9};
    };
    class rhs_B_9x18_57N181S: B_9x21_Ball
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
};