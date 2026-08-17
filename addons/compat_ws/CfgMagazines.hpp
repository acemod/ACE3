
class CfgMagazines {
    class 11Rnd_45ACP_Mag;

    class 6rnd_Smoke_Mag_lxWS: 11Rnd_45ACP_Mag {
        initSpeed = 336; // 336x0.971576= 326m/s according to Crye Six12 ACE_muzzleVelocities ICAO conditions (15°C, 1013,25 hPa, 0%), 380
    };

    class 6rnd_HE_Mag_lxWS: 11Rnd_45ACP_Mag {
        initSpeed = 336; // 336x0.971576= 326m/s according to Crye Six12 ACE_muzzleVelocities ICAO conditions (15°C, 1013,25 hPa, 0%), 380
    };

    class 2rnd_HE_Mag_lxWS: 6rnd_HE_Mag_lxWS {
        initSpeed = 380;
    };

    class 2rnd_Smoke_Mag_lxWS: 6rnd_Smoke_Mag_lxWS {
        initSpeed = 380;
    };
};

