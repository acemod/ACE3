class CfgMagazines
{
	class Default;
	class ItemCore: Default
    {
        type = 131072;
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = "\A3\Weapons_F\Data\clear_empty.paa";
        muzzles[] = {};

        class Armory
        {
            disabled = 0;
        };
    };
	
	class Jak_Waterbottle_Full: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = "Water Bottle (Full)";
		picture = "\jak_food\data\Jak_UI_Waterbottle_Full.paa";
		model = "\jak_food\Jak_Waterbottle.p3d";
		descriptionShort = "A full waterbottle.";
		mass = 4;
	};

	class Jak_Waterbottle_Part: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = "Water Bottle (Part)";
		picture = "\jak_food\data\Jak_UI_Waterbottle_Full.paa";
		model = "\jak_food\Jak_Waterbottle.p3d";
		descriptionShort = "A half full waterbottle.";
		mass = 3;
	};

	class Jak_Waterbottle_Empty: ItemCore
	{
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = "Water Bottle (Empty)";
		picture = "\jak_food\data\Jak_UI_Waterbottle_Empty.paa";
		model = "\jak_food\Jak_Waterbottle.p3d";
		descriptionShort = "An empty waterbottle.";
		mass = 2;
	};

	class Jak_MRE_Base: ItemCore
	{
		scope = 0;
		value = 1;
		count = 1;
		type = 16;
		displayName = "MRE Base";
		picture = "\jak_food\data\Jak_UI_Mre.paa";
		model = "\jak_food\jak_mre.p3d";
		descriptionShort = "A Meal Ready to Eat, unprepared.";
		mass = 5;
		hiddenSelections[] = {"Type"};
	};

	class Jak_MRE_LambCurry: Jak_MRE_Base
	{
		scope = 2;
		displayName = "MRE: Lamb Curry (Cold)";
		picture = "\jak_food\data\Jak_UI_Mre_Type1.paa";
		descriptionShort = "A lamb curry MRE. Heat for best effect.";
		hiddenSelectionsTextures[] = {"\jak_food\data\Jak_MRE_Type1.paa"};
	};

	class Jak_MRE_LambCurry_Hot: Jak_MRE_LambCurry
	{
		displayName = "MRE: Lamb Curry (Hot)";
	};

	class Jak_MRE_Rice: Jak_MRE_Base
	{
		scope = 2;
		displayName = "MRE: Rice (Cold)";
		picture = "\jak_food\data\Jak_UI_Mre_Type2.paa";
		descriptionShort = "A rice MRE. Heat for best effect.";
		hiddenSelectionsTextures[] = {"\jak_food\data\Jak_MRE_Type1.paa"};
	};

	class Jak_MRE_Rice_Hot: Jak_MRE_Rice
	{
		displayName = "MRE: Rice (Hot)";
	};
};