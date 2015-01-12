class CfgMagazines {
	class Default;
	class CA_magazine: Default {};
	class cse_backwardsCompatMagazineBase_FR: CA_magazine {};
	class cse_waterbottle: cse_backwardsCompatMagazineBase_FR {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Water Bottle";
	  picture = "\cse\cse_sys_field_rations\data\pictures\waterbottle.paa";
	  model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
	  descriptionShort = "A waterbottle";
	  mass = 5;
	  cse_isDrinkable = 3.75;
	  cse_onDrink = "cse_waterbottle_half";
	 };
	 class cse_canteen: cse_backwardsCompatMagazineBase_FR {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Canteen (Water)";
	  picture = "\cse\cse_sys_field_rations\data\pictures\image_canteen.paa";
	  model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
	  descriptionShort = "A Canteen containing water";
	  mass = 5;
	  cse_isDrinkable = 3.75;
	  cse_onDrink = "cse_canteen_half";
	 };
	 class cse_canteen_half: cse_canteen {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Canteen (Half)";
	  picture = "\cse\cse_sys_field_rations\data\pictures\image_canteen.paa";
	  model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
	  descriptionShort = "A Canteen containing water (Half)";
	  mass = 5;
	  cse_isDrinkable = 3.75;
	  cse_onDrink = "cse_canteen_empty";
	  cse_onRefill = "cse_canteen";
	 };
	 class cse_canteen_empty: cse_canteen {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Canteen (Empty)";
	  picture = "\cse\cse_sys_field_rations\data\pictures\image_canteen.paa";
	  model = "\A3\Structures_F_EPA\Items\Food\Canteen_F.p3d";
	  descriptionShort = "A Canteen containing water (Half)";
	  mass = 5;
	  cse_isDrinkable = 0;
	  cse_onDrink = "";
	  cse_onRefill = "cse_canteen";
	 };


	 class cse_waterbottle_half: cse_waterbottle {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Water Bottle 1/2";
	  picture = "\cse\cse_sys_field_rations\data\pictures\waterbottle.paa";
	  model ="\cse\cse_sys_field_rations\waterbottle.p3d";
	  descriptionShort = "Half full waterbottle";
	  cse_onDrink = "cse_waterbottle_empty";
	  cse_isDrinkable = 3.75;
	  se_onRefill = "cse_waterbottle";
	 };


	 class cse_waterbottle_empty: cse_waterbottle {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "Empty Water Bottle";
	  picture = "\cse\cse_sys_field_rations\data\pictures\waterbottle_empty.paa";
	  model ="\cse\cse_sys_field_rations\waterbottle.p3d";
	  descriptionShort = "An empty waterbottle";
	  cse_isDrinkable = 0;
	  cse_onRefill = "cse_waterbottle";
	  cse_onDrink = "";
	 };

	class cse_MRE_BASE: cse_waterbottle {
	  scope = 2;
	  value = 1;
	  count = 1;
	  type = 16;
	  displayName = "MRE";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE.paa";
	  model ="\cse\cse_sys_field_rations\mre_type1.p3d";
	  descriptionShort = "A Meal Ready to Eat, unprepared";
	  mass = 3;
	  cse_isEatable = 10;
	  cse_isDrinkable = 0;
	};

	class cse_MRE_LambC: cse_MRE_BASE {
	  displayName = "MRE Lamb Curry";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	  model ="\cse\cse_sys_field_rations\mre_type1.p3d";
	  descriptionShort = "An MRE containing Lamb Curry. Heat for best effect";
	 }; 
	class cse_MRE_LambC_prepared: cse_MRE_LambC {
	  displayName = "MRE Lamb Curry (Heated)";
	 };

	 class cse_MRE_Rice: cse_MRE_BASE {
	  displayName = "MRE Rice";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type2.paa";
	  model ="\cse\cse_sys_field_rations\mre_type2.p3d";
	  descriptionShort = "An MRE Containing Rice. Heat for best effect";
	 }; 
	class cse_MRE_Rice_prepared: cse_MRE_Rice {
	  displayName = "MRE Rice (Heated)";
	 }; 	 

	 class cse_MRE_CreamTomatoSoup: cse_MRE_BASE {
	  displayName = "MRE Cream Tomato Soup";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type3.paa";
	  model ="\cse\cse_sys_field_rations\mre_type3.p3d";
	  descriptionShort = "An MRE Containing Tomato Soup cream. Mix with water and heat for best effect";
	 }; 
	class cse_MRE_CreamTomatoSoup_prepared: cse_MRE_CreamTomatoSoup {
	  displayName = "MRE Cream Tomato Soup (Heated)";
	 }; 		 
	
	 class cse_MRE_CreamChickenSoup: cse_MRE_BASE {
	  displayName = "MRE Cream Chicken Soup";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type3.paa";
	  model ="\cse\cse_sys_field_rations\mre_type3.p3d";
	  descriptionShort = "An MRE Containing Chicken Soup. Mix with water and heat for best effect";
	 }; 
	class cse_MRE_CreamChickenSoup_prepared: cse_MRE_CreamChickenSoup {
	  displayName = "MRE Cream Chicken Soup (Heated)";
	 }; 

	class cse_MRE_ChickenTikkaMassala: cse_MRE_BASE {
	  displayName = "MRE Chicken Tikka Massala";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type4.paa";
	  model = "\cse\cse_sys_field_rations\mre_type4.p3d";
	  descriptionShort = "An MRE with Chicken Tikka Massala. Heat for best effect";
	 }; 
	class cse_MRE_ChickenTikkaMassala_prepared: cse_MRE_ChickenTikkaMassala {
	  displayName = "MRE Chicken Tikka Massala (Heated)";
	 }; 

	class cse_MRE_SteakVegetables: cse_MRE_BASE {
	  displayName = "MRE Steak & Vegetables";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type5.paa";
	  model ="\cse\cse_sys_field_rations\mre_type5.p3d";
	  descriptionShort = "An MRE Containing Steak & Vegetables. Heat for best effect";
	 }; 
	class cse_MRE_SteakVegetables_prepared: cse_MRE_SteakVegetables {
	  displayName = "MRE Steak & Vegetables (Heated)";
	 }; 

	class cse_MRE_MeatballsPasta: cse_MRE_BASE {
	  displayName = "MRE Meatballs & Pasta";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type6.paa";
	  model ="\cse\cse_sys_field_rations\mre_type6.p3d";
	  descriptionShort = "An MRE Containing Meatballs & Pasta. Heat for best effect";
	 }; 
	class cse_MRE_MeatballsPasta_prepared: cse_MRE_MeatballsPasta {
	  displayName = "MRE Meatballs & Pastas (Heated)";
	 }; 

	class cse_MRE_ChickenHerbDumplings: cse_MRE_BASE {
	  displayName = "MRE Chicken with Herb Dumplings";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type6.paa";
	  model ="\cse\cse_sys_field_rations\mre_type6.p3d";
	  descriptionShort = "An MRE Containing Chicken with Herb Dumplings. Heat for best effect";
	 }; 
	class cse_MRE_ChickenHerbDumplings_prepared: cse_MRE_ChickenHerbDumplings {
	  displayName = "MRE Chicken with Herb Dumplings (Heated)";
	 }; 

	 class cse_Humanitarian_Ration: cse_MRE_BASE {
	  displayName = "Humanitarian Ration";
	  picture = "\cse\cse_sys_field_rations\data\pictures\MRE_human.paa";
	  model ="\cse\cse_sys_field_rations\mre_human.p3d";
	  descriptionShort = "An Humanitarian Ration, for handing out to the local population";
	 };

	 class cse_US_MRE_ChiliBeans: cse_MRE_BASE  {
	   displayName = "Chile with Beans MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Chili with Beans";
	  }; 
	 class cse_US_MRE_ChiliBeans_prepared: cse_US_MRE_ChiliBeans {
	   displayName = "Chile with Beans MRE (Heated)";
	  };
	  class cse_US_MRE_ChickenFajita: cse_MRE_BASE {
	   displayName = "Chicken Fajita MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "A Chicken Fajita MRE";
	  }; 
	 class cse_US_MRE_ChickenFajita_prepared: cse_US_MRE_ChickenFajita {
	   displayName = "Chicken Fajita MRE (Heated)";
	  };
	  
	 class cse_US_MRE_ChickenNoodles: cse_MRE_BASE {
	   displayName = "Chicken with Noodles MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Chicken with Noodles";
	  }; 
	 class cse_US_MRE_ChickenNoodles_prepared: cse_US_MRE_ChickenNoodles {
	   displayName = "Chicken Fajita MRE(Heated)";
	  };
	  
	 class cse_US_MRE_PorkSausageGravy: cse_MRE_BASE {
	   displayName = "Pork Sausage with Gravy MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Pork Sausage with Gravy";
	  }; 
	 class cse_US_MRE_PorkSausageGravy_prepared: cse_US_MRE_PorkSausageGravy  {
	   displayName = "Pork Sausage Gravy MRE(Heated)";
	  };
	  
	 class cse_US_MRE_MedChicen: cse_MRE_BASE {
	   displayName = "Mediterranean Chicken MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Mediterranean Chicken";
	  }; 
	 class cse_US_MRE_MedChicken_prepared: cse_US_MRE_MedChicen {
	   displayName = "Mediterranean Chicken MRE(Heated)";
	  };
	  
	 class cse_US_MRE_BeefRoastVeggies: cse_MRE_BASE {
	   displayName = "Beef Roast with Veggies MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Beef Roast with Veggies";
	  }; 
	 class cse_US_MRE_BeefRoastVeggies_prepared: cse_US_MRE_BeefRoastVeggies {
	   displayName = "Beef Roast Veg MRE(Heated)";
	  };
	  
	 class cse_US_MRE_BeefBrisket: cse_MRE_BASE {
	   displayName = "Beef Brisket MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Beef Brisket";
	  }; 
	 class cse_US_MRE_BeefBrisket_prepared: cse_US_MRE_BeefBrisket {
	   displayName = "Beef Brisket MRE(Heated)";
	  };
	  
	 class cse_US_MRE_MeatballMarinara: cse_MRE_BASE {
	   displayName = "Meatball Marinara MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Meatballs with Marinara Sauce";
	  }; 
	 class cse_US_MRE_MeatballMarinara_prepared: cse_US_MRE_MeatballMarinara {
	   displayName = "Meatball Marinara(Heated)";
	  };
	  
	 class cse_US_MRE_BeefStew: cse_MRE_BASE {
	   displayName = "Beef Stew MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Beef Stew";
	  }; 
	 class cse_US_MRE_BeefStew_prepared: cse_US_MRE_BeefStew {
	   displayName = "Beef Stew MRE(Heated)";
	  };
	  
	 class cse_US_MRE_ChiliMacaroni: cse_MRE_BASE {
	   displayName = "Chile Macaroni MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Chile Macaroni";
	  }; 
	 class cse_US_MRE_ChileMacaroni_prepared: cse_US_MRE_ChiliMacaroni {
	   displayName = "Chile Macaroni MRE(Heated)";
	  };
	  
	 class cse_US_MRE_VegetableLasagna: cse_MRE_BASE {
	   displayName = "Vegetable Lasagna MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Vegetable Lasagna";
	  }; 
	 class cse_US_MRE_VegetableLasagna_prepared: cse_US_MRE_VegetableLasagna {
	   displayName = "Vegetable Lasagna MRE(Heated)";
	  };
	  
	 class cse_US_MRE_SpicyPennePasta: cse_MRE_BASE {
	   displayName = "Spicy Penne Pasta MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Spicy Penne Pasta";
	  }; 
	 class cse_US_MRE_SpicyPennePasta_prepared: cse_US_MRE_SpicyPennePasta {
	   displayName = "Spicy Penne Pasta MRE(Heated)";
	  };
	  
	 class cse_US_MRE_CheeseTortellini: cse_MRE_BASE {
	   displayName = "Cheese Tortellini MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing CheeseTortellini";
	  }; 
	 class cse_US_MRE_CheeseTortellini_prepared: cse_US_MRE_CheeseTortellini {
	   displayName = "Cheese Tortellini MRE(Heated)";
	  };
	  
	 class cse_US_MRE_Ratatouille: cse_MRE_BASE {
	   displayName = "Ratatouille MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Ratatouille";
	  };
	 class cse_US_MRE_Ratatouille_prepared: cse_US_MRE_Ratatouille {
	   displayName = "Ratatouille MRE (Heated)";
	  };

	 class cse_US_MRE_MexicanStyleChickenStew: cse_MRE_BASE {
	   displayName = "Mexican Style Chicken Stew MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE containing Mexican Style Chicken Stew";
	  };
	 class cse_US_MRE_MexicanStyleChickenStew_prepared: cse_US_MRE_MexicanStyleChickenStew {
	   displayName = "Mexican Style Chicken Stew MRE (Heated)";
	  };

	 class cse_US_MRE_PorkRib: cse_MRE_BASE {
	   displayName = "Pork Rib MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Pork Rib";
	  };
	 class cse_US_MRE_PorkRib_prepared: cse_US_MRE_PorkRib {
	   displayName = "Pork Rib MRE (Heated)";
	  };

	 class cse_US_MRE_MapleSausage: cse_MRE_BASE {
	   displayName = "Maple Sausage MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Maple Sausage";
	  };
	 class cse_US_MRE_MapleSausage_prepared: cse_US_MRE_MapleSausage {
	   displayName = "Maple Sausage MRE (Heated)";
	  };

	 class cse_US_MRE_BeefRavioli: cse_MRE_BASE {
	   displayName = "Beef Ravioli MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Beef Ravioli";
	  };
	 class cse_US_MRE_BeefRavioli_prepared: cse_US_MRE_BeefRavioli {
	   displayName = "Beef Ravioli MRE (Heated)";
	  };

	 class cse_US_MRE_SloppyJoe: cse_MRE_BASE {
	   displayName = "Sloppy Joe MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing a Sloppy Joe";
	  };
	 class cse_US_MRE_SloppyJoe_prepared: cse_US_MRE_SloppyJoe {
	   displayName = "Sloppy Joe MRE (Heated)";
	  };

	 class cse_US_MRE_SpaghettiMeatSauce: cse_MRE_BASE {
	   displayName = "Spaghetti with Meat Sauce MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Spaghetti with Meat Sauce";
	  };
	 class cse_US_MRE_SpaghettiMeatSauce_prepared: cse_US_MRE_SpaghettiMeatSauce {
	   displayName = "Spaghetti with Meat Sauce  MRE (Heated)";
	  };

	 class cse_US_MRE_LemonPepperTuna: cse_MRE_BASE {
	   displayName = " Lemon Pepper Tuna MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Lemon Pepper Tuna";
	  };
	 class cse_US_MRE_LemonPepperTuna_prepared: cse_US_MRE_LemonPepperTuna {
	   displayName = "Lemon Pepper Tuna MRE (Heated)";
	  };

	 class cse_US_MRE_AsianBeefStrips: cse_MRE_BASE {
	   displayName = "Asian Beef Strips MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Asian Beef Strips";
	  };
	 class cse_US_MRE_AsianBeefStrips_prepared: cse_US_MRE_AsianBeefStrips {
	   displayName = "Asian Beef Strips MRE (Heated)";
	  };

	 class cse_US_MRE_ChickenPestoPasta: cse_MRE_BASE {
	   displayName = "Chicken Pesto Pasta MRE";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Chicken Pesto Pasta";
	  };
	 class cse_US_MRE_ChickenPestoPasta_prepared: cse_US_MRE_ChickenPestoPasta {
	   displayName = "Chicken Pesto Pasta (Heated)";
	  };

	 class cse_US_MRE_SouthwestStyleBeefBlackBeans: cse_MRE_BASE {
	   displayName = "Southwest Style Beef & Black Beans";
	   picture = "\cse\cse_sys_field_rations\data\pictures\MRE_type1.paa";
	   descriptionShort = "An MRE Containing Southwest Style Beef & Black Beans";
	  };
	 class cse_US_MRE_SouthwestStyleBeefBlackBeans_prepared: cse_US_MRE_SouthwestStyleBeefBlackBeans {
	   displayName = "Southwest Style Beef & Black Beans (Heated)";
	  };

	 class cse_mre_c_ration: cse_MRE_BASE {
	   displayName = "C Ration";
	   picture = "\cse\cse_sys_field_rations\data\pictures\gbl_mre_c_ration.paa";
	   descriptionShort = "C ration";
	  };

};