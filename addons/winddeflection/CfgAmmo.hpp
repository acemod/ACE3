class CfgAmmo
{
	class BulletBase;
	class B_556x45_Ball_Tracer_Red;
	class B_762x51_Tracer_Red;
	class B_556x45_Ball
	{
		airFriction=-0.001265;
		hit=8;
		typicalSpeed=750;
		ACE_caliber=0.224;
		ACE_bulletLength=0.906;
		ACE_bulletMass=62;
		ACE_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
		ACE_ballisticCoefficients[]={0.151};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
		ACE_barrelLengths[]={8.3, 9.4, 10.6, 11.8, 13.0, 14.2, 15.4, 16.5, 17.7, 18.9, 20.0, 24.0};
	};
	class ACE_556x45_Ball_Mk262 : B_556x45_Ball
	{
		airFriction=-0.001125;
		caliber=0.6;
		deflecting=18;
		hit=11;
		typicalSpeed=836;
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
	class ACE_556x45_Ball_Mk318 : B_556x45_Ball
	{
		airFriction=-0.001120;
		caliber=0.6;
		deflecting=18;
		hit=9;
		typicalSpeed=886;
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
	class ACE_545x39_Ball_7N6M : B_556x45_Ball
	{
		airFriction=-0.001162;
		caliber=0.5;
		deflecting=18;
		hit=7;
		typicalSpeed=880;
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
	class ACE_545x39_Ball_7T3M : B_556x45_Ball_Tracer_Red
	{
		airFriction=-0.001162;
		caliber=0.5;
		deflecting=18;
		hit=7;
		typicalSpeed=883;
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
	class B_65x39_Caseless
	{
		airFriction=-0.000772;
		typicalSpeed=800;
		ACE_caliber=0.264;
		ACE_bulletLength=1.295;
		ACE_bulletMass=123;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.263};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={760, 788, 800, 805};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class B_762x51_Ball
	{
		airFriction=-0.001035;
		typicalSpeed=833;
		hit=14;
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
	class ACE_762x51_Ball_M118LR : B_762x51_Ball
	{
		airFriction=-0.0008525;
		caliber=1.05;
		hit=16;
		typicalSpeed=790;
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		ACE_velocityBoundaries[]={853, 549, 549, 549};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={750, 780, 790, 794};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class ACE_762x51_Ball_Subsonic : B_762x51_Ball
	{
		airFriction=-0.000535;
		caliber=0.5;
		hit=16;
		typicalSpeed=790;
		ACE_caliber=0.308;
		ACE_bulletLength=1.340;
		ACE_bulletMass=200;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.235};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={305, 325, 335, 340};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class ACE_762x54_Ball_7N14 : B_762x51_Ball
	{
		airFriction=-0.001023;
		caliber=0.95;
		hit=15;
		typicalSpeed=820;
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
	class ACE_762x54_Ball_7T2 : B_762x51_Tracer_Red
	{
		airFriction=-0.001023;
		caliber=0.9;
		hit=15;
		typicalSpeed=800;
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
	class ACE_762x35_Ball : B_762x51_Ball
	{
		airFriction=-0.000821;
		caliber=0.9;
		hit=11;
		typicalSpeed=790;
		ACE_caliber=0.308;
		ACE_bulletLength=1.153;
		ACE_bulletMass=125;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.349, 0.338, 0.330, 0.310};
		ACE_velocityBoundaries[]={792, 610, 488};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={620, 655, 675};
		ACE_barrelLengths[]={9, 16, 20};
	};
	class ACE_762x39_Ball : B_762x51_Ball
	{
		airFriction=-0.0015168;
		hit=12;
		typicalSpeed=716;
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
	class ACE_762x39_Ball_57N231P : B_762x51_Tracer_Red
	{
		airFriction=-0.0015168;
		hit=12;
		typicalSpeed=716;
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
	class B_9x21_Ball
	{
		airFriction=-0.00125;
		typicalSpeed=390;
		hit=6;
		ACE_caliber=0.356;
		ACE_bulletLength=0.610;
		ACE_bulletMass=115;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.17};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={350, 390, 420};
		ACE_barrelLengths[]={4, 5, 9};
	};
	class ACE_9x18_Ball_57N181S : B_9x21_Ball
	{
		hit=5;
		airFriction=-0.001234;
		typicalSpeed=298;
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
	class ACE_9x19_Ball : B_9x21_Ball
	{
		airFriction=-0.001234;
		typicalSpeed=370;
		hit=6;
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
	class ACE_10x25_Ball : B_9x21_Ball
	{
		airFriction=-0.00168;
		typicalSpeed=425;
		hit=7;
		ACE_caliber=0.5;
		ACE_bulletLength=0.764;
		ACE_bulletMass=165;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.189};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 400, 430};
		ACE_barrelLengths[]={4, 4.61, 9};
	};
	class ACE_765x17_Ball: B_9x21_Ball
	{
		airFriction=-0.001213;
		typicalSpeed=282;
		hit=7;
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
	class ACE_303_Ball : ACE_762x51_Ball_M118LR
	{
		airFriction=-0.00083;
		typicalSpeed=761;
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
	class B_408_Ball
	{
		airFriction=-0.000395;
		typicalSpeed=910;
		ACE_caliber=0.408;
		ACE_bulletLength=2.126;
		ACE_bulletMass=410;
		ACE_transonicStabilityCoef=1;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.97};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={910};
		ACE_barrelLengths[]={29};
	};
	class ACE_106x83mm_Ball : B_408_Ball
	{
		ACE_caliber=0.416;
		ACE_bulletLength=2.089;
		ACE_bulletMass=398;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.72};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={960};
		ACE_barrelLengths[]={29};
	};
	class ACE_338_Ball : B_408_Ball
	{
		airFriction=-0.000526;
		caliber=1.55;
		deflecting=12;
		hit=20;
		typicalSpeed=826;
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
	class B_127x99_Ball
	{
		airFriction=-0.0006;
		typicalSpeed=853;
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
	class ACE_127x99_Ball_AMAX : B_127x99_Ball
	{
		ACE_caliber=0.510;
		ACE_bulletLength=2.540;
		ACE_bulletMass=750;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={1.050};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={860};
		ACE_barrelLengths[]={29};
	};
	class B_127x108_Ball
	{
		typicalSpeed=820;
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
	class B_45ACP_Ball
	{
		airFriction=-0.0007182;
		typicalSpeed=250;
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
	
	class TMR_B_762x51_M118LR : B_762x51_Ball
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		ACE_velocityBoundaries[]={853, 549, 549, 549};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={750, 780, 790, 794};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	
	class RH_50_AE_Ball: BulletBase
	{
		ACE_caliber=0.5;
		ACE_bulletLength=1.110;
		ACE_bulletMass=325;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.228};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 398, 420};
		ACE_barrelLengths[]={4, 6, 9};
	};
	class RH_454_Casull: BulletBase
	{
		ACE_caliber=0.452;
		ACE_bulletLength=0.895;
		ACE_bulletMass=325;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.171};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={450, 490, 500};
		ACE_barrelLengths[]={4, 7.5, 9};
	};
	class RH_32ACP: BulletBase
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
	class RH_45ACP: BulletBase
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
	class RH_B_40SW: BulletBase
	{
		ACE_caliber=0.4;
		ACE_bulletLength=0.447;
		ACE_bulletMass=135;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.105, 0.115, 0.120, 0.105};
		ACE_velocityBoundaries[]={365, 305, 259};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 380, 400};
		ACE_barrelLengths[]={4, 6, 9};
	};
	class RH_44mag_ball: BulletBase
	{
		ACE_caliber=0.429;
		ACE_bulletLength=0.804;
		ACE_bulletMass=200;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.172};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 390, 420};
		ACE_barrelLengths[]={4, 7.5, 9};
	};
	class RH_357mag_ball: BulletBase
	{
		ACE_caliber=0.357;
		ACE_bulletLength=0.541;
		ACE_bulletMass=125;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.148};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={490, 510, 535};
		ACE_barrelLengths[]={4, 6, 9};
	};
	class RH_762x25: BulletBase
	{
		ACE_caliber=0.310;
		ACE_bulletLength=0.5455;
		ACE_bulletMass=86;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.17};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 380, 400};
		ACE_barrelLengths[]={4, 6, 9};
	};
	class RH_9x18_Ball: BulletBase
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
	class RH_B_9x19_Ball: BulletBase
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
	class RH_B_22LR_SD: BulletBase
	{
		ACE_caliber=0.223;
		ACE_bulletLength=0.45;
		ACE_bulletMass=38;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.111};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={330, 340, 360};
		ACE_barrelLengths[]={4, 6, 9};
	};
	class RH_57x28mm: BulletBase
	{
		ACE_caliber=0.224;
		ACE_bulletLength=0.495;
		ACE_bulletMass=28;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.144};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={550, 625, 720};
		ACE_barrelLengths[]={4, 6, 10.35};
	};
	
	class RH_B_6x35: BulletBase
	{
		ACE_caliber=0.224;
		ACE_bulletLength=0.445;
		ACE_bulletMass=65;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.26};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={730, 750, 760};
		ACE_barrelLengths[]={8, 10, 12};
	};
	
	class RH_556x45_B_Mk262 : B_556x45_Ball
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
	
	class HLC_556NATO_SOST: BulletBase
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
	class HLC_556NATO_SPR: BulletBase
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
	class HLC_300Blackout_Ball: BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.118;
		ACE_bulletMass=147;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.398};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={559, 609, 625};
		ACE_barrelLengths[]={6, 16, 20};
	};
	class HLC_300Blackout_SMK: BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.489;
		ACE_bulletMass=220;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.608};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={300, 320, 340};
		ACE_barrelLengths[]={9, 16, 20};
	};
	class HLC_762x51_BTSub: BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.340;
		ACE_bulletMass=200;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.235};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={305, 325, 335, 340};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class HLC_762x54_ball: BulletBase
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
	class HLC_762x54_tracer: BulletBase
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
	class HLC_303Brit_B: BulletBase
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
	class HLC_792x57_Ball: BulletBase
	{
		ACE_caliber=0.318;
		ACE_bulletLength=1.128;
		ACE_bulletMass=196;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.315};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={785, 800, 815};
		ACE_barrelLengths[]={20, 23.62, 26};
	};
	class FH_545x39_Ball: BulletBase
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
	class FH_545x39_7u1: FH_545x39_Ball
	{
		ACE_bulletMass=80;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_muzzleVelocities[]={260, 303, 320};
		ACE_barrelLengths[]={10, 16.3, 20};
	};
	class HLC_9x19_Ball: BulletBase
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
	class HLC_9x19_GoldDot: HLC_9x19_Ball
	{
		ACE_muzzleVelocities[]={350, 380, 420};
	};
	class HLC_9x19_Subsonic: HLC_9x19_Ball
	{
		ACE_muzzleVelocities[]={300, 320, 340};
	};
	class HLC_10mm_FMJ: HLC_9x19_Ball
	{
		ACE_caliber=0.5;
		ACE_bulletLength=0.764;
		ACE_bulletMass=165;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.189};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={360, 400, 430};
		ACE_barrelLengths[]={4, 4.61, 9};
	};
	class HLC_9x19_M882_SMG: HLC_9x19_Ball
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
	
	class M_mas_545x39_Ball_7N6M : BulletBase
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
	class M_mas_545x39_Ball_7T3M : BulletBase
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
	class B_mas_556x45_Ball_Mk262 : B_556x45_Ball
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
	class B_mas_9x18_Ball_57N181S : BulletBase
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
	class B_mas_9x21p_Ball: BulletBase
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
	class B_mas_9x21_Ball: BulletBase
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
	class B_mas_9x21d_Ball: BulletBase
	{
		ACE_caliber=0.355;
		ACE_bulletLength=0.610;
		ACE_bulletMass=124;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.165};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={210, 250, 285};
		ACE_barrelLengths[]={4, 5, 9};
	};
	class B_mas_765x17_Ball: BulletBase
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
	class B_mas_762x39_Ball: BulletBase
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
	class B_mas_762x39_Ball_T: BulletBase
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
	class B_mas_762x51_Ball_M118LR : B_762x51_Ball
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		ACE_velocityBoundaries[]={853, 549, 549, 549};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={750, 780, 790, 794};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class B_mas_762x54_Ball : BulletBase
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
	class B_mas_762x54_Ball_T : BulletBase
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
	class BWA3_B_762x51_Ball_LR : BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		ACE_velocityBoundaries[]={853, 549, 549, 549};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={750, 780, 790, 794};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class BWA3_B_762x51_Ball_SD : BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		ACE_ballisticCoefficients[]={0.2};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={300, 340};
		ACE_barrelLengths[]={16, 24};
	};
	
	class BWA3_B_46x30_Ball : BulletBase
	{
		ACE_caliber=0.193;
		ACE_bulletLength=0.512;
		ACE_bulletMass=31;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.1455};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={680, 720, 730, 740};
		ACE_barrelLengths[]={4, 7, 9, 12};
	};
	
	class Trixie_338_Ball : BulletBase
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
	class Trixie_303_Ball : BulletBase
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
	
	class rhs_ammo_556x45_Mk318_Ball : BulletBase
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
	class rhs_ammo_556x45_Mk262_Ball : BulletBase
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
	class rhsammo_762x51_Ball : BulletBase
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
	class rhs_B_545x39_Ball : BulletBase
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
	class rhs_B_545x39_Ball_Tracer_Green : BulletBase
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
	class rhs_B_762x54_Ball : BulletBase
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
	class rhs_B_762x54_Ball_Tracer_Green : BulletBase
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
	class rhs_B_762x39_Ball : BulletBase
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
	class rhs_B_762x39_Tracer : BulletBase
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
	
	class R3F_9x19_Ball: BulletBase
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
	class R3F_556x45_Ball: BulletBase
	{
		ACE_caliber=0.224;
		ACE_bulletLength=0.906;
		ACE_bulletMass=62;
		ACE_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
		ACE_ballisticCoefficients[]={0.151};
		ACE_velocityBoundaries[]={};
		ACE_standardAtmosphere="ASM";
		ACE_dragModel=7;
		ACE_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
		ACE_barrelLengths[]={8.3, 9.4, 10.6, 11.8, 13.0, 14.2, 15.4, 16.5, 17.7, 18.9, 20.0, 24.0};
	};
	class R3F_762x51_Ball: BulletBase
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
	class R3F_762x51_Ball2: BulletBase
	{
		ACE_caliber=0.308;
		ACE_bulletLength=1.24;
		ACE_bulletMass=175;
		ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		ACE_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		ACE_velocityBoundaries[]={853, 549, 549, 549};
		ACE_standardAtmosphere="ICAO";
		ACE_dragModel=1;
		ACE_muzzleVelocities[]={750, 780, 790, 794};
		ACE_barrelLengths[]={16, 20, 24, 26};
	};
	class R3F_127x99_Ball: BulletBase
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
	class R3F_127x99_Ball2: BulletBase
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
	class CUP_B_545x39_Ball_Tracer_Green: BulletBase
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
	class B_762x39mm_KLT: BulletBase
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
	class CUP_B_762x51_noTracer: BulletBase
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
	class CUP_B_762x51_Red_Tracer_3RndBurst: BulletBase
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
	class CUP_B_762x51_White_Tracer_3RndBurst: BulletBase
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
	class CUP_B_127x99_Ball_White_Tracer: BulletBase
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