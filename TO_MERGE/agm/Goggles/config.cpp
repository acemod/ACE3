#define COLOUR 8.0
class CfgPatches {
  class AGM_Goggles {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"Garth 'L-H' de Wet"};
    authorUrl = "https://github.com/CorruptedHeart";
  };
};

#include "CfgFunctions.hpp"
#define COMBAT_GOGGLES 		AGM_Overlay="AGM_Goggles\textures\HUD\CombatGoggles.paa"; \
		AGM_OverlayCracked = "AGM_Goggles\textures\HUD\CombatGogglesCracked.paa"; \
		AGM_Resistance = 2; \
		AGM_Protection = 1;

class CfgGlasses {
	class None {
		AGM_Color[] = {0,0,0};
		AGM_TintAmount=0;
		AGM_Overlay = "";
		AGM_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
		AGM_OverlayCracked = "AGM_Goggles\textures\HUD\Cracked.paa";
		AGM_Resistance = 0;
		AGM_Protection = 0;
		AGM_DustPath = "AGM_Goggles\textures\fx\dust\%1.paa";
	};

	class G_Combat:None {
		COMBAT_GOGGLES
	};

	class G_Diving {
		AGM_Overlay="AGM_Goggles\textures\HUD\DivingGoggles.paa";
		AGM_OverlayCracked = "AGM_Goggles\textures\HUD\DivingGogglesCracked.paa";
		AGM_Resistance = 2;
		AGM_Protection = 1;
	};

	class G_Lowprofile:None {
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 2;
		AGM_Protection = 1;
	};

	class G_Shades_Black:None {
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Shades_Blue:None{
		AGM_Color[] = {0,0,1};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Shades_Green:None{
		AGM_Color[] = {0,1,0};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Shades_Red:None{
		AGM_Color[] = {1,0,0};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Spectacles:None{
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Spectacles_Tinted:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Sport_Blackred:None{
		AGM_Color[] = {1,0,0};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Sport_BlackWhite:None{
		AGM_Color[] = {0,0,1};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Sport_Blackyellow:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Sport_Checkered:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Sport_Greenblack:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Sport_Red:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Color[] = {0,0,0};
		AGM_Resistance = 1;
	};

	class G_Squares:None{
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Squares_Tinted:None{
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Tactical_Black:None{
		AGM_TintAmount=COLOUR;
		AGM_Color[] = {0,0,-1.5};
		AGM_Resistance = 1;
	};

	class G_Tactical_Clear:None{
		AGM_TintAmount=COLOUR;
		AGM_Color[] = {0,0,-1};
		AGM_Resistance = 1;
	};

	class G_Aviator:None{
		AGM_Color[] = {0,0,-1};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Lady_Blue:None{
		AGM_Color[] = {0,0,1};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Lady_Red:None{
		AGM_Color[] = {1,0,0};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class G_Lady_Dark:None{
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
	};

	class G_Lady_Mirror:None{
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
	};

	class AV_ESS_blk:None{
		COMBAT_GOGGLES
	};
	
	class G_Balaclava_blk;
	
	class G_Balaclava_combat:G_Balaclava_blk {
		COMBAT_GOGGLES
	};
	
	class G_Balaclava_lowprofile:G_Balaclava_blk {
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 2;
		AGM_Protection = 1;
	};
	
	class G_Bandanna_blk;
	class G_Bandanna_shades:G_Bandanna_blk {
		AGM_TintAmount=COLOUR*2;
		AGM_Resistance = 1;
		AGM_Protection = 1;
	};
	class G_Bandanna_sport:G_Bandanna_blk {
		AGM_Color[] = {1,0,0};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
		AGM_Protection = 1;
	};
	class G_Bandanna_aviator:G_Bandanna_blk {
		AGM_Color[] = {0,0,-1};
		AGM_TintAmount=COLOUR;
		AGM_Resistance = 1;
		AGM_Protection = 1;
	};
};

#include "RscTitles.hpp"

class CfgMovesBasic
{
	class ManActions
	{
		GestureWipeFace[] = {"GestureWipeFace", "gesture"};
	};
};

class CfgGesturesMale
{
	class States
	{
		class GestureFreezeStand;
		class GestureWipeFace: GestureFreezeStand
		{
			file = "\AGM_Goggles\anim\WipeGlasses.rtm";
			canPullTrigger = 0;
		};
	};
};

class CfgWeapons{
	class H_HelmetB;

	class H_CrewHelmetHeli_B:H_HelmetB {
		AGM_Protection = 1;
	};
	class H_PilotHelmetHeli_B:H_HelmetB {
		AGM_Protection = 1;
	};
	class H_PilotHelmetFighter_B:H_HelmetB {
		AGM_Protection = 1;
	};
};

class RifleAssaultCloud {
	AGM_Goggles_BulletCount = 4;
};
class MachineGunCloud {
	AGM_Goggles_BulletCount = 3;
};
class SniperCloud {
	AGM_Goggles_BulletCount = 1;
};

class AGM_Core_Default_Keys {
	class wipeGlasses {
		displayName = $STR_AGM_Goggles_WipeGlasses;
		condition = "!(player getVariable['AGM_isUnconscious', false])";
		statement = "call AGM_Goggles_fnc_ClearGlasses;";
		key = 20; // T
		shift = 1;
		control = 1;
		alt = 0;
	};
};

class AGM_Core_Options {
	class showInThirdPerson {
		displayName = $STR_AGM_Goggles_ShowInThirdPerson;
		default = 0;
	};
};

class CfgCloudlets {
	class Default;
	class AGMRainEffect:Default {
		interval = 0.001;
		particleShape = "\A3\data_f\ParticleEffects\Universal\Refract";
		particleFSNtieth = 1;
		particleFSIndex = 0;
		particleFSFrameCount = 1;
		particleFSLoop = 1;

		particleType = "Billboard";
		lifeTime = 0.5;
		rotationVelocity = 1;
		weight = 100;
		volume = 0.000;
		rubbing = 1.7;
		size[] = {0.1};
		color[] = {{1,1,1,1}};
		animationSpeed[] = {0,1};
		randomDirectionPeriod = 0.2;
		randomDirectionIntensity = 1.2;
		positionVar[] = {2, 2, 2.5};
		sizeVar = 0.01;
		colorVar[] = {0, 0, 0, 0.1};
		destroyOnWaterSurface = 1;
	};
};
