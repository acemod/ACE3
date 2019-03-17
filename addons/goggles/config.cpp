#include "script_component.hpp"

#define COLOUR 8.0
class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'L-H' de Wet"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#define COMBAT_GOGGLES         ACE_Overlay = QPATHTOF(textures\HUD\CombatGoggles.paa); \
        ACE_OverlayCracked = QPATHTOF(textures\HUD\CombatGogglesCracked.paa); \
        ACE_Resistance = 2; \
        ACE_Protection = 1;

class CfgGlasses {
    class None {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount=0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOF(textures\HUD\Cracked.paa);
        ACE_Resistance = 0;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOF(textures\fx\dust\%1.paa);
    };

    class G_Combat:None {
        COMBAT_GOGGLES
    };

    class G_Combat_Goggles_tna_F: None {
        COMBAT_GOGGLES
    };

    class G_Diving {
        ACE_Overlay = QPATHTOF(textures\HUD\DivingGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(textures\HUD\DivingGogglesCracked.paa);
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Lowprofile:None {
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Shades_Black:None {
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Shades_Blue:None{
        ACE_Color[] = {0,0,1};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Shades_Green:None{
        ACE_Color[] = {0,1,0};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Shades_Red:None{
        ACE_Color[] = {1,0,0};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Spectacles:None{
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Spectacles_Tinted:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Blackred:None{
        ACE_Color[] = {1,0,0};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Sport_BlackWhite:None{
        ACE_Color[] = {0,0,1};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Sport_Blackyellow:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Checkered:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Greenblack:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Red:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Color[] = {0,0,0};
        ACE_Resistance = 1;
    };

    class G_Squares:None{
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Squares_Tinted:None{
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Tactical_Black:None{
        ACE_TintAmount=COLOUR;
        ACE_Color[] = {0,0,-1.5};
        ACE_Resistance = 1;
    };

    class G_Tactical_Clear:None{
        ACE_TintAmount=COLOUR;
        ACE_Color[] = {0,0,-1};
        ACE_Resistance = 1;
    };

    class G_Aviator:None{
        ACE_Color[] = {0,0,-1};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Blue:None{
        ACE_Color[] = {0,0,1};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Red:None{
        ACE_Color[] = {1,0,0};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Dark:None{
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Lady_Mirror:None{
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
    };

    class G_Balaclava_blk;

    class G_Balaclava_combat:G_Balaclava_blk {
        COMBAT_GOGGLES
    };

    class G_Balaclava_lowprofile:G_Balaclava_blk {
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Balaclava_TI_blk_F;
    class G_Balaclava_TI_G_blk_F: G_Balaclava_TI_blk_F {
        COMBAT_GOGGLES
    };

    class G_Balaclava_TI_tna_F;
    class G_Balaclava_TI_G_tna_F: G_Balaclava_TI_tna_F {
        COMBAT_GOGGLES
    };

    class G_Bandanna_blk;
    class G_Bandanna_shades:G_Bandanna_blk {
        ACE_TintAmount=COLOUR*2;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_Bandanna_sport: G_Bandanna_shades {
        ACE_Color[] = {1,0,0};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_Bandanna_aviator: G_Bandanna_shades {
        ACE_Color[] = {0,0,-1};
        ACE_TintAmount=COLOUR;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };

    class G_EyeProtectors_base_F;
    class G_EyeProtectors_F: G_EyeProtectors_base_F {
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_EyeProtectors_Earpiece_F: G_EyeProtectors_base_F {
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
};

#include "RscTitles.hpp"

class CfgMovesBasic {
    class ManActions {
        GestureWipeFace[] = {"GestureWipeFace", "gesture"};
    };
};

class CfgGesturesMale {
    class States {
        class GestureFreezeStand;
        class GestureWipeFace: GestureFreezeStand {
            file = QPATHTOF(anim\WipeGlasses.rtm);
            canPullTrigger = 0;
        };
    };
};

class CfgWeapons {
    class H_HelmetB;

    class H_CrewHelmetHeli_B:H_HelmetB {
        ACE_Protection = 1;
    };
    class H_PilotHelmetHeli_B:H_HelmetB {
        ACE_Protection = 1;
    };
    class H_PilotHelmetFighter_B:H_HelmetB {
        ACE_Protection = 1;
    };
};

class RifleAssaultCloud {
    ACE_Goggles_BulletCount = 4;
};
class MachineGunCloud {
    ACE_Goggles_BulletCount = 3;
};
class SniperCloud {
    ACE_Goggles_BulletCount = 1;
};

#include "ACE_Settings.hpp"

class CfgCloudlets {
    class Default;
    class ACERainEffect:Default {
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
