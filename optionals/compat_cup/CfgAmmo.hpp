class CfgAmmo
{
	class BulletBase;
	class B_762x51_Ball;
	class B_127x99_Ball;
	class CUP_B_545x39_Ball: BulletBase
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
	class CUP_B_545x39_Ball_Tracer_Green: CUP_B_545x39_Ball
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
	class CUP_B_545x39_Ball_Tracer_Red: BulletBase
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
	class CUP_B_545x39_Ball_Tracer_White: BulletBase
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
	class CUP_B_545x39_Ball_Tracer_Yellow: BulletBase
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
	class CUP_B_762x39_Ball: BulletBase
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
	class CUP_B_762x39_Ball_Tracer_Green: BulletBase
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
    class CUP_B_9x18_Ball: BulletBase
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
    class CUP_B_9x18_Ball_Tracer_Green: BulletBase
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
    class CUP_B_9x18_Ball_Tracer_Red: BulletBase
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
    class CUP_B_9x18_Ball_Tracer_Yellow: BulletBase
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
    class CUP_B_9x18_Ball_White_Tracer: BulletBase
    {
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={3.8, 5, 9};
    };
	class CUP_B_9x19_Ball: BulletBase
	{
        ACE_caliber=0.355;
        ACE_bulletLength=0.610;
        ACE_bulletMass=124;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.165};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={340, 370, 400};
        ACE_barrelLengths[]={4, 5, 9};
	};
	class CUP_B_762x51_noTracer: B_762x51_Ball
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
	class CUP_B_303_Ball: BulletBase
	{
        ACE_caliber=0.311;
        ACE_bulletLength=1.227;
        ACE_bulletMass=174;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.499, 0.493, 0.48};
        ACE_velocityBoundaries[]={671, 549};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={748, 761, 765};
        ACE_barrelLengths[]={20, 24, 26};
	};
    class CUP_B_127x107_Ball_Green_Tracer: BulletBase
    {
        ACE_caliber=0.511;
        ACE_bulletLength=2.520;
        ACE_bulletMass=745;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.63};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820};
        ACE_barrelLengths[]={28.7};
    };
    class CUP_B_127x108_Ball_Green_Tracer: BulletBase
    {
        ACE_caliber=0.511;
        ACE_bulletLength=2.520;
        ACE_bulletMass=745;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.63};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820};
        ACE_barrelLengths[]={28.7};
    };
    class CUP_B_762x54_Ball_White_Tracer: BulletBase
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
    class CUP_B_762x54_Ball_Red_Tracer: BulletBase
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
    class CUP_B_762x54_Ball_Green_Tracer: BulletBase
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
    class CUP_B_762x54_Ball_Yellow_Tracer: BulletBase
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
	class CUP_B_9x39_SP5: BulletBase
	{
        ACE_caliber=0.364;
        ACE_bulletLength=1.24;
        ACE_bulletMass=250;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.275};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={280, 300, 320};
        ACE_barrelLengths[]={10, 16.3, 20};
	};
    class CUP_B_762x51_Tracer_Green: BulletBase
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
    class CUP_B_762x51_Tracer_Red: BulletBase
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
    class CUP_B_762x51_Tracer_Yellow: BulletBase
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
    class CUP_B_762x51_Tracer_White: BulletBase
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
	class B_127x107_Ball: BulletBase
	{
        ACE_caliber=0.511;
        ACE_bulletLength=2.520;
        ACE_bulletMass=745;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.63};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820};
        ACE_barrelLengths[]={28.7};
	};
	class CUP_B_9x18_SD: BulletBase
	{
        ACE_caliber=0.365;
        ACE_bulletLength=0.610;
        ACE_bulletMass=92.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 340};
        ACE_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_765x17_Ball: BulletBase
	{
        ACE_caliber=0.3125;
        ACE_bulletLength=0.610;
        ACE_bulletMass=65;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.118};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={282, 300, 320};
        ACE_barrelLengths[]={4, 5, 9};
	};
	class CUP_B_145x115_AP_Green_Tracer: BulletBase
	{
        ACE_caliber=0.586;
        ACE_bulletLength=2.00;
        ACE_bulletMass=1010;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.620};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={1000};
        ACE_barrelLengths[]={53};
	};
	class CUP_B_127x99_Ball_White_Tracer: B_127x99_Ball
	{
        ACE_caliber=0.510;
        ACE_bulletLength=2.310;
        ACE_bulletMass=647;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.670};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={853};
        ACE_barrelLengths[]={29};
	};
	class CUP_B_86x70_Ball_noTracer: BulletBase
	{
        ACE_caliber=0.338;
        ACE_bulletLength=1.70;
        ACE_bulletMass=300;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.381};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={820, 826, 830};
        ACE_barrelLengths[]={24, 26.5, 28};
	};
};