class Heli_Attack_01_base_F: Helicopter_Base_F {
    incomingMissileDetectionSystem = 16; // Vanilla: 24

    class Turrets: Turrets {
        class MainTurret: MainTurret {
            weapons[] = {"ACE_gatling_20mm_Comanche", "missiles_DAGR", "missiles_ASRAAM", "Laserdesignator_mounted"};
            magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "4Rnd_AAA_missiles", "24Rnd_PG_missiles", "Laserbatteries"};
            turretInfoType = "Rsc_ACE_Helo_UI_Turret";


            class OpticsIn {
                delete Narrow;
                delete Medium;
                delete Wide;

                class ACE_WideUnstabilized {
                    opticsDisplayName = "W NS";
                    initAngleX = 0;
                    minAngleX = -35;
                    maxAngleX = 10;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.466;
                    minFov = 0.466;
                    maxFov = 0.466;
                    visionMode[] = {"Normal", "Ti"};
                    thermalMode[] = {0, 1};
                    gunnerOpticsColor[] = {0, 0, 0, 1};
                    directionStabilized = 0;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
                };

                class ACE_Wide: ACE_WideUnstabilized {
                    opticsDisplayName = "W";
                    initAngleX = 0;
                    minAngleX = -35;
                    maxAngleX = 10;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.466;
                    minFov = 0.466;
                    maxFov = 0.466;
                    visionMode[] = {"Normal", "Ti"};
                    thermalMode[] = {0, 1};
                    gunnerOpticsColor[] = {0, 0, 0, 1};
                    directionStabilized = 1;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_wide_F";
                };

                class ACE_Medium: ACE_Wide {
                    opticsDisplayName = "M";
                    initFov = 0.093;
                    minFov = 0.093;
                    maxFov = 0.093;
                    gunnerOpticsColor[] = {0, 0, 0, 1};
                    directionStabilized = 1;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_medium_F";
                };

                class ACE_Narrow: ACE_Wide {
                    opticsDisplayName = "N";
                    initFov = 0.029;
                    minFov = 0.029;
                    maxFov = 0.029;
                    gunnerOpticsColor[] = {0, 0, 0, 1};
                    directionStabilized = 1;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_narrow_F";
                };

                class ACE_Narrower: ACE_Wide {
                    opticsDisplayName = "Z";
                    initFov = 0.01;
                    minFov = 0.01;
                    maxFov = 0.01;
                    gunnerOpticsColor[] = {0, 0, 0, 1};
                    directionStabilized = 1;
                    horizontallyStabilized = 1;
                    gunnerOpticsModel = "\A3\Weapons_F_Beta\Reticle\Heli_Attack_01_Optics_Gunner_narrow_F";
                };
            };

            class OpticsOut {
                class Monocular {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 1.1;
                    minFov = 0.133;
                    maxFov = 1.1;
                    visionMode[] = {"Normal","NVG"};
                    gunnerOpticsModel = "";
                    gunnerOpticsEffect[] = {};
                    hideUnitInfo = 1;
                };
            };
        };
    };

    class AnimationSources: AnimationSources {
        class Gatling {
            weapon = "ACE_gatling_20mm_Comanche";
        };

        class Muzzle_flash {
            weapon = "ACE_gatling_20mm_Comanche";
        };
    };
};

class Heli_Attack_01_dynamicLoadout_base_F: Heli_Attack_01_base_F {
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            weapons[] = {"ACE_gatling_20mm_Comanche", "Laserdesignator_mounted"};
            magazines[] = {"ACE_500Rnd_20mm_shells_Comanche", "Laserbatteries"};
        };
    };
};
