// IMPORT BASE CLASSES
#define IMPORT_BASE_CLASSES\
class EGVAR(wardrobe,base);\
class EGVAR(wardrobe,base_H_visor_up);\
class EGVAR(wardrobe,base_H_visor_down);\
class EGVAR(wardrobe,base_H_goggles_on);\
class EGVAR(wardrobe,base_H_goggles_off);\
class EGVAR(wardrobe,base_H_mask_on);\
class EGVAR(wardrobe,base_H_mask_off);\
class EGVAR(wardrobe,base_U_sleeves_up);\
class EGVAR(wardrobe,base_U_sleeves_down);\
class EGVAR(wardrobe,base_U_gloves_on);\
class EGVAR(wardrobe,base_U_gloves_off);\
class EGVAR(wardrobe,base_U_jacket_open);\
class EGVAR(wardrobe,base_U_jacket_closed)


// REPLACE
#define INTEL_PRE(varName,className)\
private varName = _magazineDetails findIf { _x select 0 == QUOTE(className) } > -1;\
if (varName) then { varName = [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex apply { _x call FUNC(getIndexFromMagID) } }

#define INTEL_POST(varName,className)\
if (varName isEqualType []) then { { [_x, varName select _forEachIndex] call FUNC(setIndexForMagID); } forEach ( [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex ); }


// Config
// Adjust Weight of CfgWeapons Wearables
#define MASS(var)\
class ItemInfo: ItemInfo {\
    mass = var;\
}


// CfgWardrobe Base Uniform Macro
// Uniform Sleeves Up/Down
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
BASIC(variant1,variant2,EGVAR(wardrobe,base),EGVAR(wardrobe,base))

#define UNIFORM_SLEEVES(variantSleevesDown,variantSleevesUp)\
BASIC(variantSleevesDown,variantSleevesUp,EGVAR(wardrobe,base_U_sleeves_down),EGVAR(wardrobe,base_U_sleeves_up))

#define UNIFORM_GLOVES(variantGlovesOn,variantGlovesOff)\
BASIC(variantGlovesOn,variantGlovesOff,EGVAR(wardrobe,base_U_gloves_on),EGVAR(wardrobe,base_U_gloves_off))

#define UNIFORM_JACKET(variantJacketOpen,variantJacketClosed)\
BASIC(variantJacketOpen,variantJacketClosed,EGVAR(wardrobe,base_U_jacket_open),EGVAR(wardrobe,base_U_jacket_closed))

#define HELMET_VISOR(variantVisorUp,variantVisorDown)\
BASIC(variantVisorUp,variantVisorDown,EGVAR(wardrobe,base_H_visor_up),EGVAR(wardrobe,base_H_visor_down))

#define HELMET_MASK(variantMaskOn,variantMaskOff)\
BASIC(variantMaskOn,variantMaskOff,EGVAR(wardrobe,base_H_mask_on),EGVAR(wardrobe,base_H_mask_off))

// Basic Setups with the use of Component
#define HELMET_GOGGLES(variantGogglesOn,variantGogglesOff,component)\
BASIC_COMPONENT(variantGogglesOn,variantGogglesOff,EGVAR(wardrobe,base_H_goggles_on),EGVAR(wardrobe,base_H_goggles_off),component)

// Basic Combo
#define HELMET_CAP_COMBO(Combo,Helmet,Cap)\
BASIC_COMBO(Combo,EGVAR(wardrobe,base),Helmet,EGVAR(wardrobe,base),Cap,EGVAR(wardrobe,base))
