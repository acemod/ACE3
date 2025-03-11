class EGVAR(missileguidance,type_Jdam);
class CfgAmmo {
    class ammo_Bomb_SDB;
    class GVAR(sdb): ammo_Bomb_SDB {
        author = "Dani (TCVM)";
        maneuvrability = 0; // no maneuvrability so that default guidance doesnt work
        irLock = 0; // technically deprecated but useful for quick reference
        class Components {}; // no components required
        class ace_missileguidance: EGVAR(missileguidance,type_Jdam) {
            enabled = 1;
        };
    };
};

