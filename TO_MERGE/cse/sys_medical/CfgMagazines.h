class CfgMagazines
{
	class Default;
	class CA_magazine: Default{};
	class cse_backwardsCompatMagazineBase_CMS: CA_magazine {};
	class cse_bandage_basic: cse_backwardsCompatMagazineBase_CMS
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_BANDAGE_BASIC_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\field_dressing.paa";
		model = "\cse\cse_sys_medical\equipment\bandages\fielddressing.p3d";
		descriptionShort = $STR_CSE_MAG_BANDAGE_BASIC_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_BANDAGE_BASIC_DESC_USE;
		mass = 0.5;
	};
	class cse_packing_bandage: cse_backwardsCompatMagazineBase_CMS
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_PACKING_BANDAGE_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\packing_bandage.paa";
		descriptionShort = $STR_CSE_MAG_PACKING_BANDAGE_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_PACKING_BANDAGE_DESC_USE;
		mass = 1;
		// model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
		model = "\cse\cse_sys_medical\equipment\bandages\packingbandage.p3d";
	};
	class cse_bandageElastic: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_BANDAGE_ELASTIC_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\bandageElastic.paa";
		model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
		descriptionShort = $STR_CSE_MAG_BANDAGE_ELASTIC_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_BANDAGE_ELASTIC_DESC_USE;
		mass = 1;
	};
	class cse_tourniquet: cse_backwardsCompatMagazineBase_CMS
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_TOURNIQUET_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\tourniquet.paa";
		model = "\cse\cse_sys_medical\equipment\Tourniquet.p3d";
		descriptionShort = $STR_CSE_MAG_TOURNIQUET_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_TOURNIQUET_DESC_USE;
		mass = 1;		
	};	
	class cse_splint: cse_backwardsCompatMagazineBase_CMS
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_SPLINT_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\splint.paa";
		descriptionUse = $STR_CSE_MAG_SPLINT_DESC_USE;
		descriptionShort = $STR_CSE_MAG_SPLINT_DESC_SHORT;
		mass = 1;	
	};
	class cse_morphine: cse_backwardsCompatMagazineBase_CMS
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_MORPHINE_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\morphine.paa";
		model = "\cse\cse_sys_medical\equipment\Morphinpen.p3d";
		descriptionShort = $STR_CSE_MAG_MORPHINE_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_MORPHINE_DESC_USE;
		mass = 1;
	};
	class cse_atropine: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_ATROPINE_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\atropine.paa";
		model = "\cse\cse_sys_medical\equipment\Atropin-pen.p3d";
		descriptionShort = $STR_CSE_MAG_ATROPINE_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_ATROPINE_DESC_USE;
		mass = 1;
	};
	class cse_epinephrine: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_EPINEPHRINE_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\epinephrine.paa";
		model = "\cse\cse_sys_medical\equipment\Epipen.p3d";
		descriptionShort = $STR_CSE_MAG_EPINEPHRINE_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_EPINEPHRINE_DESC_USE;
		mass = 1;
	};
	class cse_plasma_iv: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		mass = 1;
		displayName = $STR_CSE_MAG_PLASMA_IV;
		picture = "\cse\cse_sys_medical\equipment\img\plasma_iv.paa";
		descriptionShort = $STR_CSE_MAG_PLASMA_IV_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_PLASMA_IV_DESC_USE;
	};
	class cse_plasma_iv_500: cse_plasma_iv {
		displayName = $STR_CSE_MAG_PLASMA_IV_500;
	};
	class cse_plasma_iv_250: cse_plasma_iv_500 {
		displayName = $STR_CSE_MAG_PLASMA_IV_250;
	};
	class cse_blood_iv: cse_backwardsCompatMagazineBase_CMS	{
		scope = 2;
		value = 1;
		count = 1;
		mass = 1;
		model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
		displayName = $STR_CSE_MAG_BLOOD_IV;
		picture = "\cse\cse_sys_medical\equipment\img\bloodbag.paa";
		descriptionShort = $STR_CSE_MAG_BLOOD_IV_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_BLOOD_IV_DESC_USE;
	};
	class cse_blood_iv_500: cse_blood_iv {
		displayName = $STR_CSE_MAG_BLOOD_IV_500;
	};
	class cse_blood_iv_250: cse_blood_iv_500 {
		displayName = $STR_CSE_MAG_BLOOD_IV_250;
	};
	class cse_saline_iv: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		mass = 1;
		displayName = $STR_CSE_MAG_SALINE_IV;
		picture = "\cse\cse_sys_medical\equipment\img\saline_iv.paa";
		descriptionShort = $STR_CSE_MAG_SALINE_IV_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_SALINE_IV_DESC_USE;
	};
	class cse_saline_iv_500: cse_saline_iv {
		displayName = $STR_CSE_MAG_SALINE_IV_500;
	};
	class cse_saline_iv_250: cse_saline_iv_500 {
		displayName = $STR_CSE_MAG_SALINE_IV_250;
	};
	class cse_quikclot: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_QUIKCLOT_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\quickclot.paa";
		descriptionShort = $STR_CSE_MAG_QUIKCLOT_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_QUIKCLOT_DESC_USE;
		mass = 1;	
	};
	class cse_nasopharyngeal_tube: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_NPA_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\nasopharyngeal_tube.paa";
		descriptionUse = $STR_CSE_MAG_NPA_DESC_USE;
		descriptionShort = $STR_CSE_MAG_NPA_DESC_SHORT;
		mass = 1;
	};
	class cse_opa: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_OPA_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\nasopharyngeal_tube.paa";
		descriptionShort = $STR_CSE_MAG_OPA_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_OPA_DESC_USE;
		mass = 1;	
	};
	class cse_liquidSkin: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_LIQUID_SKIN_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\liquidSkin.paa";
		model = "\cse\cse_sys_medical\equipment\skinliquid.p3d"; 
		descriptionShort = $STR_CSE_MAG_LIQUID_SKIN_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_LIQUID_SKIN_DESC_USE;
		mass = 1;
	};
	class cse_chestseal: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_CHEST_SEAL_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\chestseal.paa";
		descriptionShort = $STR_CSE_MAG_CHEST_SEAL_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_CHEST_SEAL_DESC_USE;
		mass = 1;
	};
	class cse_personal_aid_kit: cse_backwardsCompatMagazineBase_CMS {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_CSE_MAG_AID_KIT_DISPLAY;
		picture = "\cse\cse_sys_medical\equipment\img\personal_aid_kit.paa";
		model = "\cse\cse_sys_medical\equipment\Personal-aidkits\MTP.p3d"; 
		descriptionShort = $STR_CSE_MAG_AID_KIT_DESC_SHORT;
		descriptionUse = $STR_CSE_MAG_AID_KIT_DESC_USE;
		mass = 2;
	};
};
