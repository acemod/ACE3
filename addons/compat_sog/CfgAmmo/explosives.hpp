class DirectionalBombBase;
class vn_mine_m18_ammo: DirectionalBombBase {
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.15};
    EGVAR(explosives,size) = 1;
    EGVAR(explosives,explosive) = "vn_mine_m18_ammo_scripted";
};

class vn_mine_m18_x3_ammo: vn_mine_m18_ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0, 0.1};
    EGVAR(explosives,explosive) = "vn_mine_m18_x3_ammo_scripted";
};

class vn_mine_m18_wp_ammo: vn_mine_m18_ammo {
    EGVAR(explosives,explosive) = "vn_mine_m18_wp_ammo_scripted";
};

class vn_mine_m16_base;
class vn_mine_tripwire_m16_02_ammo: vn_mine_m16_base {
    EGVAR(explosives,defuseObjectPosition)[] = {0, -0.01, 0.088};
};

class APERSTripMine_Wire_Ammo;
class vn_mine_tripwire_f1_02_ammo: APERSTripMine_Wire_Ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0, -0.01, 0.18};
};

class vn_mine_tripwire_arty_ammo: vn_mine_tripwire_f1_02_ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0, -0.01, 0.126};
};

class DemoCharge_Remote_Ammo;
class vn_mine_m112_remote_ammo: DemoCharge_Remote_Ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0, 0.22, 0.75};
};

// Disable engine damage of punji traps, script damage manually
// This allows a tighter control of caused wounds and removes ear ringing
class APERSBoundingMine_Range_Ammo;
class vn_mine_punji_01_ammo: APERSBoundingMine_Range_Ammo {
    EGVAR(minedetector,detectable) = 0;

    hit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(hit)'));
    GVAR(hit) = QUOTE([ARR_2(0,1)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    indirectHit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(0,10)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapTrigger));
        };
    };
};

class vn_mine_punji_02_ammo: vn_mine_punji_01_ammo {
    indirectHit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_punji_02_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(0,5)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));
};

class vn_mine_punji_03_ammo: vn_mine_punji_01_ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0.25, 0.023, 0.035};

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapTrigger));
        };
    };
};

class vn_mine_punji_04_ammo: APERSBoundingMine_Range_Ammo {
    EGVAR(minedetector,detectable) = 0;

    hit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(hit)'));
    GVAR(hit) = QUOTE([ARR_2(0,1)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    indirectHit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(0,10)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    GVAR(spikesOffset)[] = {0, 0, 1.8};
    GVAR(spikesCheckSelection) = "head";
    GVAR(spikesCheckRadius) = 1;

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapTrigger));
        };
    };
};

class vn_mine_punji_05_ammo: vn_mine_punji_04_ammo {
    GVAR(spikesOffset)[] = {0, 0, 0};
    GVAR(spikesCheckSelection) = "";

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapTrigger));
        };
    };
};

class APERSMine_Range_Ammo;
class vn_mine_bike_ammo: APERSMine_Range_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_bike_ammo_scripted";
};

class vn_mine_cartridge_ammo: APERSMine_Range_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_cartridge_ammo_scripted";

    // bump range and damage slightly, default values do not work well with ACE Medical
    indirectHit = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_cartridge_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(2,1)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    indirectHitRange = QUOTE(getNumber (configFile >> 'CfgAmmo' >> 'vn_mine_cartridge_ammo' >> 'GVAR(indirectHitRange)'));
    GVAR(indirectHitRange) = QUOTE([ARR_2(0.7,0.3)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));
};

class vn_mine_lighter_ammo: APERSMine_Range_Ammo {
    ACE_damageType = QGVAR(explosive_incendiary);

    EGVAR(explosives,explosive) = "vn_mine_lighter_ammo_scripted";
};

class vn_mine_jerrycan_ammo: APERSMine_Range_Ammo {
    ACE_damageType = QGVAR(explosive_incendiary);

    EGVAR(explosives,explosive) = "vn_mine_jerrycan_ammo_scripted";
};

class vn_mine_pot_ammo: APERSMine_Range_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_pot_ammo_scripted";
};

class vn_mine_mortar_range_ammo: APERSMine_Range_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_mortar_range_ammo_scripted";
};

class vn_mine_limpet_01_ammo: DemoCharge_Remote_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_limpet_01_ammo_scripted";
};

class vn_mine_limpet_02_ammo: vn_mine_limpet_01_ammo {
    EGVAR(explosives,explosive) = "vn_mine_limpet_02_ammo_scripted";
};

class vn_mine_chicom_no8_ammo: APERSMine_Range_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_chicom_no8_ammo_scripted";
};

class vn_mine_dh10_ammo: DirectionalBombBase {
    EGVAR(explosives,explosive) = "vn_mine_dh10_ammo_scripted";
};

class PipeBombBase;
class vn_mine_gboard_range_ammo: PipeBombBase {
    EGVAR(explosives,explosive) = "vn_mine_gboard_range_ammo_scripted";
};

class SatchelCharge_Remote_Ammo;
class vn_mine_satchelcharge_02_ammo: SatchelCharge_Remote_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_satchelcharge_02_ammo_scripted";
};

class vn_mine_bangalore_ammo: SatchelCharge_Remote_Ammo {
    EGVAR(explosives,explosive) = "vn_mine_bangalore_ammo_scripted";
};
