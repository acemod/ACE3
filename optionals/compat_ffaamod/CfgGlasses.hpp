#define COMBAT_GOGGLES \
    ACE_Overlay = z\ace\addons\goggles\textures\HUD\CombatGoggles.paa; \
    ACE_OverlayCracked = z\ace\addons\goggles\textures\HUD\CombatGogglesCracked.paa; \
    ACE_Resistance = 2; \
    ACE_Protection = 1;

class CfgGlasses {
    class None;
    class ffaa_brilat_item_nbq: None {
        COMBAT_GOGGLES
    };
    class ffaa_Glasses: None {
        COMBAT_GOGGLES
    };
};
