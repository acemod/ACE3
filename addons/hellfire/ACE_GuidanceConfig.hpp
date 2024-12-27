class EGVAR(missileguidance,AttackProfiles) {
    class hellfire {
        name = "LOAL-DIR";
        nameLocked = "LOBL";
        functionName = QFUNC(attackProfile);
        GVAR(launchHeightClear) = 0;
    };
    class hellfire_hi: hellfire {
        name = "LOAL-HI";
        nameLocked = "LOAL-HI";
        GVAR(launchHeightClear) = 304.8; // clear 1000 ft by 1500m
    };
    class hellfire_lo: hellfire_hi {
        name = "LOAL-LO";
        nameLocked = "LOAL-LO";
        GVAR(launchHeightClear) = 91.5; // clear 300 ft by 600m
    };
};
