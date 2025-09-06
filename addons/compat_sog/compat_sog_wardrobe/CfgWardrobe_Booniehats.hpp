// CfgWeapons

// Variations
// 01 sides up 02 normal 03 front up 04 l side up 05 r side up
// 06-08 anzac
// 09 rebel - not compatible
//Colors
// 01 green 02 tiger 03 black 04 spray 05 tiger green 06 erdl brown 07 leopard 08 erdl
// 09 gray <- inheritance is horrible.


// Macros
#define CN(variation,color) vn_b_boonie_##variation##_##color

// Base Boonie
#define CAMO_BASE 01

class CN(02,CAMO_BASE): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(01,CAMO_BASE) {};
        class CN(03,CAMO_BASE) {};
        class CN(04,CAMO_BASE) {};
        class CN(05,CAMO_BASE) {};
    };
};

class CN(01,CAMO_BASE): EGVAR(wardrobe,base) {
    class modifiableTo { 
        class CN(02,CAMO_BASE) {};
        class CN(03,CAMO_BASE) {};
        class CN(04,CAMO_BASE) {};
        class CN(05,CAMO_BASE) {};
    };
};

class CN(03,CAMO_BASE): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(01,CAMO_BASE) {};
        class CN(02,CAMO_BASE) {};
        class CN(04,CAMO_BASE) {};
        class CN(05,CAMO_BASE) {};
    };
};
class CN(04,CAMO_BASE): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(01,CAMO_BASE) {};
        class CN(02,CAMO_BASE) {};
        class CN(03,CAMO_BASE) {};
        class CN(05,CAMO_BASE) {};
    };
};
class CN(05,CAMO_BASE): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(01,CAMO_BASE) {};
        class CN(02,CAMO_BASE) {};
        class CN(03,CAMO_BASE) {};
        class CN(04,CAMO_BASE) {};
    };
};



#define CN_COLORS(CAMO)\
class CN(02,CAMO): EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class CN(01,CAMO) {};\
        class CN(03,CAMO) {};\
        class CN(04,CAMO) {};\
        class CN(05,CAMO) {};\
    };\
};\
class CN(01,CAMO): EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class CN(02,CAMO) {};\
        class CN(03,CAMO) {};\
        class CN(04,CAMO) {};\
        class CN(05,CAMO) {};\
    };\
};\
class CN(03,CAMO): EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class CN(01,CAMO) {};\
        class CN(02,CAMO) {};\
        class CN(04,CAMO) {};\
        class CN(05,CAMO) {};\
    };\
};\
class CN(04,CAMO): EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class CN(01,CAMO) {};\
        class CN(02,CAMO) {};\
        class CN(03,CAMO) {};\
        class CN(05,CAMO) {};\
    };\
};\
class CN(05,CAMO): EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class CN(01,CAMO) {};\
        class CN(02,CAMO) {};\
        class CN(03,CAMO) {};\
        class CN(04,CAMO) {};\
    };\
}


CN_COLORS(02);
CN_COLORS(03);
CN_COLORS(04);
CN_COLORS(05);


// Base classes in CfgWeapons.hpp
// 06-08 anzac

class CN(06,01): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(07,01) {};
        class CN(08,01) {};
    };
};
class CN(07,01): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(06,VAR) {};
        class CN(08,01) {};
    };
};
class CN(08,01): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(06,01) {};
        class CN(07,01) {};
    };
};

class CN(06,02): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(07,02) {};
        class CN(08,02) {};
    };
};
class CN(07,02): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(06,02) {};
        class CN(08,02) {};
    };
};
class CN(08,02): EGVAR(wardrobe,base) {
    class modifiableTo {
        class CN(06,02) {};
        class CN(07,02) {};
    };
};
