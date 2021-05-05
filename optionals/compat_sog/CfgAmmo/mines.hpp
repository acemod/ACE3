// Disable engine damage of punji traps, script damage manually
// This allows a tighter control of caused wounds and removes ear ringing

class APERSBoundingMine_Range_Ammo;
class vn_mine_punji_01_ammo: APERSBoundingMine_Range_Ammo {
    ACE_minedetector_detectable = 0;
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
    class EventHandlers {
        class ADDON {
            AmmoHit = QUOTE(call FUNC(handlePunjiTrapDamage));
        };
    };
};
