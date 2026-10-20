class EGVAR(missileguidance,type_Patriot);
class EGVAR(missileguidance,type_ESSM);
class EGVAR(missileguidance,type_S400);
class CfgAmmo {
    class ammo_Missile_mim145;
    class GVAR(patriot): ammo_Missile_mim145 {
        author = "tcvm";
        maneuvrability = 0;
        class ace_missileguidance: EGVAR(missileguidance,type_Patriot) {
            enabled = 1;
        };
    };

    class ammo_Missile_rim162;
    class GVAR(RIM162): ammo_Missile_rim162 {
        author = "tcvm";
        maneuvrability = 0;
        class ace_missileguidance: EGVAR(missileguidance,type_ESSM) {
            enabled = 1;
        };
    };

    class ammo_Missile_s750;
    class GVAR(s400): ammo_Missile_s750 {
        author = "tcvm";
        maneuvrability = 0;
        class ace_missileguidance: EGVAR(missileguidance,type_S400) {
            enabled = 1;
        };
    };
};

