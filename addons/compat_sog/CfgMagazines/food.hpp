#define DRINKING_ANIMS \
    EXGVAR(field_rations,consumeAnims)[] = { \
        QEGVAR(field_rations,drinkStand), \
        QEGVAR(field_rations,drinkCrouch), \
        QEGVAR(field_rations,drinkProne) \
    }
#define DRINKING_SOUNDS \
    EXGVAR(field_rations,consumeSounds)[] = { \
        QEGVAR(field_rations,drink1), \
        QEGVAR(field_rations,drink1), \
        QEGVAR(field_rations,drink2) \
    }

class vn_prop_base;

// US Canteen 0.75l
class vn_prop_drink_01: vn_prop_base {
    // assuming 250ml = 5% of thirst
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 15;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// US Canteen 1.0l
class vn_prop_drink_02: vn_prop_drink_01 {
    EXGVAR(field_rations,thirstQuenched) = 20;
    EXGVAR(field_rations,replacementItem) = "ACE_Canteen_Empty";
};

// NVA Canteen 0.76l
class vn_prop_drink_03: vn_prop_drink_01 {
    EXGVAR(field_rations,thirstQuenched) = 16;
};

// NVA Canteen 1.1l
class vn_prop_drink_04: vn_prop_drink_01 {
    EXGVAR(field_rations,thirstQuenched) = 22;
    EXGVAR(field_rations,replacementItem) = "ACE_Canteen_Empty";
};

// Bottle 0.5l
class vn_prop_drink_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Bottle 2.0l
class vn_prop_drink_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 40;

    EXGVAR(field_rations,consumeTime) = 15;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Tilts Hot Sauce
class vn_prop_drink_07_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Hoangs Muoc Mam
class vn_prop_drink_07_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Napalm Sauce
class vn_prop_drink_07_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Savage Bia (Beer)
class vn_prop_drink_08_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 10;
    EXGVAR(field_rations,hungerSatiated) = 2; // beer is food too ;)

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Whiskey
class vn_prop_drink_09_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 5;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Water pack 2.0l
class vn_prop_drink_10: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,thirstQuenched) = 40;

    EXGVAR(field_rations,consumeTime) = 15;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Ration 0.75Kg
class vn_prop_food_meal_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 15;

    EXGVAR(field_rations,consumeTime) = 10;
};

// Fox Hole Dinner for Two. Chicken and Noodles + Turkey Loaf + Cheese Spread + Hot sauce
class vn_prop_food_meal_01_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Soup Du Jour. Ham and Lima Beans + Crackers + Hot sauce
class vn_prop_food_meal_01_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Breast of Chicken Under Bullets. Boned Chicken + Cheese Spread + White Bread + Hot sauce
class vn_prop_food_meal_01_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Battlefield Fufu. Boned Chicken + Peanut Butter + Milk + Hot sauce
class vn_prop_food_meal_01_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Ham with Spiced Apricots. Fried Ham + Apricots + Jam + Hot sauce
class vn_prop_food_meal_01_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Pork Mandarin. Pork-steak + Hot sauce
class vn_prop_food_meal_01_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Tin Can Casserole. Frank and Beans + Beefsteak + Crackers + Cheese Spread + Hot sauce
class vn_prop_food_meal_01_07: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Creamed Turkey on Toast. Turkey loaf + White Bread + Hot sauce
class vn_prop_food_meal_01_08: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Fish with Front line Stuffing. Crackers + Ham and Egg Chopped + Hot sauce
class vn_prop_food_meal_01_09: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Combat Zone Burgoo. Spiced Beef + Ham and Lima Beans + Crackers + Hot sauce
class vn_prop_food_meal_01_10: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Patrol Chicken Soup. Fresh Chicken + Crackers + Hot sauce
class vn_prop_food_meal_01_11: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Guard Relief Eggs Benedict. White Bread + Ham and Eggs Chopped + Cheese Spread + Hot sauce
class vn_prop_food_meal_01_12: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Beefsteak En Croute. White Bread + Beefsteak + Hot sauce
class vn_prop_food_meal_01_13: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Curried Meat Balls Over Rice. Meat Balls and Beans + Hot sauce
class vn_prop_food_meal_01_14: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Cease Fire Casserole. Beefsteak + Spiced Beef + Hot sauce
class vn_prop_food_meal_01_15: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Rice Paddy Shrimp. Fresh Shrimp + Cheese Spread + Hot sauce
class vn_prop_food_meal_01_16: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Battlefield Birthday Cake. Pound Cake + Chocolate Candy + Hot sauce
class vn_prop_food_meal_01_17: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Pecan Cake Roll with Peanut Butter Sauce. Pecan Cake Roll + Peanut Butter + Hot sauce
class vn_prop_food_meal_01_18: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Con ho. Rice + Tiger + Vegetables + Fish Sauce
class vn_prop_food_meal_02_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Con voi. Rice + Elephant + Vegetables + Fish Sauce
class vn_prop_food_meal_02_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Con ran. Rice + Snake + Vegetables + Fish Sauce
class vn_prop_food_meal_02_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Cha ca la vong. Rice + Fish + Vegetables + Fish Sauce
class vn_prop_food_meal_02_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Con tom. Rice + Shrimp + Vegetables + Fish sauce
class vn_prop_food_meal_02_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Pho ga. Rice + Chicken + Vegetables + Fish sauce
class vn_prop_food_meal_02_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// PIR Rations. Contains 1Kg of high energy food: PIR ration (Beef)
class vn_prop_food_pir_01_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// PIR Rations. Contains 1Kg of high energy food: PIR ration (Fish and Squid)
class vn_prop_food_pir_01_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// PIR Rations. Contains 1Kg of high energy food: PIR ration (Shrimp and Mushroom)
class vn_prop_food_pir_01_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// PIR Rations. Contains 1Kg of high energy food: PIR ration (Mutton)
class vn_prop_food_pir_01_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// PIR Rations. Contains 1Kg of high energy food: PIR ration (Sausage)
class vn_prop_food_pir_01_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 10Kg of food: Ration box (LRP Ration Box)
class vn_prop_food_box_01_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 100;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 10Kg of food: Ration box (PIR Ration Box)
class vn_prop_food_box_01_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 100;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 10Kg of food: Ration box (MCI Ration Box)
class vn_prop_food_box_01_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 100;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Ham and Eggs Chopped)
class vn_prop_food_box_02_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Ham Fried)
class vn_prop_food_box_02_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Beans w/ Frankfurter Chunks)
class vn_prop_food_box_02_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Spaghetti w/ Ground Meat)
class vn_prop_food_box_02_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Turkey Loaf)
class vn_prop_food_box_02_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Pork Steak)
class vn_prop_food_box_02_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Beef w/ Spiced Sauce)
class vn_prop_food_box_02_07: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Boxed Rations. Contains 2Kg of food: Ration box (Chicken Boned)
class vn_prop_food_box_02_08: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 50;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Beefsteak)
class vn_prop_food_can_01_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Spiced Sauce)
class vn_prop_food_can_01_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Turkey Loaf)
class vn_prop_food_can_01_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Ham, Fried)
class vn_prop_food_can_01_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Ham and Eggs Chopped)
class vn_prop_food_can_01_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Tuna)
class vn_prop_food_can_01_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Chicken and Noodles)
class vn_prop_food_can_01_07: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Chicken Boned)
class vn_prop_food_can_01_08: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Pork Slices with Juices)
class vn_prop_food_can_01_09: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (B-1A Unit Crackers and Candy)
class vn_prop_food_can_01_10: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (B-2 Unit Crackers and Cheese Spread)
class vn_prop_food_can_01_11: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Pound Cake)
class vn_prop_food_can_01_12: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Pecan Cake Roll)
class vn_prop_food_can_01_13: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Chocolate Nut Roll)
class vn_prop_food_can_01_14: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (Fruitcake)
class vn_prop_food_can_01_15: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.5Kg of food: Ration can (White Bread)
class vn_prop_food_can_01_16: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 25;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Beans w/ Meat Balls in Tomato Sauce)
class vn_prop_food_can_02_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Ham and Lima Beans)
class vn_prop_food_can_02_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Beans w/ Frankfurter Chunks in Tomato Sauce)
class vn_prop_food_can_02_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Spaghetti w/ Ground Meat)
class vn_prop_food_can_02_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (B-3 Unit Cookies, Jam and Cocoa Beverage Powder)
class vn_prop_food_can_02_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Apricots)
class vn_prop_food_can_02_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Peaches)
class vn_prop_food_can_02_07: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.75Kg of food: Ration can (Pears)
class vn_prop_food_can_02_08: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.3Kg of food: Ration can (Peanut Butter)
class vn_prop_food_can_03_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 15;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.3Kg of food: Ration can (Jam, Seedless Blackberry)
class vn_prop_food_can_03_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 15;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.3Kg of food: Ration can (Pineapple Jam)
class vn_prop_food_can_03_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 15;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Canned Rations. Contains 0.3Kg of food: Ration can (Cheese Spread)
class vn_prop_food_can_03_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 15;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Orange
class vn_prop_food_fresh_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 10;
    EXGVAR(field_rations,thirstQuenched) = 10;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Pumpik 3Kg
class vn_prop_food_fresh_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,thirstQuenched) = 5;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Chicken 3Kg
class vn_prop_food_fresh_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 35;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Shrimp 3Kg
class vn_prop_food_fresh_04: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Fish 3Kg
class vn_prop_food_fresh_05: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Pork 3Kg
class vn_prop_food_fresh_06: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 35;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Snake 3Kg
class vn_prop_food_fresh_07: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Tiger 3Kg
class vn_prop_food_fresh_08: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Elephant 3Kg
class vn_prop_food_fresh_09: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Rau Ma 3Kg
class vn_prop_food_fresh_10: vn_prop_food_fresh_03 {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 30;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Beef Hash)
class vn_prop_food_lrrp_01_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Chili Con Carne)
class vn_prop_food_lrrp_01_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Spaghetti w/ Meat Sauce)
class vn_prop_food_lrrp_01_03: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Beef and Rice)
class vn_prop_food_lrrp_01_04: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Chicken Stew)
class vn_prop_food_lrrp_01_05: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Pork w/ Escalloped Potatoes)
class vn_prop_food_lrrp_01_06: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Beef Stew)
class vn_prop_food_lrrp_01_07: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// LRRP Rations. Contains 1Kg of high energy food: LRRP ration (Chicken and Rice)
class vn_prop_food_lrrp_01_08: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 90;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Rice 1Kg
class vn_prop_food_sack_01: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 5;
    EXGVAR(field_rations,consumeTime) = 10;
};

// Rice 4Kg
class vn_prop_food_sack_02: vn_prop_base {
    ACE_asItem = 1;
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,consumeTime) = 10;
};
