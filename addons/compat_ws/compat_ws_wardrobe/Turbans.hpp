// CfgWeapons

// MACROS
#define CN(version,color) lxWS_H_turban_##version##_##color
#define QCN(version,color) QUOTE(CN(version,color))

#define COLORGROUP(COLOR)\
class CN(01,COLOR): lxWS_H_turban_01_black {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(02,COLOR), QCN(03,COLOR), QCN(04,COLOR) };\
    };\
};\
class CN(02,COLOR): lxWS_H_turban_02_black {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,COLOR), QCN(03,COLOR), QCN(04,COLOR) };\
    };\
};\
class CN(03,COLOR): lxWS_H_turban_03_black {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,COLOR), QCN(02,COLOR), QCN(04,COLOR) };\
    };\
};\
class CN(04,COLOR): lxWS_H_turban_04_black {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,COLOR), QCN(02,COLOR), QCN(03,COLOR) };\
    };\
}


#define COLORGROUP_SPECIAL(COLOR)\
class CN(02,COLOR): lxWS_H_turban_02_green {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(03,COLOR) };\
    };\
};\
class CN(03,COLOR): lxWS_H_turban_03_black {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(02,COLOR) };\
    };\
}


// BASECLASS
class H_Shemag_khk;
class HeadgearItem;

class H_turban_02_mask_black_lxws: H_Shemag_khk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,black), QCN(02,black), QCN(03,black), QCN(04,black) };
        components[] = { "lxWS_H_bmask_base" };
    };
    class ItemInfo: HeadgearItem {
        mass = 26;
    };
};

class lxWS_H_turban_01_black: H_Shemag_khk {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(02,black), QCN(03,black), QCN(04,black), "H_turban_02_mask_black_lxws" };
    };
};
class lxWS_H_turban_02_black: lxWS_H_turban_01_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,black), QCN(03,black), QCN(04,black), "H_turban_02_mask_black_lxws" };
    };
};
class lxWS_H_turban_03_black: lxWS_H_turban_01_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,black), QCN(02,black), QCN(04,black), "H_turban_02_mask_black_lxws" };
    };
};
class lxWS_H_turban_04_black: lxWS_H_turban_01_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,black), QCN(02,black), QCN(03,black), "H_turban_02_mask_black_lxws" };
    };
};

// VARIATIONS
COLORGROUP(blue);
COLORGROUP(blue_una);
COLORGROUP(green);
COLORGROUP(red);
COLORGROUP(gray);
COLORGROUP(yellow);

// Special Variations
COLORGROUP_SPECIAL(green_pattern);


// Super Special Manual blabla
class H_turban_02_mask_snake_lxws: H_turban_02_mask_black_lxws {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,sand), QCN(02,sand), QCN(03,sand), QCN(04,sand), "H_turban_02_mask_hex_lxws" };
        components[] = {"H_bmask_snake_lxws"};
    };
};
class H_turban_02_mask_hex_lxws: H_turban_02_mask_black_lxws {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,sand), QCN(02,sand), QCN(03,sand), QCN(04,sand), "H_turban_02_mask_snake_lxws" };
        components[] = {"lxWS_H_bmask_hex"};
    };
};
class lxWS_H_turban_01_sand: lxWS_H_turban_01_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(02,sand), QCN(03,sand), QCN(04,sand), "H_turban_02_mask_snake_lxws", "H_turban_02_mask_hex_lxws" };
    };
};
class lxWS_H_turban_02_sand: lxWS_H_turban_02_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,sand), QCN(03,sand), QCN(04,sand), "H_turban_02_mask_snake_lxws", "H_turban_02_mask_hex_lxws" };
    };
};
class lxWS_H_turban_03_sand: lxWS_H_turban_03_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,sand), QCN(02,sand), QCN(04,sand), "H_turban_02_mask_snake_lxws", "H_turban_02_mask_hex_lxws" };
    };
};
class lxWS_H_turban_04_sand: lxWS_H_turban_04_black {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,sand), QCN(02,sand), QCN(03,sand), "H_turban_02_mask_snake_lxws", "H_turban_02_mask_hex_lxws" };
    };
};