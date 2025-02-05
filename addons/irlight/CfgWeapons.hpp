// Only a dependency when building
#include "\z\ace\addons\laserpointer\script_macros_config.hpp"

// Attenuation and Flashlight seem to not work with inheritance
#define DBAL_A3_FLASHLIGHT \
    class Flashlight { \
        color[] = {1, 1, 1}; \
        ambient[] = {1, 1, 1}; \
        size = 1; \
        innerAngle = 10; \
        outerAngle = 12; \
        position = "laser pos"; \
        direction = "laser dir"; \
        useFlare = 1; \
        flareSize = 1.4; \
        flareMaxDistance = 200; \
        coneFadeCoef = 6; \
        intensity = 100; \
        irLight = 1; \
        volumeShape = "a3\data_f\VolumeLightFlashlight.p3d"; \
        scale[] = {0.25, 0.25, 1}; \
        class Attenuation { \
            constant = 1; \
            linear = 0; \
            quadratic = 0.008; \
            start = 1; \
            hardLimitStart = 220; \
            hardLimitEnd = 250; \
        }; \
    }
#define DBAL_A3_FLASHLIGHT_LR \
    class Flashlight { \
        color[] = {1, 1, 1}; \
        ambient[] = {1, 1, 1}; \
        size = 1; \
        innerAngle = 10; \
        outerAngle = 12; \
        position = "laser pos"; \
        direction = "laser dir"; \
        useFlare = 1; \
        flareSize = 1.4; \
        flareMaxDistance = 200; \
        coneFadeCoef = 6; \
        intensity = 200; \
        irLight = 1; \
        volumeShape = "a3\data_f\VolumeLightFlashlight.p3d"; \
        scale[] = {0.25, 0.25, 1}; \
        class Attenuation { \
            constant = 1; \
            linear = 0; \
            quadratic = 0.001; \
            start = 1; \
            hardLimitStart = 570; \
            hardLimitEnd = 600; \
        }; \
    }
#define SPIR_FLASHLIGHT(hardLimitStart,hardLimitEnd) \
    color[] = {1, 1, 1}; \
    ambient[] = {1, 1, 1}; \
    size = 1; \
    position = "flash dir"; \
    direction = "flash"; \
    useFlare = 1; \
    flareSize = 1.4; \
    flareMaxDistance = 100; \
    irLight = 1; \
    volumeShape = "a3\data_f\VolumeLightFlashlight.p3d"; \
    class Attenuation { \
        constant = 1; \
        linear = 0; \
        quadratic = 0.02; \
        start = 1; \
        hardLimitStart = hardLimitStart; \
        hardLimitEnd = hardLimitEnd; \
    }
#define SPIR_FLASHLIGHT_LR(hardLimitStart,hardLimitEnd) \
    color[] = {1, 1, 1}; \
    ambient[] = {1, 1, 1}; \
    size = 1; \
    position = "flash dir"; \
    direction = "flash"; \
    useFlare = 1; \
    flareSize = 1.4; \
    flareMaxDistance = 100; \
    irLight = 1; \
    volumeShape = "a3\data_f\VolumeLightFlashlight.p3d"; \
    class Attenuation { \
        constant = 1; \
        linear = 0; \
        quadratic = 0.002; \
        start = 1; \
        hardLimitStart = hardLimitStart; \
        hardLimitEnd = hardLimitEnd; \
    }
#define POINTER_IR \
    class Pointer { \
        irLaserPos = "laser pos"; \
        irLaserEnd = "laser dir"; \
        irDistance = 5; \
    }


class CfgWeapons {
    class acc_pointer_IR;
    class acc_flashlight;
    class InventoryFlashLightItem_Base_F;

    // DBAL-A3 (red pointer)
    // IR Pointer + Illuminator
    class ACE_DBAL_A3_Red: acc_pointer_IR {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DBAL_A3_Red);
        descriptionUse = CSTRING(DBAL_A3_DescriptionUse);
        descriptionShort = CSTRING(DBAL_A3_DescriptionShort);
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_IP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_VP";
        MRT_SwitchItemHintText = CSTRING(Mode_IRDual);
        baseWeapon = "ACE_DBAL_A3_Red";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT;
            POINTER_IR;
        };
    };

    // IR Pointer only
    class ACE_DBAL_A3_Red_IP: ACE_DBAL_A3_Red {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_II";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red";
        MRT_SwitchItemHintText = CSTRING(Mode_IRPointer);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {};
            POINTER_IR;
        };
    };

    // Illuminator only
    class ACE_DBAL_A3_Red_II: ACE_DBAL_A3_Red {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_VP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_IP";
        MRT_SwitchItemHintText = CSTRING(Mode_IRIlluminator);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT;
        };
    };

    // Visible Pointer only
    class ACE_DBAL_A3_Red_VP: ACE_DBAL_A3_Red {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_II";
        MRT_SwitchItemHintText = CSTRING(Mode_VisiblePointer);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {};
            POINTER_VISIBLE_RED;
        };
    };

    // DBAL-A3 (red pointer, long range)
    class ACE_DBAL_A3_Red_LR: ACE_DBAL_A3_Red {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_LR_IP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_LR_VP";
        baseWeapon = "ACE_DBAL_A3_Red_LR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT_LR;
            POINTER_IR;
        };
    };

    class ACE_DBAL_A3_Red_LR_IP: ACE_DBAL_A3_Red_IP {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_LR_II";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_LR";
        baseWeapon = "ACE_DBAL_A3_Red_LR";
    };

    class ACE_DBAL_A3_Red_LR_II: ACE_DBAL_A3_Red_II {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_LR_VP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_LR_IP";
        baseWeapon = "ACE_DBAL_A3_Red_LR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT_LR;
        };
    };

    class ACE_DBAL_A3_Red_LR_VP: ACE_DBAL_A3_Red_VP {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Red_LR";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Red_LR_II";
        baseWeapon = "ACE_DBAL_A3_Red_LR";
    };

    // DBAL-A3 (green pointer)
    class ACE_DBAL_A3_Green: ACE_DBAL_A3_Red {
        scope = 2;
        displayName = CSTRING(DBAL_A3_Green);
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_IP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_VP";
        baseWeapon = "ACE_DBAL_A3_Green";
    };

    class ACE_DBAL_A3_Green_IP: ACE_DBAL_A3_Red_IP {
        displayName = CSTRING(DBAL_A3_Green);
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_II";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green";
        baseWeapon = "ACE_DBAL_A3_Green";
    };

    class ACE_DBAL_A3_Green_II: ACE_DBAL_A3_Red_II {
        displayName = CSTRING(DBAL_A3_Green);
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_VP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_IP";
        baseWeapon = "ACE_DBAL_A3_Green";
    };

    class ACE_DBAL_A3_Green_VP: ACE_DBAL_A3_Red_VP {
        displayName = CSTRING(DBAL_A3_Green);
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_II";
        baseWeapon = "ACE_DBAL_A3_Green";
        class ItemInfo: ItemInfo {
            POINTER_VISIBLE_GREEN;
        };
    };

    // DBAL-A3 (green pointer, long range)
    class ACE_DBAL_A3_Green_LR: ACE_DBAL_A3_Green {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_LR_IP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_LR_VP";
        baseWeapon = "ACE_DBAL_A3_Green_LR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT;
            POINTER_IR;
        };
    };

    class ACE_DBAL_A3_Green_LR_IP: ACE_DBAL_A3_Green_IP {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_LR_II";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_LR";
        baseWeapon = "ACE_DBAL_A3_Green_LR";
    };

    class ACE_DBAL_A3_Green_LR_II: ACE_DBAL_A3_Green_II {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_LR_VP";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_LR_IP";
        baseWeapon = "ACE_DBAL_A3_Green_LR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            DBAL_A3_FLASHLIGHT;
        };
    };

    class ACE_DBAL_A3_Green_LR_VP: ACE_DBAL_A3_Green_VP {
        MRT_SwitchItemNextClass = "ACE_DBAL_A3_Green_LR";
        MRT_SwitchItemPrevClass = "ACE_DBAL_A3_Green_LR_II";
        baseWeapon = "ACE_DBAL_A3_Green_LR";
    };

    // SPIR
    class ACE_SPIR: acc_flashlight {
        author = ECSTRING(common,ACETeam);
        displayName = "SPIR";
        descriptionUse = CSTRING(SPIR_DescriptionUse);
        descriptionShort = CSTRING(SPIR_DescriptionShort);
        MRT_SwitchItemNextClass = "ACE_SPIR_Medium";
        MRT_SwitchItemPrevClass = "ACE_SPIR_Narrow";
        MRT_SwitchItemHintText = CSTRING(Mode_Wide);
        baseWeapon = "ACE_SPIR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT(50,70);
                innerAngle = 20;
                outerAngle = 32;
                coneFadeCoef = 2;
                intensity = 50;
                scale[] = {1, 1, 1};
            };
        };
    };

    class ACE_SPIR_Medium: ACE_SPIR {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_SPIR_Narrow";
        MRT_SwitchItemPrevClass = "ACE_SPIR";
        MRT_SwitchItemHintText = CSTRING(Mode_Medium);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT(80,100);
                intensity = 100;
                innerAngle = 10;
                outerAngle = 12;
                coneFadeCoef = 3;
                scale[] = {1, 1, 5};
            };
        };
    };

    class ACE_SPIR_Narrow: ACE_SPIR {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_SPIR";
        MRT_SwitchItemPrevClass = "ACE_SPIR_Medium";
        MRT_SwitchItemHintText = CSTRING(Mode_Narrow);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT(120,150);
                intensity = 200;
                innerAngle = 5;
                outerAngle = 6;
                coneFadeCoef = 4;
                scale[] = {1, 1, 10};
            };
        };
    };

    // SPIR (long range)
    class ACE_SPIR_LR: ACE_SPIR {
        scope = 1;
        MRT_SwitchItemNextClass = "ACE_SPIR_LR_Medium";
        MRT_SwitchItemPrevClass = "ACE_SPIR_LR_Narrow";
        baseWeapon = "ACE_SPIR_LR";

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT_LR(80,100);
                innerAngle = 20;
                outerAngle = 32;
                coneFadeCoef = 2;
                intensity = 50;
                scale[] = {1, 1, 1};
            };
        };
    };

    class ACE_SPIR_LR_Medium: ACE_SPIR_LR {
        MRT_SwitchItemNextClass = "ACE_SPIR_LR_Narrow";
        MRT_SwitchItemPrevClass = "ACE_SPIR_LR";
        MRT_SwitchItemHintText = CSTRING(Mode_Medium);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT_LR(100,120);
                intensity = 100;
                innerAngle = 10;
                outerAngle = 12;
                coneFadeCoef = 3;
                scale[] = {1, 1, 5};
            };
        };
    };

    class ACE_SPIR_LR_Narrow: ACE_SPIR_LR {
        MRT_SwitchItemNextClass = "ACE_SPIR_LR";
        MRT_SwitchItemPrevClass = "ACE_SPIR_LR_Medium";
        MRT_SwitchItemHintText = CSTRING(Mode_Narrow);

        class ItemInfo: InventoryFlashLightItem_Base_F {
            class Flashlight {
                SPIR_FLASHLIGHT_LR(180,200);
                intensity = 200;
                innerAngle = 5;
                outerAngle = 6;
                coneFadeCoef = 4;
                scale[] = {1, 1, 10};
            };
        };
    };
};
