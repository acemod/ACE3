// REPLACE
#define INTEL_PRE(varName,className)\
private varName = _magazineDetails findIf { _x select 0 == QUOTE(className) } > -1;\
if (varName) then { varName = [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex apply { [_x] call FUNC(getIndexFromMagID) } }

#define INTEL_POST(varName,className)\
if (varName isEqualType []) then { { [_x, varName select _forEachIndex] call FUNC(setIndexForMagID); } forEach ( [_player, QUOTE(className)] call CBA_fnc_getMagazineIndex ); }


// Config
//// Adjust Weight of CfgWeapons Wearables.
#define MASS(var)\
class ItemInfo: ItemInfo {\
    mass = var;\
}


// CfgWardrobe Base Uniform Macro
// Uniform Sleeves Up/Down
#define BASIC(variant1,variant2,base1,base2)\
class variant1: base1 {\
    class modifiableTo {\
        class variant2;\
    };\
};\
class variant2: base2 {\
    class modifiableTo {\
        class variant1;\
    };\
}

#define BASIC_COMPONENT(variantWith,variantWithout,baseWith,baseWithout,component)\
class variantWith: baseWith {\
    class modifiableTo {\
        class variantWithout;\
    };\
    components[] = {QUOTE(component)};\
};\
class variantWithout: baseWithout {\
    class modifiableTo {\
        class variantWith;\
    };\
}

// Basic
#define UNIFORM_SLEEVES(variantSleevesDown,variantSleevesUp)\
BASIC(variantSleevesDown,variantSleevesUp,EGVAR(wardrobe,base_U_sleeves_down),EGVAR(wardrobe,base_U_sleeves_up))

#define UNIFORM_GLOVES(variantGlovesOn,variantGlovesOff)\
BASIC(variantGlovesOn,variantGlovesOff,EGVAR(wardrobe,base_U_gloves_on),EGVAR(wardrobe,base_U_gloves_off))

#define UNIFORM_JACKET(variantJacketOpen,variantJacketClosed)\
BASIC(variantJacketOpen,variantJacketClosed,EGVAR(wardrobe,base_U_jacket_open),EGVAR(wardrobe,base_U_jacket_closed))

#define HELMET_VISOR(variantVisorUp,variantVisorDown)\
BASIC(variantVisorUp,variantVisorDown,EGVAR(wardrobe,base_H_visor_up),EGVAR(wardrobe,base_H_visor_down))

// Basic Component
#define HELMET_GOGGLES(variantGogglesOn,variantGogglesOff,component)\
BASIC_COMPONENT(variantGogglesOn,variantGogglesOff,EGVAR(wardrobe,base_H_goggles_on),EGVAR(wardrobe,base_H_goggles_off),component)

