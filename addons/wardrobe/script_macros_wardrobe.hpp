// Config
// Adjust Weight of CfgWeapons Wearables
#define MASS(var)\
class ItemInfo: ItemInfo {\
    mass = var;\
}


// CfgWardrobe Macros
#define ACEWARDROBE(var) TRIPLES(ace,wardrobe,var)

#define BASIC(variant1,variant2,base1,base2)\
class variant1: base1 {\
    class modifiableTo {\
        class variant2 {};\
    };\
};\
class variant2: base2 {\
    class modifiableTo {\
        class variant1 {};\
    };\
}

#define BASIC_COMPONENT(variantWith,variantWithout,baseWith,baseWithout,component)\
class variantWith: baseWith {\
    class modifiableTo {\
        class variantWithout {};\
    };\
    components[] = {QUOTE(component)};\
};\
class variantWithout: baseWithout {\
    class modifiableTo {\
        class variantWith {};\
    };\
}

#define BASIC_COMBO(Combo,ComboBase,Variant1,Variant1Base,Variant2,Variant2Base)\
class Combo: ComboBase {\
    class modifiableTo {\
        class Variant1 {};\
        class Variant2 {};\
    };\
    components[] = { QUOTE(Variant1), QUOTE(Variant2) };\
};\
class Variant1: Variant1Base {\
    class modifiableTo {\
        class Combo {};\
    };\
    components[] = { QUOTE(Variant1) };\
};\
class Variant2: Variant2Base {\
    class modifiableTo {\
        class Combo {};\
    };\
    components[] = { QUOTE(Variant2) };\
}


// Basic Setups without the use of Components
#define BASE_PAIR(variant1,variant2)\
BASIC(variant1,variant2,ACEWARDROBE(base),ACEWARDROBE(base))

#define UNIFORM_SLEEVES(variantSleevesDown,variantSleevesUp)\
BASIC(variantSleevesDown,variantSleevesUp,ACEWARDROBE(base_U_sleeves_down),ACEWARDROBE(base_U_sleeves_up))

#define UNIFORM_GLOVES(variantGlovesOn,variantGlovesOff)\
BASIC(variantGlovesOn,variantGlovesOff,ACEWARDROBE(base_U_gloves_on),ACEWARDROBE(base_U_gloves_off))

#define UNIFORM_JACKET(variantJacketOpen,variantJacketClosed)\
BASIC(variantJacketOpen,variantJacketClosed,ACEWARDROBE(base_U_jacket_open),ACEWARDROBE(base_U_jacket_closed))

#define HELMET_VISOR(variantVisorUp,variantVisorDown)\
BASIC(variantVisorUp,variantVisorDown,ACEWARDROBE(base_H_visor_up),ACEWARDROBE(base_H_visor_down))

#define HELMET_MASK(variantMaskOn,variantMaskOff)\
BASIC(variantMaskOn,variantMaskOff,ACEWARDROBE(base_H_mask_on),ACEWARDROBE(base_H_mask_off))

// Basic Setups with the use of Component
#define HELMET_GOGGLES(variantGogglesOn,variantGogglesOff,component)\
BASIC_COMPONENT(variantGogglesOn,variantGogglesOff,ACEWARDROBE(base_H_goggles_on),ACEWARDROBE(base_H_goggles_off),component)

// Basic Combo
#define HELMET_CAP_COMBO(Combo,Helmet,Cap)\
BASIC_COMBO(Combo,ACEWARDROBE(base),Helmet,ACEWARDROBE(base),Cap,ACEWARDROBE(base))
