class DirectionalBombBase;
class vn_mine_m18_ammo: DirectionalBombBase {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, 0, 0.15};
    EGVAR(Explosives,size) = 1;
    EGVAR(Explosives,explosive) = "vn_mine_m18_ammo_scripted";
};

class vn_mine_m18_x3_ammo: vn_mine_m18_ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, 0, 0.1};
    EGVAR(Explosives,explosive) = "vn_mine_m18_x3_ammo_scripted";
};

class APERSBoundingMine_Range_Ammo;
class vn_mine_tripwire_m16_02_ammo: APERSBoundingMine_Range_Ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, -0.01, 0.088};
};

class APERSTripMine_Wire_Ammo;
class vn_mine_tripwire_f1_02_ammo: APERSTripMine_Wire_Ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, -0.01, 0.18};
};

class vn_mine_tripwire_arty_ammo: vn_mine_tripwire_f1_02_ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, -0.01, 0.126};
};

class DemoCharge_Remote_Ammo;
class vn_mine_m112_remote_ammo: DemoCharge_Remote_Ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0, 0.22, 0.75};
};

// Disable engine damage of punji traps, script damage manually
// This allows a tighter control of caused wounds and removes ear ringing
class vn_mine_punji_01_ammo: APERSBoundingMine_Range_Ammo {
    EGVAR(Minedetector,detectable) = 0;
    hit = 0;
    indirectHit = 0;

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapDamage));
        };
    };
};

class vn_mine_punji_02_ammo: vn_mine_punji_01_ammo {
    hit = 0;
    indirectHit = 0;
};

class vn_mine_punji_03_ammo: vn_mine_punji_01_ammo {
    EGVAR(Explosives,defuseObjectPosition)[] = {0.25, 0.023, 0.035};

    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapDamage));
        };
    };
};
