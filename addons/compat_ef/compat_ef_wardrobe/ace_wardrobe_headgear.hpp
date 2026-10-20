class EF_H_MCH: ACEWARDROBE(base) {
    class modifiableTo {
        class EF_H_MCH_Basic {};
    };
};

class EF_H_MCH_Basic: ACEWARDROBE(base) {
    class modifiableTo {
        class EF_H_MCH {};
    };
    components[] = {QUOTE(EF_H_Protecta)};
};

//In theory you could be wearing the EF_H_Protecta and the helmet in you backpack, but I don't think that makes much sense
