// Macros
#define CUP_UNIFORM_TSHIRT(tshirtBase,tshirtGloves,tshirtKnee)\
class tshirtBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtGloves {};\
        class tshirtKnee {};\
    };\
};\
class tshirtGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtBase {};\
    };\
};\
class tshirtKnee: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class tshirtBase {};\
    };\
}


// Handle Variants without Kneepads seperate from Kneepadded variants
#define CUP_UNIFORM_BAF(uniformBase,uniformGloves,uniformKneepad,uniformGlovesKneepad,uniformRolled,uniformRolledGloves,uniformRolledKneepad)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGloves {};\
        class uniformRolled {};\
    };\
};\
class uniformGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledGloves {};\
        class uniformBase {};\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformRolledGloves {};\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled {};\
        class uniformGloves {};\
    };\
};\
class uniformKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad {};\
        class uniformRolledKneepad {};\
    };\
};\
class uniformGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformKneepad {};\
    };\
};\
class uniformRolledKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformKneepad {};\
    };\
}

// Handle Variants without Kneepads seperate from Kneepadded variants
#define CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(uniformBase,uniformGloves,uniformKneepad,uniformGlovesKneepad,uniformRolled,uniformRolledGloves,uniformRolledKneepad,uniformRolledGlovesKneepad)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGloves {};\
        class uniformRolled {};\
    };\
};\
class uniformGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledGloves {};\
        class uniformBase {};\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledGloves {};\
        class uniformBase {};\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled {};\
        class uniformGloves {};\
    };\
};\
\
class uniformKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGlovesKneepad {};\
        class uniformRolledKneepad {};\
    };\
};\
class uniformGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformKneepad {};\
        class uniformRolledGlovesKneepad {};\
    };\
};\
class uniformRolledKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledGlovesKneepad {};\
        class uniformKneepad {};\
    };\
};\
class uniformRolledGlovesKneepad: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolledKneepad {};\
        class uniformGlovesKneepad {};\
    };\
}

#define CUP_BaseGloveRolled_3(uniformBase,uniformVAR1,uniformVAR2)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformVAR1 {};\
        class uniformVAR2 {};\
    };\
};\
class uniformVAR1: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformVAR2 {};\
    };\
};\
class uniformVAR2: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformVAR1 {};\
    };\
}

#define CUP_BaseGloveRolled_4(uniformBase,uniformGloves,uniformRolled,uniformRolledGloves)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGloves {};\
        class uniformRolled {};\
    };\
};\
class uniformGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformRolledGloves {};\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformRolledGloves {};\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled {};\
        class uniformGloves {};\
    };\
}

#define CUP_BaseGloveRolledHighRolled_6(uniformBase,uniformGloves,uniformRolled,uniformRolledGloves,uniformHighRolled,uniformHighRolledGloves)\
class uniformBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGloves {};\
        class uniformRolled {};\
        class uniformHighRolled {};\
    };\
};\
class uniformGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformRolledGloves {};\
        class uniformHighRolledGloves {};\
    };\
};\
class uniformRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformHighRolled {};\
        class uniformRolledGloves {};\
    };\
};\
class uniformRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformRolled {};\
        class uniformGloves {};\
        class uniformHighRolledGloves {};\
    };\
};\
class uniformHighRolled: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformBase {};\
        class uniformRolled {};\
        class uniformHighRolledGloves {};\
    };\
};\
class uniformHighRolledGloves: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class uniformGloves {};\
        class uniformRolledGloves {};\
        class uniformHighRolled {};\
    };\
}

#define SCORE_2(a,b) a##_##b
#define CUP_BDUv2_6(CAMO)\
CUP_BaseGloveRolledHighRolled_6(SCORE_2(CUP_U_B_BDUv2,CAMO),SCORE_2(CUP_U_B_BDUv2_gloves,CAMO),SCORE_2(CUP_U_B_BDUv2_roll,CAMO),SCORE_2(CUP_U_B_BDUv2_roll_gloves,CAMO),SCORE_2(CUP_U_B_BDUv2_roll2,CAMO),SCORE_2(CUP_U_B_BDUv2_roll2_gloves,CAMO))

#define CUP_BDUv2_6_dirty(CAMO)\
CUP_BDUv2_6(CAMO);\
CUP_BDUv2_6(SCORE_2(dirty,CAMO))




//Army of the Czech Republic
UNIFORM_SLEEVES(CUP_U_B_CZ_DST_NoKneepads,CUP_U_B_CZ_DST_Kneepads_Sleeve);
UNIFORM_SLEEVES(CUP_U_B_CZ_DST_Kneepads,CUP_U_B_CZ_DST_Kneepads_Gloves);
UNIFORM_SLEEVES(CUP_U_B_CZ_WDL_NoKneepads,CUP_U_B_CZ_WDL_Kneepads_Gloves);



// Armed Forces of Ukraine
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_AFU_ACU_M14,CUP_U_B_AFU_ACU_Gloves_M14,CUP_U_B_AFU_ACU_Kneepad_M14,CUP_U_B_AFU_ACU_Kneepad_Gloves_M14,CUP_U_B_AFU_ACU_Rolled_M14,CUP_U_B_AFU_ACU_Rolled_Gloves_M14,CUP_U_B_AFU_ACU_Kneepad_Rolled_M14,CUP_U_B_AFU_ACU_Kneepad_Rolled_Gloves_M14);

// Gorka
UNIFORM_GLOVES(CUP_U_O_RUS_Gorka_Green,CUP_U_O_RUS_Gorka_Green_gloves2);
UNIFORM_GLOVES(CUP_U_O_RUS_Gorka_Partizan_A,CUP_U_O_RUS_Gorka_Partizan_A_gloves2);
UNIFORM_GLOVES(CUP_U_O_RUS_Gorka_Partizan,CUP_U_O_RUS_Gorka_Partizan_gloves2);

// British Armed Forces
UNIFORM_GLOVES(CUP_U_B_BAF_MTP_UBACSTSHIRT,CUP_U_B_BAF_MTP_UBACSTSHIRT_Gloves);
UNIFORM_GLOVES(CUP_U_B_BAF_DPM_UBACSTSHIRT,CUP_U_B_BAF_DPM_UBACSTSHIRT_Gloves);
UNIFORM_GLOVES(CUP_U_B_BAF_DDPM_UBACSTSHIRT,CUP_U_B_BAF_DDPM_UBACSTSHIRT_Gloves);

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


// UNIFORM_SLEEVES
// Chernarussian Defence Force 
UNIFORM_SLEEVES(CUP_U_B_CDF_DST_1,CUP_U_B_CDF_DST_2);
UNIFORM_SLEEVES(CUP_U_B_CDF_FST_1,CUP_U_B_CDF_FST_2);
UNIFORM_SLEEVES(CUP_U_B_CDF_MNT_1,CUP_U_B_CDF_MNT_2);
UNIFORM_GLOVES(CUP_U_B_CDF_SNW_1,CUP_U_B_CDF_SNW_2);

// UNIFORM_HOOD(CUP_U_I_GUE_Flecktarn2,CUP_U_I_GUE_Flecktarn3)

// Rebels
UNIFORM_HOOD(CUP_U_I_GUE_Flecktarn2,CUP_U_I_GUE_Flecktarn3);

// PMC
UNIFORM_HOOD(CUP_I_B_PMC_Unit_30,CUP_I_B_PMC_Unit_29);
UNIFORM_HOOD(CUP_I_B_PMC_Unit_27,CUP_I_B_PMC_Unit_26);
UNIFORM_HOOD(CUP_I_B_PMC_Unit_25,CUP_I_B_PMC_Unit_18);
UNIFORM_HOOD(CUP_I_B_PMC_Unit_34,CUP_I_B_PMC_Unit_33);

//Royal Army Corps of Sahrani
UNIFORM_SLEEVES(CUP_U_I_RACS_Desert_1,CUP_U_I_RACS_Desert_2);
UNIFORM_SLEEVES(CUP_U_I_RACS_mech_1,CUP_U_I_RACS_mech_2);
UNIFORM_SLEEVES(CUP_U_I_RACS_Urban_1,CUP_U_I_RACS_Urban_2);
UNIFORM_SLEEVES(CUP_U_I_RACS_WDL_1,CUP_U_I_RACS_WDL_2);

// US Army
// BASE_PAIR(CUP_U_B_USArmy_Base,CUP_U_B_USArmy_TwoKnee);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_OCP,CUP_U_B_USArmy_ACU_Gloves_OCP,CUP_U_B_USArmy_ACU_Kneepad_OCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP,CUP_U_B_USArmy_ACU_Rolled_OCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_OCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_OCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OCP);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_OEFCP,CUP_U_B_USArmy_ACU_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Rolled_OEFCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_OEFCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_OEFCP);
CUP_UNIFORM_GLOVES_KNEEPAD_ROLLED(CUP_U_B_USArmy_ACU_UCP,CUP_U_B_USArmy_ACU_Gloves_UCP,CUP_U_B_USArmy_ACU_Kneepad_UCP,CUP_U_B_USArmy_ACU_Kneepad_Gloves_UCP,CUP_U_B_USArmy_ACU_Rolled_UCP,CUP_U_B_USArmy_ACU_Rolled_Gloves_UCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_UCP,CUP_U_B_USArmy_ACU_Kneepad_Rolled_Gloves_UCP);

// USMC MCCUU's

// Base Variant "Woodland" but actually FULL MARPAT
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU,CUP_U_B_USMC_MCCUU_gloves,CUP_U_B_USMC_MCCUU_roll,CUP_U_B_USMC_MCCUU_roll_gloves,CUP_U_B_USMC_MCCUU_roll_2,CUP_U_B_USMC_MCCUU_roll_2_gloves);
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_pads,CUP_U_B_USMC_MCCUU_pads_gloves,CUP_U_B_USMC_MCCUU_roll_pads,CUP_U_B_USMC_MCCUU_roll_pads_gloves,CUP_U_B_USMC_MCCUU_roll_2_pads,CUP_U_B_USMC_MCCUU_roll_2_pads_gloves);

// M81 (FULL Woodland)
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_M81,CUP_U_B_USMC_MCCUU_M81_gloves,CUP_U_B_USMC_MCCUU_M81_roll,CUP_U_B_USMC_MCCUU_M81_roll_gloves,CUP_U_B_USMC_MCCUU_M81_roll_2,CUP_U_B_USMC_MCCUU_M81_roll_2_gloves);
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_M81_pads,CUP_U_B_USMC_MCCUU_M81_pads_gloves,CUP_U_B_USMC_MCCUU_M81_roll_pads,CUP_U_B_USMC_MCCUU_M81_roll_pads_gloves,CUP_U_B_USMC_MCCUU_M81_roll_2_pads,CUP_U_B_USMC_MCCUU_M81_roll_2_pads_gloves);

// M81 + Marpat Pants
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_M81_MARPAT,CUP_U_B_USMC_MCCUU_M81_MARPAT_gloves,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_gloves,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_gloves);
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_M81_MARPAT_pads,CUP_U_B_USMC_MCCUU_M81_MARPAT_pads_gloves,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_pads,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_pads_gloves,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_pads,CUP_U_B_USMC_MCCUU_M81_MARPAT_roll_2_pads_gloves);

// Marpat + M81 Pants
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_MARPAT_M81,CUP_U_B_USMC_MCCUU_MARPAT_M81_gloves,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_gloves,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_gloves);
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_MARPAT_M81_pads,CUP_U_B_USMC_MCCUU_MARPAT_M81_pads_gloves,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_pads,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_pads_gloves,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_pads,CUP_U_B_USMC_MCCUU_MARPAT_M81_roll_2_pads_gloves);

// Desert Variant
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_des,CUP_U_B_USMC_MCCUU_des_gloves,CUP_U_B_USMC_MCCUU_des_roll,CUP_U_B_USMC_MCCUU_des_roll_gloves,CUP_U_B_USMC_MCCUU_des_roll_2,CUP_U_B_USMC_MCCUU_des_roll_2_gloves);
CUP_BaseGloveRolledHighRolled_6(CUP_U_B_USMC_MCCUU_des_pads,CUP_U_B_USMC_MCCUU_des_pads_gloves,CUP_U_B_USMC_MCCUU_des_roll_pads,CUP_U_B_USMC_MCCUU_des_roll_pads_gloves,CUP_U_B_USMC_MCCUU_des_roll_2_pads,CUP_U_B_USMC_MCCUU_des_roll_2_pads_gloves);

// BDUv2's
CUP_BDUv2_6_dirty(Alpenflage);
CUP_BDUv2_6_dirty(CEU);
CUP_BDUv2_6_dirty(DCU_US);
CUP_BDUv2_6_dirty(DDPM);
CUP_BDUv2_6_dirty(DPM);
CUP_BDUv2_6_dirty(DPM_OD);
CUP_BDUv2_6_dirty(desert_US);
CUP_BDUv2_6_dirty(OD_US);
CUP_BDUv2_6_dirty(M81_US);
CUP_BDUv2_6_dirty(Urban);
CUP_BDUv2_6_dirty(Tigerstripe);
CUP_BDUv2_6_dirty(ERDL_highland);
CUP_BDUv2_6_dirty(ERDL_lowland);
// CUP_BDUv2_6_dirty(Rhodesian); // Cant be bothered to workaround the bugged base version
CUP_BDUv2_6_dirty(Tpattern);

// Special Case Winter
UNIFORM_GLOVES(CUP_U_B_BDUv2_gloves_Winter_M81,CUP_U_B_BDUv2_Winter_M81);
UNIFORM_GLOVES(CUP_U_B_BDUv2_dirty_Winter_M81,CUP_U_B_BDUv2_gloves_dirty_Winter_M81);



//Armed Forces of the Russian Federation

UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Summer_1,CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_1);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Summer_2,CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Summer_3,CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_3);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Summer_4,CUP_U_O_RUS_Soldier_VKPO_Rolled_Summer_4);

UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Desert_1,CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_1);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Desert_2,CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Desert_3,CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_3);
UNIFORM_SLEEVES(CUP_U_O_RUS_Soldier_VKPO_Desert_4,CUP_U_O_RUS_Soldier_VKPO_Rolled_Desert_4);


CUP_BaseGloveRolled_4(CUP_U_O_RUS_VSR98_worn_VDV,CUP_U_O_RUS_VSR98_worn_gloves_VDV,CUP_U_O_RUS_VSR98_worn_VDV_rolled_up,CUP_U_O_RUS_VSR98_worn_VDV_rolled_up_gloves2);
CUP_BaseGloveRolled_3(CUP_U_O_RUS_VSR98_VDV,CUP_U_O_RUS_VSR98_VDV_rolled_up,CUP_U_O_RUS_VSR98_VDV_rolled_up_gloves2);
CUP_BaseGloveRolled_4(CUP_U_O_RUS_VSR93_worn_VDV,CUP_U_O_RUS_VSR93_worn_gloves_VDV,CUP_U_O_RUS_VSR93_worn_VDV_rolled_up,CUP_U_O_RUS_VSR93_worn_VDV_rolled_up_gloves2);
CUP_BaseGloveRolled_3(CUP_U_O_RUS_VSR93_VDV,CUP_U_O_RUS_VSR93_VDV_rolled_up,CUP_U_O_RUS_VSR93_VDV_rolled_up_gloves2);


UNIFORM_SLEEVES(CUP_U_O_RUS_BeigeDigital_MSV,CUP_U_O_RUS_BeigeDigital_MSV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_BeigeDigital_MSV_gloves_pads,CUP_U_O_RUS_BeigeDigital_MSV_rolled_up_gloves_pads);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_1,CUP_U_O_RUS_EMR_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_Flora_1,CUP_U_O_RUS_Flora_2);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_1_VDV,CUP_U_O_RUS_EMR_2_VDV);
UNIFORM_SLEEVES(CUP_U_O_RUS_EMR_VDV_gloves_pads,CUP_U_O_RUS_EMR_VDV_rolled_up_gloves_pads);
UNIFORM_SLEEVES(CUP_U_O_RUS_M88_MSV,CUP_U_O_RUS_M88_MSV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_M88_VDV,CUP_U_O_RUS_M88_VDV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_KSOR_VDV,CUP_U_O_RUS_KSOR_VDV_rolled_up);
UNIFORM_SLEEVES(CUP_U_O_RUS_KSOR_VDV_gloves_pads,CUP_U_O_RUS_KSOR_VDV_rolled_up_gloves_pads);

UNIFORM_SLEEVES(CUP_U_O_RUS_Flora_1_VDV,CUP_U_O_RUS_Flora_2_VDV);

// Non VDV Variant
UNIFORM_SLEEVES(CUP_U_O_RUS_VSR93_MSV,CUP_U_O_RUS_VSR93_MSV_rolled_up);
CUP_BaseGloveRolled_3(CUP_U_O_RUS_VSR93_worn_MSV,CUP_U_O_RUS_VSR93_worn_gloves_MSV,CUP_U_O_RUS_VSR93_worn_MSV_rolled_up);

UNIFORM_SLEEVES(CUP_U_O_RUS_VSR98_MSV,CUP_U_O_RUS_VSR98_MSV_rolled_up);
CUP_BaseGloveRolled_3(CUP_U_O_RUS_VSR98_worn_MSV,CUP_U_O_RUS_VSR98_worn_gloves_MSV,CUP_U_O_RUS_VSR98_worn_MSV_rolled_up);





