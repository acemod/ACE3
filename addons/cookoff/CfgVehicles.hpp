
class CfgVehicles {
    class Sound;
    class GVAR(Sound): Sound {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(Sound);
        scope = 1;
        sound = QGVAR(CookOff);
    };

    class ThingX;
    class GVAR(Turret_MBT_01): ThingX {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(TurretDummy);
        scope = 1;
        model = "\A3\Structures_F\Wrecks\Wreck_Slammer_turret_F.p3d";
    };
    class GVAR(Turret_MBT_02): ThingX {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(TurretDummy);
        scope = 1;
        model = "\A3\Structures_F\Wrecks\Wreck_T72_turret_F.p3d";
    };

    class Tank;
    class Tank_F: Tank {
        GVAR(ammoLocation) = "HitTurret";
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};
    };

    class MBT_01_base_F: Tank_F {
        GVAR(ammoLocation) = "HitHull";
    };
    class APC_Tracked_01_base_F: Tank_F {
        GVAR(ammoLocation) = "HitHull";
    };

    class Car_F;
    class Wheeled_APC_F: Car_F {
        GVAR(ammoLocation) = "HitTurret";
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};

        // big explosions for wheeled APCs (same as for tanks)
        explosionEffect = "FuelExplosionBig";
    };

    class B_MBT_01_base_F;
    class B_MBT_01_cannon_F: B_MBT_01_base_F {
        GVAR(turret)[] = {QGVAR(Turret_MBT_01),{0,-1,0.5}};
    };

    class O_MBT_02_base_F;
    class O_MBT_02_cannon_F: O_MBT_02_base_F {
        GVAR(turret)[] = {QGVAR(Turret_MBT_02),{0,-1,0}};
    };
};
