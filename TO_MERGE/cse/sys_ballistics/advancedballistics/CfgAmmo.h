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
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=62;
		AB_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
		AB_ballisticCoefficients[]={0.151};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
		AB_barrelLengths[]={8.3, 9.4, 10.6, 11.8, 13.0, 14.2, 15.4, 16.5, 17.7, 18.9, 20.0, 24.0};
	};
	class AB_556x45_Ball_Mk262 : B_556x45_Ball
	{
		airFriction=-0.001125;
		caliber=0.6;
		deflecting=18;
		hit=11;
		typicalSpeed=836;
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=77;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.361};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={624, 816, 832, 838};
		AB_barrelLengths[]={7.5, 14.5, 18, 20};
	};
	class AB_556x45_Ball_Mk318 : B_556x45_Ball
	{
		airFriction=-0.001120;
		caliber=0.6;
		deflecting=18;
		hit=9;
		typicalSpeed=886;
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=62;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.307};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={780, 886, 950};
		AB_barrelLengths[]={10, 15.5, 20};
	};
	class AB_545x39_Ball_7N6M : B_556x45_Ball
	{
		airFriction=-0.001162;
		caliber=0.5;
		deflecting=18;
		hit=7;
		typicalSpeed=880;
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=52.9;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={780, 880, 920};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class AB_545x39_Ball_7T3M : B_556x45_Ball_Tracer_Red
	{
		airFriction=-0.001162;
		caliber=0.5;
		deflecting=18;
		hit=7;
		typicalSpeed=883;
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_65x39_Caseless
	{
		airFriction=-0.000772;
		typicalSpeed=800;
		AB_caliber=0.264;
		AB_bulletLength=1.295;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.263};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={760, 788, 800, 805};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class B_762x51_Ball
	{
		airFriction=-0.001035;
		typicalSpeed=833;
		hit=14;
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class AB_762x51_Ball_M118LR : B_762x51_Ball
	{
		airFriction=-0.0008525;
		caliber=1.05;
		hit=16;
		typicalSpeed=790;
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		AB_velocityBoundaries[]={853, 549, 549, 549};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={750, 780, 790, 794};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class AB_762x51_Ball_Subsonic : B_762x51_Ball
	{
		airFriction=-0.000535;
		caliber=0.5;
		hit=16;
		typicalSpeed=790;
		AB_caliber=0.308;
		AB_bulletLength=1.340;
		AB_bulletMass=200;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.235};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={305, 325, 335, 340};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class AB_762x54_Ball_7N14 : B_762x51_Ball
	{
		airFriction=-0.001023;
		caliber=0.95;
		hit=15;
		typicalSpeed=820;
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=152;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.4};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={700, 800, 820, 833};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class AB_762x54_Ball_7T2 : B_762x51_Tracer_Red
	{
		airFriction=-0.001023;
		caliber=0.9;
		hit=15;
		typicalSpeed=800;
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class AB_762x35_Ball : B_762x51_Ball
	{
		airFriction=-0.000821;
		caliber=0.9;
		hit=11;
		typicalSpeed=790;
		AB_caliber=0.308;
		AB_bulletLength=1.153;
		AB_bulletMass=125;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.349, 0.338, 0.330, 0.310};
		AB_velocityBoundaries[]={792, 610, 488};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={620, 655, 675};
		AB_barrelLengths[]={9, 16, 20};
	};
	class AB_762x39_Ball : B_762x51_Ball
	{
		airFriction=-0.0015168;
		hit=12;
		typicalSpeed=716;
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class AB_762x39_Ball_57N231P : B_762x51_Tracer_Red
	{
		airFriction=-0.0015168;
		hit=12;
		typicalSpeed=716;
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=117;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_9x21_Ball
	{
		airFriction=-0.00125;
		typicalSpeed=390;
		hit=6;
		AB_caliber=0.356;
		AB_bulletLength=0.610;
		AB_bulletMass=115;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.17};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={350, 390, 420};
		AB_barrelLengths[]={4, 5, 9};
	};
	class AB_9x18_Ball_57N181S : B_9x21_Ball
	{
		hit=5;
		airFriction=-0.001234;
		typicalSpeed=298;
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class AB_9x19_Ball : B_9x21_Ball
	{
		airFriction=-0.001234;
		typicalSpeed=370;
		hit=6;
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class AB_10x25_Ball : B_9x21_Ball
	{
		airFriction=-0.00168;
		typicalSpeed=425;
		hit=7;
		AB_caliber=0.5;
		AB_bulletLength=0.764;
		AB_bulletMass=165;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.189};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 400, 430};
		AB_barrelLengths[]={4, 4.61, 9};
	};
	class AB_765x17_Ball: B_9x21_Ball
	{
		airFriction=-0.001213;
		typicalSpeed=282;
		hit=7;
		AB_caliber=0.3125;
		AB_bulletLength=0.610;
		AB_bulletMass=65;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.118};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={282, 300, 320};
		AB_barrelLengths[]={4, 5, 9};
	};
	class AB_303_Ball : AB_762x51_Ball_M118LR
	{
		airFriction=-0.00083;
		typicalSpeed=761;
		AB_caliber=0.311;
		AB_bulletLength=1.227;
		AB_bulletMass=174;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.499, 0.493, 0.48};
		AB_velocityBoundaries[]={671, 549};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={748, 761, 765};
		AB_barrelLengths[]={20, 24, 26};
	};
	class B_408_Ball
	{
		airFriction=-0.000395;
		typicalSpeed=910;
		AB_caliber=0.408;
		AB_bulletLength=2.126;
		AB_bulletMass=410;
		AB_transonicStabilityCoef=1;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.97};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={910};
		AB_barrelLengths[]={29};
	};
	class AB_106x83mm_Ball : B_408_Ball
	{
		AB_caliber=0.416;
		AB_bulletLength=2.089;
		AB_bulletMass=398;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.72};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={960};
		AB_barrelLengths[]={29};
	};
	class AB_338_Ball : B_408_Ball
	{
		airFriction=-0.000526;
		caliber=1.55;
		deflecting=12;
		hit=20;
		typicalSpeed=826;
		AB_caliber=0.338;
		AB_bulletLength=1.70;
		AB_bulletMass=300;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.381};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={820, 826, 830};
		AB_barrelLengths[]={24, 26.5, 28};
	};
	class B_127x99_Ball
	{
		airFriction=-0.0006;
		typicalSpeed=853;
		AB_caliber=0.510;
		AB_bulletLength=2.310;
		AB_bulletMass=647;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.670};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={853};
		AB_barrelLengths[]={29};
	};
	class AB_127x99_Ball_AMAX : B_127x99_Ball
	{
		AB_caliber=0.510;
		AB_bulletLength=2.540;
		AB_bulletMass=750;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={1.050};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={860};
		AB_barrelLengths[]={29};
	};
	class B_127x108_Ball
	{
		typicalSpeed=820;
		AB_caliber=0.511;
		AB_bulletLength=2.520;
		AB_bulletMass=745;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.63};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={820};
		AB_barrelLengths[]={28.7};
	};
	class B_45ACP_Ball
	{
		airFriction=-0.0007182;
		typicalSpeed=250;
		AB_caliber=0.452;
		AB_bulletLength=0.68;
		AB_bulletMass=230;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.195};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={230, 250, 285};
		AB_barrelLengths[]={4, 5, 9};
	};
	
	class TMR_B_762x51_M118LR : B_762x51_Ball
	{
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		AB_velocityBoundaries[]={853, 549, 549, 549};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={750, 780, 790, 794};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	
	class RH_50_AE_Ball: BulletBase
	{
		AB_caliber=0.5;
		AB_bulletLength=1.110;
		AB_bulletMass=325;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.228};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 398, 420};
		AB_barrelLengths[]={4, 6, 9};
	};
	class RH_454_Casull: BulletBase
	{
		AB_caliber=0.452;
		AB_bulletLength=0.895;
		AB_bulletMass=325;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.171};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={450, 490, 500};
		AB_barrelLengths[]={4, 7.5, 9};
	};
	class RH_32ACP: BulletBase
	{
		AB_caliber=0.3125;
		AB_bulletLength=0.610;
		AB_bulletMass=65;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.118};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={282, 300, 320};
		AB_barrelLengths[]={4, 5, 9};
	};
	class RH_45ACP: BulletBase
	{
		AB_caliber=0.452;
		AB_bulletLength=0.68;
		AB_bulletMass=230;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.195};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={230, 250, 285};
		AB_barrelLengths[]={4, 5, 9};
	};
	class RH_B_40SW: BulletBase
	{
		AB_caliber=0.4;
		AB_bulletLength=0.447;
		AB_bulletMass=135;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.105, 0.115, 0.120, 0.105};
		AB_velocityBoundaries[]={365, 305, 259};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 380, 400};
		AB_barrelLengths[]={4, 6, 9};
	};
	class RH_44mag_ball: BulletBase
	{
		AB_caliber=0.429;
		AB_bulletLength=0.804;
		AB_bulletMass=200;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.172};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 390, 420};
		AB_barrelLengths[]={4, 7.5, 9};
	};
	class RH_357mag_ball: BulletBase
	{
		AB_caliber=0.357;
		AB_bulletLength=0.541;
		AB_bulletMass=125;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.148};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={490, 510, 535};
		AB_barrelLengths[]={4, 6, 9};
	};
	class RH_762x25: BulletBase
	{
		AB_caliber=0.310;
		AB_bulletLength=0.5455;
		AB_bulletMass=86;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.17};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 380, 400};
		AB_barrelLengths[]={4, 6, 9};
	};
	class RH_9x18_Ball: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class RH_B_9x19_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class RH_B_22LR_SD: BulletBase
	{
		AB_caliber=0.223;
		AB_bulletLength=0.45;
		AB_bulletMass=38;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.111};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={330, 340, 360};
		AB_barrelLengths[]={4, 6, 9};
	};
	class RH_57x28mm: BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.495;
		AB_bulletMass=28;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.144};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={550, 625, 720};
		AB_barrelLengths[]={4, 6, 10.35};
	};
	
	class RH_B_6x35: BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.445;
		AB_bulletMass=65;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.26};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={730, 750, 760};
		AB_barrelLengths[]={8, 10, 12};
	};
	
	class RH_556x45_B_Mk262 : B_556x45_Ball
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=77;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.361};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={624, 816, 832, 838};
		AB_barrelLengths[]={7.5, 14.5, 18, 20};
	};
	
	class HLC_556NATO_SOST: BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=62;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.307};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={780, 886, 950};
		AB_barrelLengths[]={10, 15.5, 20};
	};
	class HLC_556NATO_SPR: BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=77;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.361};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={624, 816, 832, 838};
		AB_barrelLengths[]={7.5, 14.5, 18, 20};
	};
	class HLC_300Blackout_Ball: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.118;
		AB_bulletMass=147;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.398};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={559, 609, 625};
		AB_barrelLengths[]={6, 16, 20};
	};
	class HLC_300Blackout_SMK: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.489;
		AB_bulletMass=220;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.608};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={300, 320, 340};
		AB_barrelLengths[]={9, 16, 20};
	};
	class HLC_762x51_BTSub: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.340;
		AB_bulletMass=200;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.235};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={305, 325, 335, 340};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class HLC_762x54_ball: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=152;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.4};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={700, 800, 820, 833};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class HLC_762x54_tracer: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class HLC_303Brit_B: BulletBase
	{
		AB_caliber=0.311;
		AB_bulletLength=1.227;
		AB_bulletMass=174;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.499, 0.493, 0.48};
		AB_velocityBoundaries[]={671, 549};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={748, 761, 765};
		AB_barrelLengths[]={20, 24, 26};
	};
	class HLC_792x57_Ball: BulletBase
	{
		AB_caliber=0.318;
		AB_bulletLength=1.128;
		AB_bulletMass=196;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.315};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={785, 800, 815};
		AB_barrelLengths[]={20, 23.62, 26};
	};
	class FH_545x39_Ball: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=52.9;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={780, 880, 920};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class FH_545x39_7u1: FH_545x39_Ball
	{
		AB_bulletMass=80;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_muzzleVelocities[]={260, 303, 320};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class HLC_9x19_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class HLC_9x19_GoldDot: HLC_9x19_Ball
	{
		AB_muzzleVelocities[]={350, 380, 420};
	};
	class HLC_9x19_Subsonic: HLC_9x19_Ball
	{
		AB_muzzleVelocities[]={300, 320, 340};
	};
	class HLC_10mm_FMJ: HLC_9x19_Ball
	{
		AB_caliber=0.5;
		AB_bulletLength=0.764;
		AB_bulletMass=165;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.189};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={360, 400, 430};
		AB_barrelLengths[]={4, 4.61, 9};
	};
	class HLC_9x19_M882_SMG: HLC_9x19_Ball
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	
	class M_mas_545x39_Ball_7N6M : BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=52.9;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={780, 880, 920};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class M_mas_545x39_Ball_7T3M : BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_mas_556x45_Ball_Mk262 : B_556x45_Ball
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=77;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.361};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={624, 816, 832, 838};
		AB_barrelLengths[]={7.5, 14.5, 18, 20};
	};
	class B_mas_9x18_Ball_57N181S : BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class B_mas_9x21p_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class B_mas_9x21_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class B_mas_9x21d_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={210, 250, 285};
		AB_barrelLengths[]={4, 5, 9};
	};
	class B_mas_765x17_Ball: BulletBase
	{
		AB_caliber=0.3125;
		AB_bulletLength=0.610;
		AB_bulletMass=65;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.118};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={282, 300, 320};
		AB_barrelLengths[]={4, 5, 9};
	};
	class B_mas_762x39_Ball: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_mas_762x39_Ball_T: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=117;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_mas_762x51_Ball_M118LR : B_762x51_Ball
	{
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		AB_velocityBoundaries[]={853, 549, 549, 549};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={750, 780, 790, 794};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class B_mas_762x54_Ball : BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=152;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.4};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={700, 800, 820, 833};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class B_mas_762x54_Ball_T : BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class BWA3_B_762x51_Ball_LR : BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		AB_velocityBoundaries[]={853, 549, 549, 549};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={750, 780, 790, 794};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class BWA3_B_762x51_Ball_SD : BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={300, 340};
		AB_barrelLengths[]={16, 24};
	};
	
	class BWA3_B_46x30_Ball : BulletBase
	{
		AB_caliber=0.193;
		AB_bulletLength=0.512;
		AB_bulletMass=31;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.1455};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 720, 730, 740};
		AB_barrelLengths[]={4, 7, 9, 12};
	};
	
	class Trixie_338_Ball : BulletBase
	{
		AB_caliber=0.338;
		AB_bulletLength=1.70;
		AB_bulletMass=300;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.381};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={820, 826, 830};
		AB_barrelLengths[]={24, 26.5, 28};
	};
	class Trixie_303_Ball : BulletBase
	{
		AB_caliber=0.311;
		AB_bulletLength=1.227;
		AB_bulletMass=174;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.499, 0.493, 0.48};
		AB_velocityBoundaries[]={671, 549};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={748, 761, 765};
		AB_barrelLengths[]={20, 24, 26};
	};
	
	class rhs_ammo_556x45_Mk318_Ball : BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=62;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.307};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={780, 886, 950};
		AB_barrelLengths[]={10, 15.5, 20};
	};
	class rhs_ammo_556x45_Mk262_Ball : BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=77;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.361};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={624, 816, 832, 838};
		AB_barrelLengths[]={7.5, 14.5, 18, 20};
	};
	class rhsammo_762x51_Ball : BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class rhs_B_545x39_Ball : BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=52.9;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={780, 880, 920};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class rhs_B_545x39_Ball_Tracer_Green : BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class rhs_B_762x54_Ball : BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=152;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.4};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={700, 800, 820, 833};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class rhs_B_762x54_Ball_Tracer_Green : BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class rhs_B_762x39_Ball : BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class rhs_B_762x39_Tracer : BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=117;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	
	class R3F_9x19_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class R3F_556x45_Ball: BulletBase
	{
		AB_caliber=0.224;
		AB_bulletLength=0.906;
		AB_bulletMass=62;
		AB_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
		AB_ballisticCoefficients[]={0.151};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
		AB_barrelLengths[]={8.3, 9.4, 10.6, 11.8, 13.0, 14.2, 15.4, 16.5, 17.7, 18.9, 20.0, 24.0};
	};
	class R3F_762x51_Ball: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class R3F_762x51_Ball2: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.24;
		AB_bulletMass=175;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.505, 0.496, 0.485, 0.485, 0.485};
		AB_velocityBoundaries[]={853, 549, 549, 549};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={750, 780, 790, 794};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class R3F_127x99_Ball: BulletBase
	{
		AB_caliber=0.510;
		AB_bulletLength=2.310;
		AB_bulletMass=647;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.670};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={853};
		AB_barrelLengths[]={29};
	};
	class R3F_127x99_Ball2: BulletBase
	{
		AB_caliber=0.510;
		AB_bulletLength=2.310;
		AB_bulletMass=647;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.670};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={853};
		AB_barrelLengths[]={29};
	};
	
	class CUP_B_545x39_Ball: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=52.9;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={780, 880, 920};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_545x39_Ball_Tracer_Green: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_545x39_Ball_Tracer_Red: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_545x39_Ball_Tracer_White: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_545x39_Ball_Tracer_Yellow: BulletBase
	{
		AB_caliber=0.220;
		AB_bulletLength=0.85;
		AB_bulletMass=49.8;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.168};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=7;
		AB_muzzleVelocities[]={785, 883, 925};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_762x39_Ball: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_762x39_Ball_Tracer_Green: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=117;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class B_762x39mm_KLT: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=123;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={650, 716, 750};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_9x18_Ball: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_9x18_Ball_Tracer_Green: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_9x18_Ball_Tracer_Red: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_9x18_Ball_Tracer_Yellow: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_9x18_Ball_White_Tracer: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 350};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_9x19_Ball: BulletBase
	{
		AB_caliber=0.355;
		AB_bulletLength=0.610;
		AB_bulletMass=124;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.165};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={340, 370, 400};
		AB_barrelLengths[]={4, 5, 9};
	};
	class CUP_B_762x51_noTracer: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_762x51_Red_Tracer_3RndBurst: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_762x51_White_Tracer_3RndBurst: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_303_Ball: BulletBase
	{
		AB_caliber=0.311;
		AB_bulletLength=1.227;
		AB_bulletMass=174;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.499, 0.493, 0.48};
		AB_velocityBoundaries[]={671, 549};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={748, 761, 765};
		AB_barrelLengths[]={20, 24, 26};
	};
	class CUP_B_127x107_Ball_Green_Tracer: BulletBase
	{
		AB_caliber=0.511;
		AB_bulletLength=2.520;
		AB_bulletMass=745;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.63};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={820};
		AB_barrelLengths[]={28.7};
	};
	class CUP_B_127x108_Ball_Green_Tracer: BulletBase
	{
		AB_caliber=0.511;
		AB_bulletLength=2.520;
		AB_bulletMass=745;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.63};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={820};
		AB_barrelLengths[]={28.7};
	};
	class CUP_B_762x54_Ball_White_Tracer: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class CUP_B_762x54_Ball_Red_Tracer: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class CUP_B_762x54_Ball_Green_Tracer: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class CUP_B_762x54_Ball_Yellow_Tracer: BulletBase
	{
		AB_caliber=0.312;
		AB_bulletLength=1.14;
		AB_bulletMass=149;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.395};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={680, 750, 798, 800};
		AB_barrelLengths[]={16, 20, 24, 26};
	};
	class CUP_B_9x39_SP5: BulletBase
	{
		AB_caliber=0.364;
		AB_bulletLength=1.24;
		AB_bulletMass=250;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.275};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=1;
		AB_muzzleVelocities[]={280, 300, 320};
		AB_barrelLengths[]={10, 16.3, 20};
	};
	class CUP_B_762x51_Tracer_Green: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_762x51_Tracer_Red: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_762x51_Tracer_Yellow: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class CUP_B_762x51_Tracer_White: BulletBase
	{
		AB_caliber=0.308;
		AB_bulletLength=1.14;
		AB_bulletMass=146;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.2};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={700, 800, 820, 833, 845};
		AB_barrelLengths[]={10, 16, 20, 24, 26};
	};
	class B_127x107_Ball: BulletBase
	{
		AB_caliber=0.511;
		AB_bulletLength=2.520;
		AB_bulletMass=745;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.63};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={820};
		AB_barrelLengths[]={28.7};
	};
	class CUP_B_9x18_SD: BulletBase
	{
		AB_caliber=0.365;
		AB_bulletLength=0.610;
		AB_bulletMass=92.6;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.125};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={298, 330, 340};
		AB_barrelLengths[]={3.8, 5, 9};
	};
	class CUP_B_765x17_Ball: BulletBase
	{
		AB_caliber=0.3125;
		AB_bulletLength=0.610;
		AB_bulletMass=65;
		AB_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
		AB_ballisticCoefficients[]={0.118};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={282, 300, 320};
		AB_barrelLengths[]={4, 5, 9};
	};
	class CUP_B_145x115_AP_Green_Tracer: BulletBase
	{
		AB_caliber=0.586;
		AB_bulletLength=2.00;
		AB_bulletMass=1010;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.620};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={1000};
		AB_barrelLengths[]={53};
	};
	class CUP_B_127x99_Ball_White_Tracer: BulletBase
	{
		AB_caliber=0.510;
		AB_bulletLength=2.310;
		AB_bulletMass=647;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.670};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ASM";
		AB_dragModel=1;
		AB_muzzleVelocities[]={853};
		AB_barrelLengths[]={29};
	};
	class CUP_B_86x70_Ball_noTracer: BulletBase
	{
		AB_caliber=0.338;
		AB_bulletLength=1.70;
		AB_bulletMass=300;
		AB_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
		AB_ballisticCoefficients[]={0.381};
		AB_velocityBoundaries[]={};
		AB_standardAtmosphere="ICAO";
		AB_dragModel=7;
		AB_muzzleVelocities[]={820, 826, 830};
		AB_barrelLengths[]={24, 26.5, 28};
	};
};