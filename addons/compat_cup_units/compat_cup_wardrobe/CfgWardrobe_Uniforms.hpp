// Macros
#define CUP_UNIFORM_TSHIRT(tshirtBase,tshirtGloves,tshirtKnee)\
class tshirtBase : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtGloves;\
        class tshirtKnee;\
    };\
};\
class tshirtGloves : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtBase;\
    };\
};\
class tshirtKnee : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtBase;\
    };\
}

#define CUP_UNIFORM_3(uniformBase,uniformVariant1,uniformVariant2)\
class uniformBase : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformVariant1;\
        class uniformVariant2;\
    };\
};\
class uniformVariant1 : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase;\
    };\
};\
class uniformVariant2 : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase;\
    };\
}

#define CUP_UNIFORM_4(uniformBase,uniformVariant1,uniformVariant2,uniformVariant3)\
CUP_UNIFORM_3(uniformBase,uniformVariant1,uniformVariant2);\
class uniformVariant3 : EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase;\
    };\
}

#define CUP_UNIFORM_BAF(uniformBase,uniformGLoves,uniformKneepad,uniformGlovesKneepad,uniformRolled,uniformRolledGloves,uniformRolledKneepad)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGLoves;\
        class uniformKneepad;\
        class uniformRolled;\
    };\
};\
class uniformGLoves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad;\
        class uniformRolledGloves;\
        class uniformBase;\
    };\
};\
class uniformKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad;\
        class uniformRolledKneepad;\
        class uniformBase;\
    };\
};\
class uniformGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGLoves;\
        class uniformKneepad;\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase;\
        class uniformRolledGloves;\
        class uniformRolledKneepad;\
    };\
};\
class uniformRolledKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled;\
        class uniformKneepad;\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled;\
        class uniformGLoves;\
    };\
}

#define CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(uniformBase,uniformGLoves,uniformKneepad,uniformGlovesKneepad,uniformRolled,uniformRolledGloves,uniformRolledKneepad,uniformRolledGlovesKneepad)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGLoves;\
        class uniformKneepad;\
        class uniformRolled;\
    };\
};\
class uniformGLoves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad;\
        class uniformRolledGloves;\
        class uniformBase;\
    };\
};\
class uniformKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad;\
        class uniformRolledKneepad;\
        class uniformBase;\
    };\
};\
class uniformGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGLoves;\
        class uniformKneepad;\
        class uniformRolledGlovesKneepad;\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledGloves;\
        class uniformRolledKneepad;\
        class uniformBase;\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled;\
        class uniformRolledGlovesKneepad;\
    };\
};\
class uniformRolledKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled;\
        class uniformRolledGlovesKneepad;\
    };\
};\
class uniformRolledGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledKneepad;\
        class uniformRolledGloves;\
    };\
}

//Army of the Czech Republic
UNIFORM_SLEEVES(CUP_U_B_CZ_DST_NoKneepads,CUP_U_B_CZ_DST_Kneepads_Sleeve);
UNIFORM_SLEEVES(CUP_U_B_CZ_DST_Kneepads,CUP_U_B_CZ_DST_Kneepads_Gloves);
UNIFORM_SLEEVES(CUP_U_B_CZ_WDL_NoKneepads,CUP_U_B_CZ_WDL_Kneepads_Gloves);

//Armed Forces of the Russian Federation
UNIFORM_SLEEVES(CUP_U_O_RUS_BeigeDigital_MSV,CUP_U_O_RUS_BeigeDigital_MSV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_BeigeDigital_MSV_gloves_pads,CUP_U_O_RUS_BeigeDigital_MSV_rolled_up_gloves_pads);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_1,CUP_U_O_RUS_EMR_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_Flora_1,CUP_U_O_RUS_Flora_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_1_VDV,CUP_U_O_RUS_EMR_2_VDV);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_VDV_gloves_pads,CUP_U_O_RUS_EMR_VDV_rolled_up_gloves_pads);
UNIFORM_SLEEVES(CUP_U_O_RUS_KSOR_VDV,CUP_U_O_RUS_KSOR_VDV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_KSOR_VDV_gloves_pads,CUP_U_O_RUS_KSOR_VDV_rolled_up_gloves_pads);
// ToDo Complex variant
// UNIFORM_SLEEVES(CUP_U_O_RUS_VSR93_VDV,CUP_U_O_RUS_VSR93_VDV_rolled_up);
// UNIFORM_SLEEVES(CUP_U_O_RUS_VSR93_VDV_rolled_up,CUP_U_O_RUS_VSR93_VDV_rolled_up_gloves2);
// UNIFORM_SLEEVES(CUP_U_O_RUS_VSR98_VDV,CUP_U_O_RUS_VSR98_VDV_rolled_up);
// UNIFORM_SLEEVES(CUP_U_O_RUS_VSR98_VDV_rolled_up,CUP_U_O_RUS_VSR98_VDV_rolled_up_gloves2);
UNIFORM_SLEEVES(CUP_U_O_RUS_M88_MSV,CUP_U_O_RUS_M88_MSV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_M88_VDV,CUP_U_O_RUS_M88_VDV_rolled_up);

class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_2;
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_3;
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_4;
    };
};
class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_1;
    };
};
class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_1;
    };
};
class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_Masking_Suit_6Sh119_Winter_1;
    };
};

//CUP_U_O_RUS_VSR93_MSV -> CUP_U_O_RUS_VSR93_worn_gloves_MSV
UNIFORM_SLEEVES(CUP_U_O_RUS_VSR93_MSV,CUP_U_O_RUS_VSR93_MSV_rolled_up);

//CUP_U_O_RUS_VSR98_worn_MSV ->CUP_U_O_RUS_VSR98_worn_MSV_rolled_up
//CUP_U_O_RUS_VSR98_worn_MSV -> CUP_U_O_RUS_VSR98_worn_gloves_MSV
UNIFORM_SLEEVES(CUP_U_O_RUS_VSR98_MSV,CUP_U_O_RUS_VSR98_MSV_rolled_up);

//CUP_U_O_RUS_Flora_1_VDV -> CUP_U_O_RUS_Flora_2_VDV
//CUP_U_O_RUS_Flora_1_VDV -> CUP_U_O_RUS_Flora_3

//CUP_U_O_RUS_VSR98_worn_VDV -> CUP_U_O_RUS_VSR98_worn_gloves_VDV
//CUP_U_O_RUS_VSR98_worn_VDV -> CUP_U_O_RUS_VSR98_worn_VDV_rolled_up
//CUP_U_O_RUS_VSR98_worn_VDV_rolled_up -> CUP_U_O_RUS_VSR98_worn_VDV_rolled_up_gloves2
//CUP_U_O_RUS_VSR98_worn_VDV_rolled_up_gloves2 -> CUP_U_O_RUS_VSR98_worn_gloves_VDV

// ToDo MACRO
class CUP_U_O_RUS_Soldier_VKPO_Desert_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_2;
        class CUP_U_O_RUS_Soldier_VKPO_Desert_3;
        class CUP_U_O_RUS_Soldier_VKPO_Desert_4;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_1;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Desert_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Desert_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Desert_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_2;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_3;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Desert_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Desert_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Desert_1;
        class CUP_U_O_RUS_Soldier_VKPO_Desert_4;
    };
};

class CUP_U_O_RUS_Soldier_VKPO_Summer_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_2;
        class CUP_U_O_RUS_Soldier_VKPO_Summer_3;
        class CUP_U_O_RUS_Soldier_VKPO_Summer_4;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_1;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Summer_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Summer_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Summer_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_2;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_3;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Summer_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Summer_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Summer_1;
        class CUP_U_O_RUS_Soldier_VKPO_Summer_4;
    };
};

class CUP_U_O_RUS_Soldier_VKPO_Winter_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_2;
        class CUP_U_O_RUS_Soldier_VKPO_Winter_3;
        class CUP_U_O_RUS_Soldier_VKPO_Winter_4;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_1;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Winter_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Winter_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Winter_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_2;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_3;
        class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_4;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Winter_2;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Winter_3;
    };
};
class CUP_U_O_RUS_Soldier_VKPO_Rolled_Winter_4: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_O_RUS_Soldier_VKPO_Winter_1;
        class CUP_U_O_RUS_Soldier_VKPO_Winter_4;
    };
};

// Armed Forces of Ukraine
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_AFU_ACU_M14,CUP_U_B_AFU_ACU_Gloves_M14,CUP_U_B_AFU_ACU_Kneepad_M14,CUP_U_B_AFU_ACU_Kneepad_Gloves_M14,CUP_U_B_AFU_ACU_Rolled_M14,CUP_U_B_AFU_ACU_Rolled_Gloves_M14,CUP_U_B_AFU_ACU_Kneepad_Rolled_M14,CUP_U_B_AFU_ACU_Kneepad_Rolled_Gloves_M14);

// Gorka
CUP_UNIFORM_3(CUP_U_O_RUS_Gorka_Green,CUP_U_O_RUS_Gorka_Green_gloves2,CUP_U_O_RUS_Gorka_Green_gloves_kneepads);
CUP_UNIFORM_3(CUP_U_O_RUS_Gorka_Partizan_A,CUP_U_O_RUS_Gorka_Partizan_A_gloves2,CUP_U_O_RUS_Gorka_Partizan_A_gloves_kneepads);
CUP_UNIFORM_3(CUP_U_O_RUS_Gorka_Partizan,CUP_U_O_RUS_Gorka_Partizan_gloves2,CUP_U_O_RUS_Gorka_Partizan_gloves_kneepads);

// British Armed Forces
CUP_UNIFORM_TSHIRT(CUP_U_B_BAF_MTP_UBACSTSHIRT,CUP_U_B_BAF_MTP_UBACSTSHIRT_Gloves,CUP_U_B_BAF_MTP_UBACSTSHIRTKNEE);
CUP_UNIFORM_TSHIRT(CUP_U_B_BAF_DPM_UBACSTSHIRT,CUP_U_B_BAF_DPM_UBACSTSHIRT_Gloves,CUP_U_B_BAF_DPM_UBACSTSHIRTKNEE);
CUP_UNIFORM_TSHIRT(CUP_U_B_BAF_DDPM_UBACSTSHIRT,CUP_U_B_BAF_DDPM_UBACSTSHIRT_Gloves,CUP_U_B_BAF_DDPM_UBACSTSHIRTKNEE);

CUP_UNIFORM_BAF(CUP_U_B_BAF_MTP_UBACSLONG,CUP_U_B_BAF_MTP_UBACSLONG_Gloves,CUP_U_B_BAF_MTP_UBACSLONGKNEE,CUP_U_B_BAF_MTP_UBACSLONGKNEE_Gloves,CUP_U_B_BAF_MTP_UBACSROLLED,CUP_U_B_BAF_MTP_UBACSROLLED_Gloves,CUP_U_B_BAF_MTP_UBACSROLLEDKNEE);
CUP_UNIFORM_BAF(CUP_U_B_BAF_DPM_UBACSLONG,CUP_U_B_BAF_DPM_UBACSLONG_Gloves,CUP_U_B_BAF_DPM_UBACSLONGKNEE,CUP_U_B_BAF_DPM_UBACSLONGKNEE_Gloves,CUP_U_B_BAF_DPM_UBACSROLLED,CUP_U_B_BAF_DPM_UBACSROLLED_Gloves,CUP_U_B_BAF_DPM_UBACSROLLEDKNEE);
CUP_UNIFORM_BAF(CUP_U_B_BAF_DDPM_UBACSLONG,CUP_U_B_BAF_DDPM_UBACSLONG_Gloves,CUP_U_B_BAF_DDPM_UBACSLONGKNEE,CUP_U_B_BAF_DDPM_UBACSLONGKNEE_Gloves,CUP_U_B_BAF_DDPM_UBACSROLLED,CUP_U_B_BAF_DDPM_UBACSROLLED_Gloves,CUP_U_B_BAF_DDPM_UBACSROLLEDKNEE);

// Crye
UNIFORM_SLEEVES(CUP_U_CRYE_ATACSAU_Full,CUP_U_CRYE_ATACSAU_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_ATACSFG_Full,CUP_U_CRYE_ATACSFG_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_BLK_Full,CUP_U_CRYE_BLK_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_BLK_RUS_Full,CUP_U_CRYE_BLK_RUS_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_MCAM_NP_Full,CUP_U_CRYE_MCAM_NP_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_MCAM_RUS_Full,CUP_U_CRYE_MCAM_RUS_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_MCAM_NP2_Full,CUP_U_CRYE_MCAM_NP2_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_MCAM_RUS2_Full,CUP_U_CRYE_MCAM_RUS2_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_V1_Full,CUP_U_CRYE_V1_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_V2_Full,CUP_U_CRYE_V2_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_V3_Full,CUP_U_CRYE_V3_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_RGR_Full,CUP_U_CRYE_RGR_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_RGR_US_Full,CUP_U_CRYE_RGR_US_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_TAN_Full,CUP_U_CRYE_TAN_Roll);
UNIFORM_SLEEVES(CUP_U_CRYE_TAN_US_Full,CUP_U_CRYE_TAN_US_Roll);  
UNIFORM_SLEEVES(CUP_U_B_GER_Fleck_Crye,CUP_U_B_GER_Fleck_Crye2);
UNIFORM_SLEEVES(CUP_U_B_GER_Crye,CUP_U_B_GER_Crye2);

// German Army
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_GER_Tropentarn_5,CUP_U_B_GER_Tropentarn_6,CUP_U_B_GER_Tropentarn_1,CUP_U_B_GER_Tropentarn_2,CUP_U_B_GER_Tropentarn_8,CUP_U_B_GER_Tropentarn_7,CUP_U_B_GER_Tropentarn_4,CUP_U_B_GER_Tropentarn_3);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_GER_Flecktarn_5,CUP_U_B_GER_Flecktarn_6,CUP_U_B_GER_Flecktarn_1,CUP_U_B_GER_Flecktarn_2,CUP_U_B_GER_Flecktarn_8,CUP_U_B_GER_Flecktarn_7,CUP_U_B_GER_Flecktarn_4,CUP_U_B_GER_Flecktarn_3);

// Horizon Island Legion
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_HIL_ACU_CCE,CUP_U_B_HIL_ACU_Gloves_CCE,CUP_U_B_HIL_ACU_Kneepad_CCE,CUP_U_B_HIL_ACU_Kneepad_Gloves_CCE,CUP_U_B_HIL_ACU_Rolled_CCE,CUP_U_B_HIL_ACU_Rolled_Gloves_CCE,CUP_U_B_HIL_ACU_Kneepad_Rolled_CCE,CUP_U_B_HIL_ACU_Kneepad_Rolled_Gloves_CCE);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_HIL_ACU_TTS,CUP_U_B_HIL_ACU_Gloves_TTS,CUP_U_B_HIL_ACU_Kneepad_TTS,CUP_U_B_HIL_ACU_Kneepad_Gloves_TTS,CUP_U_B_HIL_ACU_Rolled_TTS,CUP_U_B_HIL_ACU_Rolled_Gloves_TTS,CUP_U_B_HIL_ACU_Kneepad_Rolled_TTS,CUP_U_B_HIL_ACU_Kneepad_Rolled_Gloves_TTS);

// Chernarussian Defence Force
UNIFORM_SLEEVES(CUP_U_B_CDF_DST_1,CUP_U_B_CDF_DST_2);
UNIFORM_SLEEVES(CUP_U_B_CDF_FST_1,CUP_U_B_CDF_FST_2);
UNIFORM_SLEEVES(CUP_U_B_CDF_MNT_1,CUP_U_B_CDF_MNT_2);
UNIFORM_GLOVES(CUP_U_B_CDF_SNW_1,CUP_U_B_CDF_SNW_2);

// Rebels
BASE_PAIR(CUP_U_I_GUE_Anorak_01,CUP_U_I_GUE_Anorak_03);
BASE_PAIR(CUP_U_I_GUE_Flecktarn2,CUP_U_I_GUE_Flecktarn3);

// PMC
BASE_PAIR(CUP_I_B_PMC_Unit_30,CUP_I_B_PMC_Unit_29);
BASE_PAIR(CUP_I_B_PMC_Unit_27,CUP_I_B_PMC_Unit_26);
BASE_PAIR(CUP_I_B_PMC_Unit_25,CUP_I_B_PMC_Unit_18);
BASE_PAIR(CUP_I_B_PMC_Unit_34,CUP_I_B_PMC_Unit_33);

//Royal Army Corps of Sahrani
BASE_PAIR(CUP_U_I_RACS_Desert_1,CUP_U_I_RACS_Desert_2);
BASE_PAIR(CUP_U_I_RACS_mech_1,CUP_U_I_RACS_mech_2);
BASE_PAIR(CUP_U_I_RACS_Urban_1,CUP_U_I_RACS_Urban_2);
BASE_PAIR(CUP_U_I_RACS_WDL_1,CUP_U_I_RACS_WDL_2);

// US Army
BASE_PAIR(CUP_U_B_USArmy_Base,CUP_U_B_USArmy_TwoKnee);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_OCP,CUP_U_B_USArmy_ACU_Gloves_OCP,CUP_U_B_USArmy_ACU_Kneepad_OCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP,CUP_U_B_USArmy_ACU_Rolled_OCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_OCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_OCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OCP);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_OEFCP,CUP_U_B_USArmy_ACU_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Rolled_OEFCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_UCP,CUP_U_B_USArmy_ACU_Gloves_UCP,CUP_U_B_USArmy_ACU_Kneepad_UCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP,CUP_U_B_USArmy_ACU_Rolled_UCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_UCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_UCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_UCP);

// USMC
class CUP_U_B_USMC_MCCUU: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_gloves;
        class CUP_U_B_USMC_MCCUU_pads;
        class CUP_U_B_USMC_MCCUU_roll;
    };
};
class CUP_U_B_USMC_MCCUU_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_gloves;
        class CUP_U_B_USMC_MCCUU_pads_gloves;
        class CUP_U_B_USMC_MCCUU;
    };
};
class CUP_U_B_USMC_MCCUU_pads_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_pads;
        class CUP_U_B_USMC_MCCUU_pads_gloves;
        class CUP_U_B_USMC_MCCUU;
    };
};
class CUP_U_B_USMC_MCCUU_roll: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2;
        class CUP_U_B_USMC_MCCUU_roll_gloves;
        class CUP_U_B_USMC_MCCUU_roll_pads;
        class CUP_U_B_USMC_MCCUU;
    };
};
class CUP_U_B_USMC_MCCUU_roll_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_gloves;
        class CUP_U_B_USMC_MCCUU_roll_pads_gloves;
        class CUP_U_B_USMC_MCCUU_roll;
    };
};
class CUP_U_B_USMC_MCCUU_roll_pads: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_pads;
        class CUP_U_B_USMC_MCCUU_roll_pads_gloves;
        class CUP_U_B_USMC_MCCUU_roll;
    };
};
class CUP_U_B_USMC_MCCUU_roll_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_roll;
    };
};
class CUP_U_B_USMC_MCCUU_roll_2_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2;
        class CUP_U_B_USMC_MCCUU_roll_2_pads_gloves;
        class CUP_U_B_USMC_MCCUU_roll_gloves;
    };
};
class CUP_U_B_USMC_MCCUU_roll_2_pads: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2;
        class CUP_U_B_USMC_MCCUU_roll_2_pads_gloves;
        class CUP_U_B_USMC_MCCUU_roll_pads;
    };
};
class CUP_U_B_USMC_MCCUU_roll_2_pads_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_roll_pads_gloves;
    };
};

class CUP_U_B_USMC_MCCUU_des: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_gloves;
        class CUP_U_B_USMC_MCCUU_des_pads;
        class CUP_U_B_USMC_MCCUU_des_roll;
    };
};
class CUP_U_B_USMC_MCCUU_des_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_gloves;
        class CUP_U_B_USMC_MCCUU_des_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des;
    };
};
class CUP_U_B_USMC_MCCUU_des_pads_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_pads;
        class CUP_U_B_USMC_MCCUU_des_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2;
        class CUP_U_B_USMC_MCCUU_des_roll_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_pads;
        class CUP_U_B_USMC_MCCUU_des;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_des_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_pads: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_des_pads;
        class CUP_U_B_USMC_MCCUU_des_roll_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_des_roll;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_2_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2;
        class CUP_U_B_USMC_MCCUU_des_roll_2_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_gloves;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_2_pads: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2;
        class CUP_U_B_USMC_MCCUU_des_roll_2_pads_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_pads;
    };
};
class CUP_U_B_USMC_MCCUU_des_roll_2_pads_gloves: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_U_B_USMC_MCCUU_des_roll_2_pads;
        class CUP_U_B_USMC_MCCUU_des_roll_2_gloves;
        class CUP_U_B_USMC_MCCUU_des_roll_pads_gloves;
    };
};