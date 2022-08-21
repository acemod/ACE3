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
    EXGVAR(field_rations,thirstQuenched) = 10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Bottle 2.0l
class vn_prop_drink_06: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = 40;

    EXGVAR(field_rations,consumeTime) = 15;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Tilts Hot Sauce
class vn_prop_drink_07_01: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Hoangs Muoc Mam
class vn_prop_drink_07_02: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Napalm Sauce
class vn_prop_drink_07_03: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = -10;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Savage Bia (Beer)
class vn_prop_drink_08_01: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = 10;
    EXGVAR(field_rations,hungerSatiated) = 2; // beer is food too ;)

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Whiskey
class vn_prop_drink_09_01: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = 5;

    EXGVAR(field_rations,consumeTime) = 10;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Water pack 2.0l
class vn_prop_drink_10: vn_prop_base {
    EXGVAR(field_rations,thirstQuenched) = 40;

    EXGVAR(field_rations,consumeTime) = 15;
    DRINKING_ANIMS;
    DRINKING_SOUNDS;
};

// Ration 0.75Kg
class vn_prop_food_meal_01: vn_prop_base {
    // assuming 0.25Kg = 5% of hunger
    EXGVAR(field_rations,hungerSatiated) = 15;

    EXGVAR(field_rations,consumeTime) = 10;
};

// Fox Hole Dinner for Two. Chicken and Noodles + Turkey Loaf + Cheese Spread + Hot sauce
class vn_prop_food_meal_01_01: vn_prop_base {
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

// Soup Du Jour. Ham and Lima Beans + Crackers + Hot sauce
class vn_prop_food_meal_01_02: vn_prop_base {
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};

class vn_prop_food_meal_01_03: vn_prop_base {
    EXGVAR(field_rations,hungerSatiated) = 20;
    EXGVAR(field_rations,thirstQuenched) = -1; // hot!

    EXGVAR(field_rations,consumeTime) = 10;
};
