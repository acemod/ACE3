
class CfgAmmo
{
	class BulletBase;
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
};