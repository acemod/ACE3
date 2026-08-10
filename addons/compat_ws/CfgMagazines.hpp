
class CfgMagazines {
    class 11Rnd_45ACP_Mag;
    class 20Rnd_12Gauge_AA40_Slug_lxWS;
    class 20Rnd_12Gauge_AA40_Slug_Tan_lxWS;
    class 20Rnd_12Gauge_AA40_Slug_Snake_lxWS;
    class 8Rnd_12Gauge_AA40_Slug_lxWS;
    class 8Rnd_12Gauge_AA40_Slug_Tan_lxWS;
    class 8Rnd_12Gauge_AA40_Slug_Snake_lxWS;

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

    class ACE_20Rnd_12Gauge_AA40_Slug_lxWS: 20Rnd_12Gauge_AA40_Slug_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(20Rnd_12Gauge_AA40_Slug_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610; // according to ACE_muzzleVelocities 12 Gauge SAAMI test barrel 30" ICAO conditions (15°C, 1013,25 hPa, 0%)
    };

    class ACE_20Rnd_12Gauge_AA40_Slug_Tan_lxWS: 20Rnd_12Gauge_AA40_Slug_Tan_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(20Rnd_12Gauge_AA40_Slug_Tan_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610;
    };

    class ACE_20Rnd_12Gauge_AA40_Slug_Snake_lxWS: 20Rnd_12Gauge_AA40_Slug_Snake_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(20Rnd_12Gauge_AA40_Slug_Snake_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610;
    };

    class ACE_8Rnd_12Gauge_AA40_Slug_lxWS: 8Rnd_12Gauge_AA40_Slug_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(8Rnd_12Gauge_AA40_Slug_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610;
    };

    class ACE_8Rnd_12Gauge_AA40_Slug_Tan_lxWS: 8Rnd_12Gauge_AA40_Slug_Tan_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(8Rnd_12Gauge_AA40_Slug_Tan_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610;
    };

    class ACE_8Rnd_12Gauge_AA40_Slug_Snake_lxWS: 8Rnd_12Gauge_AA40_Slug_Snake_lxWS {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(8Rnd_12Gauge_AA40_Slug_Snake_lxWS_Name);
        displayNameShort = CSTRING(20Rnd_12Gauge_Slug_NameShort);
        ammo = "ACE_12Gauge_Slug_NoCartridge";
        initSpeed = 610;
    };
};
