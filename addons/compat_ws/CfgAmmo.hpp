
class CfgAmmo {
    class B_12Gauge_Pellets_Submunition; // #00 Buckshot
    class B_12Gauge_Slug_NoCartridge; // 488m/s (1600fps, 30") ASM (15°C, 999.916hPa, 78%)

    class B_12gauge_Pellets_Cartridge_lxWS: B_12Gauge_Pellets_Submunition {
        submunitionConeType[] = {"poissondisc", 8}; // #00 Buckshot
        // submunitionConeType[] = {"poissondisc", 14}; // No2 Buckshot
        // cartridge = "FxCartridge_12Gauge_Pellet_lxWS";
    };

    class lxWS_B_SG_HE: B_12Gauge_Slug_NoCartridge { // 380m/s 30" ICAO (15°C, 1013.25 hPa, 0%) according to lxWS HE Mags initSpeed
        ACE_muzzleVelocities[] = {265, 343, 372, 381, 403}; // Muzzle Velocities 70°F (21°C, MV 15°C +1m/s), 326m/s (317mm), 332m/s (330.2mm), 380m/s 30" ICAO (15°C, 1013.25 hPa, 0%)
    };

    class lxWS_B_SG_Smoke: B_12Gauge_Slug_NoCartridge { // 380m/s 30" ICAO (15°C, 1013.25 hPa, 0%) according to lxWS Smoke Mags initSpeed
        ACE_muzzleVelocities[] = {265, 343, 372, 381, 403}; // Muzzle Velocities 70°F (21°C, MV 15°C +1m/s), 326m/s (317mm), 332m/s (330.2mm), 380m/s 30" ICAO (15°C, 1013.25 hPa, 0%)
    };
};
