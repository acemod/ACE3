class CfgMagazines {
    class CA_Magazine;
    class R3F_securite_mag: CA_Magazine {
        scope = 1; // Game Update 1.84: "Tweaked: Magazines can now be hidden in Virtual Arsenal by setting their scope to 1", R3F default value 2
    };
    class R3F_15Rnd_9x19_PAMAS: CA_Magazine {
        initSpeed = 368; // according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 350
    };
    class R3F_15Rnd_9x19_HKUSP: CA_Magazine {
        initSpeed = 363; // according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 350
    };
    class R3F_17Rnd_9x19_G17: CA_Magazine {
        initSpeed = 355; // according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 350
    };
    class R3F_5Rnd_127x99_TAC50: CA_Magazine { // AtragMx GunList: R3F TAC50 AMAX
        initSpeed = 823; // 2700 fps according with the McMillan Tactical Products specification and the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 820
    };
};
