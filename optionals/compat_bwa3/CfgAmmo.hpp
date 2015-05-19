class CfgAmmo
{
	class B_9x21_Ball;
	class B_556x45_Ball_Tracer_Red;
	class B_762x51_Tracer_Red;
	class B_127x99_Ball_Tracer_Red;
	class BWA3_B_556x45_Ball: B_556x45_Ball_Tracer_Red
	{
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.0176;
        ACE_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
        ACE_ballisticCoefficients[]={0.151};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_barrelLengths[]={210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
	};
	class BWA3_B_556x45_Ball_SD: BWA3_B_556x45_Ball
	{
        // Reference?
	};
	class BWA3_B_556x45_Ball_AP: BWA3_B_556x45_Ball
	{
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.5359237;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.310};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820, 865, 880};
        ACE_barrelLengths[]={254.0, 393.7, 508.0};
	};
	class BWA3_B_762x51_Ball: B_762x51_Tracer_Red
	{
        ACE_caliber=7.823;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.4608;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.2};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={700, 800, 820, 833, 845};
        ACE_barrelLengths[]={254.0, 406.4, 508.0, 609.6, 660.4};
	};
	class BWA3_B_762x51_Ball_SD: BWA3_B_762x51_Ball
	{
        ACE_caliber=7.823;
        ACE_bulletLength=34.036;
        ACE_bulletMass=12.96;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.235};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={305, 325, 335, 340};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
	};
	class BWA3_B_762x51_Ball_AP: BWA3_B_762x51_Ball
	{
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=8.22946157;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.359};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={875, 910, 930};
        ACE_barrelLengths[]={330.2, 406.4, 508.0};
	};
	class BWA3_B_762x51_Ball_LR: BWA3_B_762x51_Ball
	{
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=11.34;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.243};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={750, 780, 790, 794};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
	};
	class BWA3_B_127x99_Ball: B_127x99_Ball_Tracer_Red
	{
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9256;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.670};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
	};
	class BWA3_B_127x99_Ball_SD: BWA3_B_127x99_Ball
	{
        // Reference?
	};
	class BWA3_B_127x99_Ball_AP: BWA3_B_127x99_Ball
	{
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9904;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.670};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
	};
	class BWA3_B_46x30_Ball: B_9x21_Ball
	{
        ACE_caliber=4.902;
        ACE_bulletLength=13.005;
        ACE_bulletMass=2.0088;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.1455};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={680, 720, 730, 740};
        ACE_barrelLengths[]={101.6, 177.8, 228.6, 304.8};
	};
	class BWA3_B_46x30_Ball_SD: BWA3_B_46x30_Ball
	{
        // Reference?
	};
};