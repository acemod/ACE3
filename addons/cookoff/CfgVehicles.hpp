
class CfgVehicles {
    class Sound;
    class GVAR(Sound_low): Sound {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(Sound);
        scope = 1;
        sound = QGVAR(CookOff_low);
    };

    class GVAR(Sound_mid): GVAR(Sound_low) {
        sound = QGVAR(CookOff_mid);
    };
    class GVAR(Sound_high): GVAR(Sound_low) {
        sound = QGVAR(CookOff_high);
    };

    class ThingX;
    class GVAR(Turret_MBT_01): ThingX {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(Turret_MBT_01);
        scope = 1;
        displayName = CSTRING(generic_turret_wreck);
        model = "\A3\Structures_F\Wrecks\Wreck_Slammer_turret_F.p3d";
        icon = "\A3\armor_f_gamma\MBT_01\Data\ui\map_slammer_mk4_ca.paa";
    };
    class GVAR(Turret_MBT_02): ThingX {
        author = ECSTRING(common,ACETeam);
        _generalMacro = QGVAR(Turret_MBT_02);
        scope = 1;
        displayName = CSTRING(generic_turret_wreck);
        model = "\A3\Structures_F\Wrecks\Wreck_T72_turret_F.p3d";
        icon = "\A3\armor_f_gamma\MBT_02\Data\UI\map_MBT_02_ca.paa";
    };

    class Tank;
    class Tank_F: Tank {
        GVAR(ammoLocation) = "HitHull";
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};
        GVAR(probability) = 0.5;
    };
    class MBT_02_base_F: Tank_F {
        GVAR(ammoLocation) = "HitTurret";
    };

    class Car_F;
    class Wheeled_APC_F: Car_F {
        GVAR(ammoLocation) = "HitHull";
        GVAR(cookoffSelections)[] = {"poklop_gunner","poklop_commander"};
        GVAR(probability) = 0.8;

        // big explosions for wheeled APCs (same as for tanks)
        explosionEffect = "FuelExplosionBig";
    };

    class APC_Wheeled_02_base_F: Wheeled_APC_F { // Otokar ARMA - RCWS Turret
        GVAR(ignoreTurret) = 1;
    };
    class APC_Tracked_01_base_F: Tank_F { // Namera, Nemmera - RCWS Turret
        GVAR(ignoreTurret) = 1;
    };

    class B_MBT_01_base_F;
    class B_MBT_01_cannon_F: B_MBT_01_base_F {
        GVAR(turret)[] = {QGVAR(Turret_MBT_01),{0,-1,0.5}};
    };

    class O_MBT_02_base_F;
    class O_MBT_02_cannon_F: O_MBT_02_base_F {
        GVAR(turret)[] = {QGVAR(Turret_MBT_02),{0,-1,0}};
    };

    class MRAP_01_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0,-2,0};
    };

    class MRAP_02_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0,-2,0};
    };

    class MRAP_03_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0,-2,0};
    };

    class Quadbike_01_base_F: Car_F {
        GVAR(engineSmokeOffset)[] = {0,1,0};
    };
};
