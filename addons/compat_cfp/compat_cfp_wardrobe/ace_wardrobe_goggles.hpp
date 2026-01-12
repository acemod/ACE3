class CFP_UA_Thermals_Blk: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_UA_Thermals_Blk_GPS {};
    };
};
class CFP_UA_Thermals_Blk_GPS: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_UA_Thermals_Blk {};
    };
    components[] = {QUOTE(CFP_Foretex)};
};

#define NECKWRAP_GLASSES(NeckwrapBase,NeckwrapGlasses,Glasses)\
class NeckwrapBase: ACEWARDROBE(base) {\
    class modifiableTo {\
        class NeckwrapGlasses {};\
    };\
};\
class NeckwrapGlasses: ACEWARDROBE(base) {\
    class modifiableTo {\
        class NeckwrapBase {};\
    };\
    components[] = {QUOTE(Glasses)};\
}

NECKWRAP_GLASSES(CFP_Neck_Plain_Atacs,CFP_Neck_Wrap_Atacs,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Neck_Plain_Atacs2,CFP_Neck_Wrap_Atacs2,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Neck_Plain2,CFP_Neck_Wrap2,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Neck_Plain4,CFP_Neck_Wrap4,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Neck_Plain3,CFP_Neck_Wrap3,CUP_G_Oakleys_Clr);

// Shemags, but same structure
NECKWRAP_GLASSES(CFP_Scarfbeard_green,CFP_Scarfbeardshades_green,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Scarfbeard_grey,CFP_Scarfbeardshades_grey,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Scarfbeard_tan,CFP_Scarfbeardshades_tan,CUP_G_Oakleys_Clr);
NECKWRAP_GLASSES(CFP_Scarfbeard_white,CFP_Scarfbeardshades_white,CUP_G_Oakleys_Clr);
