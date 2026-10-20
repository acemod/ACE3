#define CREATE_CSW_PROXY(weapon) class ##weapon; class GVAR(weapon): ##weapon { magazineReloadTime = 0.5; }

#define M2_VARIANT_SHIELD class ADDON: ADDON { \
        disassembleWeapon = QGVAR(staticM2ShieldCarry); \
    }; \
    class AnimationSources: AnimationSources { \
        class Hide_Rail: Hide_Rail {initPhase = 1;}; \
        class Hide_Shield: Hide_Shield {initPhase = 0;}; \
    }
#define M2_VARIANT_BARE class ADDON: ADDON { \
        disassembleWeapon = QGVAR(staticM2BareCarry); \
    }; \
    class AnimationSources: AnimationSources { \
        class Hide_Rail: Hide_Rail {initPhase = 1;}; \
        class Hide_Shield: Hide_Shield {initPhase = 1;}; \
    }
#define M2_VARIANT_SIGHT class ADDON: ADDON { \
        disassembleWeapon = QGVAR(staticM2SightCarry); \
    }; \
    class AnimationSources: AnimationSources { \
        class Hide_Rail: Hide_Rail {initPhase = 0;}; \
        class Hide_Shield: Hide_Shield {initPhase = 1;}; \
    }
#define M2_VARIANT_SHIELD_AND_SIGHT class ADDON: ADDON { \
        disassembleWeapon = QGVAR(staticM2ShieldSightCarry); \
    }; \
    class AnimationSources: AnimationSources { \
        class Hide_Rail: Hide_Rail {initPhase = 0;}; \
        class Hide_Shield: Hide_Shield {initPhase = 0;}; \
    }
