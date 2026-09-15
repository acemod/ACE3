// Config
// Adjust Weight of CfgWeapons Wearables
#define MASS(var)\
class ItemInfo: ItemInfo {\
    mass = var;\
}


// CfgWardrobe Macros
#define ACEWARDROBE(var) TRIPLES(ace,wardrobe,var)
#define ACEWARDROBE_CSTRING(var) QUOTE(TRIPLES($STR,DOUBLES(ace,wardrobe),var))

// BASIC Macros
// baseclass as variable of macro
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

#define BASIC_TRIPLET(variant1,variant2,variant3,base1,base2,base3)\
class variant1: base1 {\
    class modifiableTo {\
        class variant2 {};\
        class variant3 {};\
    };\
};\
class variant2: base2 {\
    class modifiableTo {\
        class variant1 {};\
        class variant3 {};\
    };\
};\
class variant3: base3 {\
    class modifiableTo {\
        class variant1 {};\
        class variant2 {};\
    };\
}


// BASE MACROS
// default baseclass

// Simple Setups without the use of Components
#define BASE_PAIR(variant1,variant2)\
BASIC(variant1,variant2,ACEWARDROBE(base),ACEWARDROBE(base))

#define BASE_TRIPLET(variant1,variant2,variant3)\
BASIC_TRIPLET(variant1,variant2,variant3,ACEWARDROBE(base),ACEWARDROBE(base),ACEWARDROBE(base))


// HELMETS
#define HELMET_VISOR(variantVisorUp,variantVisorDown)\
BASIC(variantVisorUp,variantVisorDown,ACEWARDROBE(base_H_visor_up),ACEWARDROBE(base_H_visor_down))

#define HELMET_MASK(variantMaskOn,variantMaskOff)\
BASIC(variantMaskOn,variantMaskOff,ACEWARDROBE(base_H_mask_on),ACEWARDROBE(base_H_mask_off))

#define HELMET_CAP_COMBO(Combo,Helmet,Cap)\
BASIC_COMBO(Combo,ACEWARDROBE(base),Helmet,ACEWARDROBE(base),Cap,ACEWARDROBE(base))

#define HELMET_GOGGLES(variantGogglesOn,variantGogglesOff,component)\
BASIC_COMPONENT(variantGogglesOn,variantGogglesOff,ACEWARDROBE(base_H_goggles_on),ACEWARDROBE(base_H_goggles_off),component)

#define HELMET_GOGGLES_NOCOMPONENT(HelmetGogglesUp,HelmetGogglesDown)\
class HelmetGogglesUp: ACEWARDROBE(base_H_goggles_off) {\
    class modifiableTo {\
        class HelmetGogglesDown {};\
    };\
};\
class HelmetGogglesDown: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetGogglesUp {};\
    };\
}

// Helmet with Goggles on, and Cover Front or Back
#define HELMET_GOGGLES_COVER(HelmetBase,HelmetGoggles,HelmetCoverFront,HelmetCoverBack,Goggles)\
class HelmetBase: ACEWARDROBE(base_H_goggles_off) {\
    class modifiableTo {\
        class HelmetGoggles {};\
    };\
};\
class HelmetGoggles: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetCoverFront {};\
        class HelmetCoverBack {};\
    };\
    components[] = {QUOTE(Goggles)};\
};\
class HelmetCoverFront: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetGoggles {};\
        class HelmetCoverBack {};\
    };\
    components[] = {QUOTE(Goggles)};\
};\
class HelmetCoverBack: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetCoverFront {};\
        class HelmetGoggles {};\
    };\
    components[] = {QUOTE(Goggles)};\
}

// Boonie Hat with a Variant with Rolled Up Sides
#define BOONIE_ROLLED(Boonie,BoonieRolled)\
class Boonie: ACEWARDROBE(base) {\
    class modifiableTo {\
        class BoonieRolled {};\
    };\
};\
class BoonieRolled: ACEWARDROBE(base) {\
    class modifiableTo {\
        class Boonie {};\
    };\
}

// Helmet with 2 Variants and Goggles
#define HELMET_2VARIANTS_GOGGLES(HelmetV1,HelmetV2,HelmetV1Goggles,HelmetV2Goggles,Component)\
class HelmetV1: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetV2 {};\
        class HelmetV1Goggles {};\
    };\
};\
class HelmetV2: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetV1 {};\
        class HelmetV2Goggles {};\
    };\
};\
class HelmetV1Goggles: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetV2Goggles {};\
        class HelmetV1 {};\
    };\
    components[] = { QUOTE(Component) };\
};\
class HelmetV2Goggles: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetV1Goggles {};\
        class HelmetV2 {};\
    };\
    components[] = { QUOTE(Component) };\
}

// Helmets with a Scrim and No Scrim Version
#define HELMET_SCRIM(HelmetBase,HelmetScrim)\
class HelmetBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetScrim {\
            displayName = ACEWARDROBE_CSTRING(foliageAdd);\
        };\
    };\
};\
class HelmetScrim: ACEWARDROBE(base) {\
    class modifiableTo {\
        class HelmetBase {\
            displayName = ACEWARDROBE_CSTRING(foliageRemove);\
        };\
    };\
}


// UNIFORMS
#define UNIFORM_SLEEVES(variantSleevesDown,variantSleevesUp)\
BASIC(variantSleevesDown,variantSleevesUp,ACEWARDROBE(base_U_sleeves_down),ACEWARDROBE(base_U_sleeves_up))

#define UNIFORM_GLOVES(variantGlovesOn,variantGlovesOff)\
BASIC(variantGlovesOn,variantGlovesOff,ACEWARDROBE(base_U_gloves_on),ACEWARDROBE(base_U_gloves_off))

#define UNIFORM_JACKET(variantJacketOpen,variantJacketClosed)\
BASIC(variantJacketOpen,variantJacketClosed,ACEWARDROBE(base_U_jacket_open),ACEWARDROBE(base_U_jacket_closed))

#define UNIFORM_HOOD(variantHoodRaised,variantHoodLowered)\
BASIC(variantHoodRaised,variantHoodLowered,ACEWARDROBE(base_U_hood_raised),ACEWARDROBE(base_U_hood_lowered))

#define UNIFORM_TIE(varianTieOn,variantTieOff)\
BASIC(varianTieOn,variantTieOff,ACEWARDROBE(base_U_tie_on),ACEWARDROBE(base_U_tie_off))

// Uniform with Variants for Gloves, Rolled Up and Combined Gloves+Rolled Up
#define UNIFORM_GLOVES_ROLLED(UniformBase,UniformGloves,UniformRolled,UniformGlovesRolled)\
class UniformBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformGloves {};\
        class UniformRolled {};\
    };\
};\
class UniformGloves: ACEWARDROBE(base_U_gloves_on) {\
    class modifiableTo {\
        class UniformBase {};\
        class UniformGlovesRolled {};\
    };\
};\
class UniformRolled: ACEWARDROBE(base_U_sleeves_up) {\
    class modifiableTo {\
        class UniformBase {};\
        class UniformGlovesRolled {};\
    };\
};\
class UniformGlovesRolled: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformGloves {};\
        class UniformRolled {};\
    };\
}

// Uniform with Gloves as Component, and Sleeves Rolled up and Combined
#define UNIFORM_GLOVES_ROLLED_COMPONENT(UniformBase,UniformGloves,UniformRolled,UniformGlovesRolled,Gloves)\
class UniformBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformGloves {};\
        class UniformRolled {};\
    };\
};\
class UniformGloves: ACEWARDROBE(base_U_gloves_on) {\
    class modifiableTo {\
        class UniformBase {};\
        class UniformGlovesRolled {};\
    };\
    components[] = {QUOTE(Gloves)};\
};\
class UniformRolled: ACEWARDROBE(base_U_sleeves_up) {\
    class modifiableTo {\
        class UniformBase {};\
        class UniformGlovesRolled {};\
    };\
};\
class UniformGlovesRolled: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformGloves {};\
        class UniformRolled {};\
    };\
    components[] = {QUOTE(Gloves)};\
}

// Uniform with Gloves and Component
#define UNIFORM_GLOVES_COMPONENT(UniformBase,UniformGloves,Gloves)\
class UniformBase: ACEWARDROBE(base_U_gloves_off) {\
    class modifiableTo {\
        class UniformGloves {};\
    };\
};\
class UniformGloves: ACEWARDROBE(base_U_gloves_on) {\
    class modifiableTo {\
        class UniformBase {};\
    };\
    components[] = {QUOTE(Gloves)};\
}

// Uniform with a Variant with Gloves and a Variant with Sleeves Rolled up, BUT not combined
#define UNIFORM_GLOVES_ROLLED2(UniformBase,UniformGloves,UniformRolled)\
class UniformBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformGloves {};\
        class UniformRolled {};\
    };\
};\
class UniformGloves: ACEWARDROBE(base_U_gloves_on) {\
    class modifiableTo {\
        class UniformBase {\
            displayName = ACEWARDROBE_CSTRING(glovesOff);\
        };\
    };\
};\
class UniformRolled: ACEWARDROBE(base_U_sleeves_up) {\
    class modifiableTo {\
        class UniformBase {\
            displayName = ACEWARDROBE_CSTRING(sleevesDown);\
        };\
    };\
}

// Uniform with 2 types of rolled up
#define UNIFORM_SLEEVES2(UniformBase,UniformRolled1,UniformRolled2)\
class UniformBase: ACEWARDROBE(base_U_sleeves_down) {\
    class modifiableTo {\
        class UniformRolled1 {};\
    };\
};\
class UniformRolled1: ACEWARDROBE(base) {\
    class modifiableTo {\
        class UniformBase {};\
        class UniformRolled2 {};\
    };\
};\
class UniformRolled2: ACEWARDROBE(base_U_sleeves_up) {\
    class modifiableTo {\
        class UniformRolled1 {};\
    };\
}

// Uniform Closed Collar, Open Collar, RolledUpSleeves
#define UNIFORM_COLLARCLOSED_COLLAROPEN_SLEEVESUP(ClosedCollar,OpenCollar,OpenCollarRolledUpSleeves)\
class ClosedCollar: ACEWARDROBE(base) {\
    class modifiableTo {\
        class OpenCollar {\
            displayName = ACEWARDROBE_CSTRING(collarOpen);\
        };\
    };\
};\
class OpenCollar: ACEWARDROBE(base) {\
    class modifiableTo {\
        class ClosedCollar {\
            displayName = ACEWARDROBE_CSTRING(collarClose);\
        };\
        class OpenCollarRolledUpSleeves {\
            displayName = ACEWARDROBE_CSTRING(sleevesUp);\
        };\
    };\
};\
class OpenCollarRolledUpSleeves: ACEWARDROBE(base) {\
    class modifiableTo {\
        class OpenCollar {\
            displayName = ACEWARDROBE_CSTRING(sleevesDown);\
        };\
    };\
}


// FACEMASKS
// Facemask with Goggles
#define FACEMASK_GOGGLES(FaceMaskBase,FaceMaskGoggles,Goggles)\
class FaceMaskBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class FaceMaskGoggles {};\
    };\
    components[] = {QUOTE(FaceMaskBase)};\
};\
class FaceMaskGoggles: ACEWARDROBE(base) {\
    class modifiableTo {\
        class FaceMaskBase {};\
    };\
    components[] = {QUOTE(FaceMaskBase),QUOTE(Goggles)};\
}

// Facemask with 2 Variants of Goggles
#define FACEMASK_GOGGLES2(FaceMaskBase,FaceMaskGoggles1,FaceMaskGoggles2,Goggles1,Goggles2)\
class FaceMaskBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class FaceMaskGoggles1 {};\
        class FaceMaskGoggles2 {};\
    };\
    components[] = {QUOTE(FaceMaskBase)};\
};\
class FaceMaskGoggles1: ACEWARDROBE(base) {\
    class modifiableTo {\
        class FaceMaskBase {};\
    };\
    components[] = {QUOTE(FaceMaskBase),QUOTE(Goggles1)};\
};\
class FaceMaskGoggles2: ACEWARDROBE(base) {\
    class modifiableTo {\
        class FaceMaskBase {};\
    };\
    components[] = {QUOTE(FaceMaskBase),QUOTE(Goggles2)};\
}
