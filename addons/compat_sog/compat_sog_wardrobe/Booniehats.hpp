// CfgWeapons

// Variations
// 01 sides up 02 normal 03 front up 04 l side up 05 r side up
// 06-08 anzac
// 09 rebel - not compatible
//Colors
// 01 green 02 tiger 03 black 04 spray 05 tiger green 06 erdl brown 07 leopard 08 erdl
// 09 gray <- Fuck this - inheritance is fucking horrible as fuck.


// Macros
#define CN(variation,color) vn_b_boonie_##variation##_##color
#define QCN(variation,color) QUOTE(CN(variation,color))

// Base Boonie
#define CAMO_BASE 01

class CN(02,CAMO_BASE): vn_b_headgear_base {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,CAMO_BASE), QCN(03,CAMO_BASE), QCN(04,CAMO_BASE), QCN(05,CAMO_BASE) };
    };
};
class CN(01,CAMO_BASE): CN(02,CAMO_BASE) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(02,CAMO_BASE), QCN(03,CAMO_BASE), QCN(04,CAMO_BASE), QCN(05,CAMO_BASE) };
    };
};
class CN(03,CAMO_BASE): CN(02,CAMO_BASE)   {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,CAMO_BASE), QCN(02,CAMO_BASE), QCN(04,CAMO_BASE), QCN(05,CAMO_BASE) };
    };
};
class CN(04,CAMO_BASE): CN(02,CAMO_BASE) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,CAMO_BASE), QCN(02,CAMO_BASE), QCN(03,CAMO_BASE), QCN(05,CAMO_BASE) };
    };
};
class CN(05,CAMO_BASE): CN(02,CAMO_BASE)   {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(01,CAMO_BASE), QCN(02,CAMO_BASE), QCN(03,CAMO_BASE), QCN(04,CAMO_BASE) };
    };
};


#define CN_COLORS(CAMO)\
class CN(02,CAMO): CN(02,01) {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,CAMO), QCN(03,CAMO), QCN(04,CAMO), QCN(05,CAMO) };\
    };\
};\
class CN(01,CAMO): CN(02,CAMO) {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(02,CAMO), QCN(03,CAMO), QCN(04,CAMO), QCN(05,CAMO) };\
    };\
};\
class CN(03,CAMO): CN(02,CAMO) {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,CAMO), QCN(02,CAMO), QCN(04,CAMO), QCN(05,CAMO) };\
    };\
};\
class CN(04,CAMO): CN(02,CAMO) {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,CAMO), QCN(02,CAMO), QCN(03,CAMO), QCN(05,CAMO) };\
    };\
};\
class CN(05,CAMO): CN(02,CAMO) {\
    class ace_wardrobe: EGVAR(wardrobe,base) {\
        modifiableTo[] = { QCN(01,CAMO), QCN(02,CAMO), QCN(03,CAMO), QCN(04,CAMO) };\
    };\
}

CN_COLORS(02);
CN_COLORS(03);
CN_COLORS(04);
CN_COLORS(05);


// Base classes in CfgWeapons.hpp
// 06-08 anzac

class CN(06,01): CN(02,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(07,01), QCN(08,01) };
    };
};
class CN(07,01): CN(06,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(06,VAR), QCN(08,01) };
    };
};
class CN(08,01): CN(06,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(06,01), QCN(07,01) };
    };
};

class CN(06,02): CN(06,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(07,02), QCN(08,02) };
    };
};
class CN(07,02): CN(06,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(06,02), QCN(08,02) };
    };
};
class CN(08,02): CN(06,01) {
    class ace_wardrobe: EGVAR(wardrobe,base) {
        modifiableTo[] = { QCN(06,02), QCN(07,02) };
    };
};
