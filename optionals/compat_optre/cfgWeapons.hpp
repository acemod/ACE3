class CfgWeapons
{
    class ACE_ItemCore;
    class ItemCore;
    class InventoryItem_Base_F;
    class OPTRE_Biofoam: ACE_ItemCore {
        scope = 2;
        descriptionUse = "Apply to affected area to stop bleeding and apply a all-natual pain killer.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };
    class EBR_Base_F;
    class UGL_F;
    class LMG_Mk200_F;
	class Pistol_Base_F;
	class Rifle_Base_F;
	class SMG_01_F;
    class OPTRE_MA5B: EBR_Base_F
    {
    	ACE_barrelTwist=177.8;
        ACE_barrelLength=368.3;
    };
    class OPTRE_MA5BGL: EBR_Base_F
    {
    	ACE_barrelTwist=177.8;
        ACE_barrelLength=368.3;
        class M309GL: UGL_F
        {
        	magazines[] = {
                //bis compatibility
                "1Rnd_HE_Grenade_shell",
                "UGL_FlareWhite_F",
                "UGL_FlareGreen_F",
                "UGL_FlareRed_F",
                "UGL_FlareYellow_F",
                "UGL_FlareCIR_F",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "3Rnd_HE_Grenade_shell",
                "3Rnd_UGL_FlareWhite_F",
                "3Rnd_UGL_FlareGreen_F",
                "3Rnd_UGL_FlareRed_F",
                "3Rnd_UGL_FlareYellow_F",
                "3Rnd_UGL_FlareCIR_F",
                "3Rnd_Smoke_Grenade_shell",
                "3Rnd_SmokeRed_Grenade_shell",
                "3Rnd_SmokeGreen_Grenade_shell",
                "3Rnd_SmokeYellow_Grenade_shell",
                "3Rnd_SmokePurple_Grenade_shell",
                "3Rnd_SmokeBlue_Grenade_shell",
                "3Rnd_SmokeOrange_Grenade_shell",

                //ACE3 Compatibility
                "ACE_HuntIR_M203"
            };
        };
    };
    class OPTRE_BR55HB: EBR_Base_F
    {
    	ACE_barrelTwist=177.8;
        ACE_barrelLength=368.3;
    };
    class OPTRE_M392_DMR: LMG_Mk200_F
    {
    	ACE_barrelTwist=177.8;
        ACE_barrelLength=465.3;
    };
    class OPTRE_M73_base: LMG_Mk200_F
    {
    	ACE_barrelTwist=177.8;
        ACE_barrelLength=672.5;
    };
    class OPTRE_M6G : Pistol_Base_F
    {
    	ACE_barrelTwist=215.7;
        ACE_barrelLength=124.6;
    };
    class OPTRE_M6C : Pistol_Base_F
    {
    	ACE_barrelTwist=215.7;
        ACE_barrelLength=124.6;
    };
    class OPTRE_M45 : Rifle_Base_F
    {
    	ACE_barrelTwist=215.7;
        ACE_barrelLength=124.6;
    };
    class OPTRE_M45E: Rifle_Base_F
    {
    	ACE_barrelTwist=215.7;
        ACE_barrelLength=124.6;
    };
    class OPTRE_M45A: Rifle_Base_F
    {
    	ACE_barrelTwist=215.7;
        ACE_barrelLength=124.6;
    };
    class OPTRE_M7: SMG_01_F
    {
    	ACE_barrelTwist=168.7;
        ACE_barrelLength=218.6;
    };
    class OPTRE_SRS99D: LMG_Mk200_F
    {
    	ACE_barrelTwist=482.7;
        ACE_barrelLength=1062.6;
    };
    class OPTRE_SRS99_Scope: ItemCore
    {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    };
};