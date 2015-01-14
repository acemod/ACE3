class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	class ACE_bandage_basic: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_BANDAGE_BASIC_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\field_dressing.paa));
		model = QUOTE(PATHTOF(equipment\bandages\fielddressing.p3d));
		descriptionShort = $STR_ACE_MAG_BANDAGE_BASIC_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_BANDAGE_BASIC_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=0.5;
			type=201;
		};
	};
	class ACE_packing_bandage: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_PACKING_BANDAGE_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\packing_bandage.paa));
		model = QUOTE(PATHTOF(equipment\bandages\packingbandage.p3d));
		descriptionShort = $STR_ACE_MAG_PACKING_BANDAGE_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_PACKING_BANDAGE_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_bandageElastic: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_BANDAGE_ELASTIC_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\bandageElastic.paa));
		model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
		descriptionShort = $STR_ACE_MAG_BANDAGE_ELASTIC_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_BANDAGE_ELASTIC_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_tourniquet: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_TOURNIQUET_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\tourniquet.paa));
		model = QUOTE(PATHTOF(equipment\Tourniquet.p3d));
		descriptionShort = $STR_ACE_MAG_TOURNIQUET_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_TOURNIQUET_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_splint: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_SPLINT_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\splint.paa));
		descriptionUse = $STR_ACE_MAG_SPLINT_DESC_USE;
		descriptionShort = $STR_ACE_MAG_SPLINT_DESC_SHORT;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_morphine: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_MORPHINE_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\morphine.paa));
		model = QUOTE(PATHTOF(equipment\Morphinpen.p3d));
		descriptionShort = $STR_ACE_MAG_MORPHINE_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_MORPHINE_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_atropine: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_ATROPINE_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\atropine.paa));
		model = QUOTE(PATHTOF(equipment\Atropin-pen.p3d));
		descriptionShort = $STR_ACE_MAG_ATROPINE_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_ATROPINE_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_epinephrine: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_EPINEPHRINE_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\epinephrine.paa));
		model = QUOTE(PATHTOF(equipment\Epipen.p3d));
		descriptionShort = $STR_ACE_MAG_EPINEPHRINE_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_EPINEPHRINE_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_plasma_iv: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		displayName = $STR_ACE_MAG_PLASMA_IV;
		picture = QUOTE(PATHTOF(equipment\img\plasma_iv.paa));
		descriptionShort = $STR_ACE_MAG_PLASMA_IV_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_PLASMA_IV_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_plasma_iv_500: cse_plasma_iv {
		displayName = $STR_ACE_MAG_PLASMA_IV_500;
	};
	class ACE_plasma_iv_250: cse_plasma_iv_500 {
		displayName = $STR_ACE_MAG_PLASMA_IV_250;
	};
	class ACE_blood_iv: ItemCore	{
		scope = 2;
		value = 1;
		count = 1;
		model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
		displayName = $STR_ACE_MAG_BLOOD_IV;
		picture = QUOTE(PATHTOF(equipment\img\bloodbag.paa));
		descriptionShort = $STR_ACE_MAG_BLOOD_IV_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_BLOOD_IV_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_blood_iv_500: cse_blood_iv {
		displayName = $STR_ACE_MAG_BLOOD_IV_500;
	};
	class ACE_blood_iv_250: cse_blood_iv_500 {
		displayName = $STR_ACE_MAG_BLOOD_IV_250;
	};
	class ACE_saline_iv: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		displayName = $STR_ACE_MAG_SALINE_IV;
		picture = QUOTE(PATHTOF(equipment\img\saline_iv.paa));
		descriptionShort = $STR_ACE_MAG_SALINE_IV_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_SALINE_IV_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_saline_iv_500: cse_saline_iv {
		displayName = $STR_ACE_MAG_SALINE_IV_500;
	};
	class ACE_saline_iv_250: cse_saline_iv_500 {
		displayName = $STR_ACE_MAG_SALINE_IV_250;
	};
	class ACE_quikclot: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_QUIKCLOT_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\quickclot.paa));
		descriptionShort = $STR_ACE_MAG_QUIKCLOT_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_QUIKCLOT_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_nasopharyngeal_tube: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_NPA_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\nasopharyngeal_tube.paa));
		descriptionUse = $STR_ACE_MAG_NPA_DESC_USE;
		descriptionShort = $STR_ACE_MAG_NPA_DESC_SHORT;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_opa: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_OPA_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\nasopharyngeal_tube.paa));
		descriptionShort = $STR_ACE_MAG_OPA_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_OPA_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_liquidSkin: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_LIQUID_SKIN_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\liquidSkin.paa));
		model = QUOTE(PATHTOF(equipment\skinliquid.p3d));
		descriptionShort = $STR_ACE_MAG_LIQUID_SKIN_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_LIQUID_SKIN_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_chestseal: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_CHEST_SEAL_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\chestseal.paa));
		descriptionShort = $STR_ACE_MAG_CHEST_SEAL_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_CHEST_SEAL_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
		};
	};
	class ACE_personal_aid_kit: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = $STR_ACE_MAG_AID_KIT_DISPLAY;
		picture = QUOTE(PATHTOF(equipment\img\personal_aid_kit.paa));
		model = QUOTE(PATHTOF(equipment\Personal-aidkits\MTP.p3d));
		descriptionShort = $STR_ACE_MAG_AID_KIT_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_AID_KIT_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
		};
	};
	class ACE_surgical_kit: ItemCore
	{
		scope=2;
		displayName= $STR_ACE_MAG_SURGICALKIT_DISPLAY;
		model = QUOTE(PATHTOF(equipment\surgical_kit.p3d));
		picture = QUOTE(PATHTOF(equipment\img\surgical_kit.paa));
		descriptionShort = $STR_ACE_MAG_SURGICALKIT_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_SURGICALKIT_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass= 5;
			type=201;
		};
	};
	class ACE_itemBodyBag: ItemCore
	{
		scope=2;
		displayName= $STR_ACE_MAG_BODYBAG_DISPLAY;
		model = QUOTE(PATHTOF(equipment\bodybagItem.p3d));
		picture = QUOTE(PATHTOF(equipment\img\bodybag.paa));
		descriptionShort = $STR_ACE_MAG_BODYBAG_DESC_SHORT;
		descriptionUse = $STR_ACE_MAG_BODYBAG_DESC_USE;
		class ItemInfo: InventoryItem_Base_F
		{
			mass= 15;
			type=201;
		};
	};
};
