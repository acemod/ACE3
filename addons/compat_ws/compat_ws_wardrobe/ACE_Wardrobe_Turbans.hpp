// Custom Base Class
class EGVAR(wardrobe,turban): EGVAR(wardrobe,base) {
    gesture = "GestureWipeFace";
};

// MACROS
#define CN(version,color) lxWS_H_turban_##version##_##color

#define COLORGROUP(COLOR)\
class CN(01,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(02,COLOR) {};\
        class CN(03,COLOR) {};\
        class CN(04,COLOR) {};\
    };\
};\
class CN(02,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(01,COLOR) {};\
        class CN(03,COLOR) {};\
        class CN(04,COLOR) {};\
    };\
};\
class CN(03,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(01,COLOR) {};\
        class CN(02,COLOR) {};\
        class CN(04,COLOR) {};\
    };\
};\
class CN(04,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(01,COLOR) {};\
        class CN(02,COLOR) {};\
        class CN(03,COLOR) {};\
    };\
}


#define COLORGROUP_SPECIAL(COLOR)\
class CN(02,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(03,COLOR) {};\
    };\
};\
class CN(03,COLOR): EGVAR(wardrobe,turban) {\
    class modifiableTo {\
        class CN(02,COLOR) {};\
    };\
}


// VARIATIONS
COLORGROUP(blue);
COLORGROUP(blue_una);
COLORGROUP(green);
COLORGROUP(red);
COLORGROUP(gray);
COLORGROUP(yellow);


// Special Variations
COLORGROUP_SPECIAL(green_pattern);



// Turbans with face protection mask

// Black with black mask
class H_turban_02_mask_black_lxws: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,black) {}; 
        class CN(02,black) {}; 
        class CN(03,black) {}; 
        class CN(04,black) {};
    };
    components[] = { "lxWS_H_bmask_base" };
};


class lxWS_H_turban_01_black: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(02,black) {};
        class CN(03,black) {};
        class CN(04,black) {};
        class H_turban_02_mask_black_lxws {};
    };
};
class lxWS_H_turban_02_black: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,black) {};
        class CN(03,black) {};
        class CN(04,black) {};
        class H_turban_02_mask_black_lxws {};
    };
};
class lxWS_H_turban_03_black: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,black) {};
        class CN(02,black) {};
        class CN(04,black) {};
        class H_turban_02_mask_black_lxws {};
    };
};
class lxWS_H_turban_04_black: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,black) {};
        class CN(02,black) {};
        class CN(03,black) {};
        class H_turban_02_mask_black_lxws {};
    };
};

// Sand with 2 different Masks
class H_turban_02_mask_snake_lxws: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,sand) {};
        class CN(02,sand) {};
        class CN(03,sand) {};
        class CN(04,sand) {};
        class H_turban_02_mask_hex_lxws {};
    };
    components[] = {"H_bmask_snake_lxws"};
};
class H_turban_02_mask_hex_lxws: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,sand) {};
        class CN(02,sand) {};
        class CN(03,sand) {};
        class CN(04,sand) {};
        class H_turban_02_mask_snake_lxws {};
    };
    components[] = {"lxWS_H_bmask_hex"};
};
class lxWS_H_turban_01_sand: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(02,sand) {};
        class CN(03,sand) {};
        class CN(04,sand) {};
        class H_turban_02_mask_snake_lxws {};
        class H_turban_02_mask_hex_lxws {};
    };
};
class lxWS_H_turban_02_sand: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,sand) {};
        class CN(03,sand) {};
        class CN(04,sand) {};
        class H_turban_02_mask_snake_lxws {};
        class H_turban_02_mask_hex_lxws {};
    };
};
class lxWS_H_turban_03_sand: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,sand) {};
        class CN(02,sand) {};
        class CN(04,sand) {};
        class H_turban_02_mask_snake_lxws {};
        class H_turban_02_mask_hex_lxws {};
    };
};
class lxWS_H_turban_04_sand: EGVAR(wardrobe,turban) {
    class modifiableTo {
        class CN(01,sand) {};
        class CN(02,sand) {};
        class CN(03,sand) {};
        class H_turban_02_mask_snake_lxws {};
        class H_turban_02_mask_hex_lxws {};
    };
};
