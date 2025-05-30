class CfgVehicles {
    // Updated 9P133 to SACLOS variant
    class gm_wheeled_base;
    class gm_wheeled_APC_base: gm_wheeled_base {
        class Turrets;
    };
    class gm_brdm2_base: gm_wheeled_APC_base {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class gm_brdm2_9p133_base: gm_brdm2_base {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {QGVAR(6Rnd_maljutka_heat_9m14p),QGVAR(6Rnd_maljutka_heat_9m14p),QGVAR(6Rnd_maljutka_heat_9m14p)};
            };
        };
    };
};
