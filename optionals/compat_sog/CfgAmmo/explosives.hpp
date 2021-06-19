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

class APERSBoundingMine_Range_Ammo;
class vn_mine_tripwire_m16_02_ammo: APERSBoundingMine_Range_Ammo {
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
class vn_mine_punji_01_ammo: APERSBoundingMine_Range_Ammo {
    EGVAR(minedetector,detectable) = 0;

    hit = QUOTE(call compile getText (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(hit)'));
    GVAR(hit) = QUOTE([ARR_2(0,1)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    indirectHit = QUOTE(call compile getText (configFile >> 'CfgAmmo' >> 'vn_mine_punji_01_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(0,10)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapDamage));
        };
    };
};

class vn_mine_punji_02_ammo: vn_mine_punji_01_ammo {
    indirectHit = QUOTE(call compile getText (configFile >> 'CfgAmmo' >> 'vn_mine_punji_02_ammo' >> 'GVAR(indirectHit)'));
    GVAR(indirectHit) = QUOTE([ARR_2(0,5)] select isNull (configFile >> 'CfgPatches' >> 'ace_medical'));
};

class vn_mine_punji_03_ammo: vn_mine_punji_01_ammo {
    EGVAR(explosives,defuseObjectPosition)[] = {0.25, 0.023, 0.035};

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapDamage));
        };
    };
};
