class CfgWeapons {
    class weapon_AMRAAMLauncher;
    class MissileLauncher;

    class GVAR(aim120Launcher): weapon_AMRAAMLauncher {
        author = "tcvm";
        displayName = CSTRING(aim120);
        weaponLockDelay = 0.5;

        magazines[] = { 
            QGVAR(a),
            QGVAR(PylonRack_1Rnd_a),
            QGVAR(PylonMissile_1Rnd_a),
            
            QGVAR(c),
            QGVAR(PylonMissile_Missile_c_x1),
            QGVAR(PylonRack_Missile_c_x1),
            QGVAR(PylonRack_Missile_c_x2),

            QGVAR(PylonMissile_Missile_d_x1), 
            QGVAR(PylonMissile_Missile_d_INT_x1),
            QGVAR(PylonRack_Missile_d_x1),
            QGVAR(PylonRack_Missile_d_x2)
        };
    
        modes[] = {"Direct", "Loft"};
        class Direct: MissileLauncher {
            displayName = CSTRING(direct);
            textureType = "direct";
            reloadTime = 0.1;
            magazineReloadTime = 0.1;
            aiRateOfFire = 15;
            aiRateOfFireDispersion = -10;
            aiRateOfFireDistance = 10000;
            minRange = 800;
            minRangeProbab = 0.5;
            midRange = 2500;
            midRangeProbab = 0.95;
            maxRange = 4000;
            maxRangeProbab = 1;
            sounds[] = {"StandardSound"};
            class StandardSound {
                begin1[] = {"A3\Sounds_F\weapons\Rockets\missile_2", 1.12202, 1.3, 1000};
                soundBegin[] = {"begin1", 1};
                weaponSoundEffect = "DefaultRifle";
            };
            soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1", 1, 1.5, 700};
            lockingTargetSound[] = {"\A3\Sounds_F\weapons\Rockets\locked_1", 0.562341, 1};
            lockedTargetSound[] = {"\A3\Sounds_F\weapons\Rockets\locked_3", 0.562341, 2.5};

            EGVAR(missileGuidance,attackProfile) = "DIR";
        };
        class Loft: Direct {
            displayName = CSTRING(loft);
            textureType = "topDown";

            minRange = 4000;
            minRangeProbab = 0.5;
            midRange = 7000;
            midRangeProbab = 0.95;
            maxRange = 13000;
            maxRangeProbab = 1;

            EGVAR(missileGuidance,attackProfile) = "LOFT";
        };
    };

    class weapon_R77Launcher;
    class GVAR(r77Launcher): weapon_R77Launcher {
        author = "tcvm";
        displayName = CSTRING(r77);
        weaponLockDelay = 0.5;

        magazines[] = {QGVAR(r77), QGVAR(PylonMissile_Missile_R77_x1), QGVAR(PylonMissile_Missile_R77__INT_x1)};

        modes[] = {"Direct", "Loft"};
        class Direct: MissileLauncher {
            displayName = CSTRING(direct);
            textureType = "direct";
            reloadTime = 0.1;
            magazineReloadTime = 0.1;
            aiRateOfFire = 15;
            aiRateOfFireDispersion = -10;
            aiRateOfFireDistance = 10000;
            minRange = 800;
            minRangeProbab = 0.5;
            midRange = 2500;
            midRangeProbab = 0.95;
            maxRange = 4000;
            maxRangeProbab = 1;
            sounds[] = {"StandardSound"};
            class StandardSound {
                begin1[] = {"A3\Sounds_F\weapons\Rockets\missile_2", 1.12202, 1.3, 1000};
                soundBegin[] = {"begin1", 1};
                weaponSoundEffect = "DefaultRifle";
            };
            soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1", 1, 1.5, 700};
            lockingTargetSound[] = {"\A3\Sounds_F\weapons\Rockets\locked_1", 0.562341, 1};
            lockedTargetSound[] = {"\A3\Sounds_F\weapons\Rockets\locked_3", 0.562341, 2.5};

            EGVAR(missileGuidance,attackProfile) = "DIR";
        };
        class Loft: Direct {
            displayName = CSTRING(loft);
            textureType = "topDown";

            minRange = 4000;
            minRangeProbab = 0.5;
            midRange = 7000;
            midRangeProbab = 0.95;
            maxRange = 13000;
            maxRangeProbab = 1;

            EGVAR(missileGuidance,attackProfile) = "LOFT";
        };
    };
};

