class CfgVehicles {
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
    class Car_F;
    class Tank_F: Tank {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0.2;
        GVAR(engineDetonationProb) = 0.2;
        GVAR(hullFireProb) = 0.5;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0.2;
        GVAR(canHaveFireRing) = 0;
    };
    class Wheeled_APC_F: Car_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0.2;
        GVAR(engineDetonationProb) = 0.2;
        GVAR(hullFireProb) = 0.5;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0.2;
        GVAR(canHaveFireRing) = 0;
    };
    class APC_Tracked_01_base_F: Tank_F {};
    class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F {};
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        GVAR(hullDetonationProb) = 0.4;
        GVAR(turretDetonationProb) = 0.4;
        GVAR(engineDetonationProb) = 0.4;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.7;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0.8;
        GVAR(canHaveFireRing) = 1;
    };
    class B_APC_Tracked_01_rcws_F: B_APC_Tracked_01_base_F {
        GVAR(hullDetonationProb) = 0.3;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0.1;
        GVAR(hullFireProb) = 0.8;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0.5;
    };
    class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F {
        GVAR(hullDetonationProb) = 0.3;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0.1;
        GVAR(hullFireProb) = 0.8;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0.5;
    };
    class APC_Wheeled_01_base_F: Wheeled_APC_F {
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3",
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_top_back", "HitSLAT_top_left", "HitSLAT_top_right",
            "HitSLAT_back",
            "HitSLAT_front"
        };
    };
    class B_APC_Wheeled_01_base_F: APC_Wheeled_01_base_F {};
    class B_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_base_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0.2;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.7;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.5;
        GVAR(canHaveFireRing) = 1;
    };
    class APC_Wheeled_02_base_F: Wheeled_APC_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.5;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3",
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_back",
            "HitSLAT_front"
        };
    };
    class AFV_Wheeled_01_base_F: Wheeled_APC_F {
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3",
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_back",
            "HitSLAT_front"
        };
    };
    class B_AFV_Wheeled_01_cannon_F: AFV_Wheeled_01_base_F {
        GVAR(hullDetonationProb) = 0.5;
        GVAR(turretDetonationProb) = 0.5;
        GVAR(engineDetonationProb) = 0.2;
        GVAR(hullFireProb) = 0.2;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0.5;
    };
    class AFV_Wheeled_01_up_base_F: AFV_Wheeled_01_base_F {
        GVAR(eraHitpoints)[] = {
            "HitERA_Front", "HitERA_Left", "HitERA_Right", "HitERA_Top", "HitERA_Back"
        };
    };
    class MBT_01_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0.6;
        GVAR(turretDetonationProb) = 0.3;
        GVAR(engineDetonationProb) = 0.1;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.4;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0.3;
        GVAR(canHaveFireRing) = 1;
    };
    class B_MBT_01_base_F: MBT_01_base_F {};
    class B_MBT_01_cannon_F: B_MBT_01_base_F {
        GVAR(turret)[] = { QGVAR(Turret_MBT_01), {0, -1, 0.5} };
    };
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F {
        GVAR(eraHitpoints)[] = {
            "HitERA_Front",
            "HitERA_Left_1", "HitERA_Left_2", "HitERA_Left_3", "HitERA_Left_4",
            "HitERA_Right_1", "HitERA_Right_2", "HitERA_Right_3", "HitERA_Right_4",
            "HitERA_Top_Front", "HitERA_Top_Left", "HitERA_Top_Right"
        };
    };
    
    class O_MBT_02_base_F;
    class O_MBT_02_cannon_F: O_MBT_02_base_F {
        GVAR(turret)[] = { QGVAR(Turret_MBT_02), {0, -1, 0} };
        GVAR(canHaveFireRing) = 1;
    };
    
    class APC_Tracked_02_base_F : Tank_F {
        GVAR(hullDetonationProb) = 0;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.8;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0.5;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3",
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_back",
            "HitSLAT_front"
        };
        GVAR(canHaveFireRing) = 1;
    };
    class O_APC_Tracked_02_base_F : APC_Tracked_02_base_F {};
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        GVAR(hullDetonationProb) = 0.4;
        GVAR(turretDetonationProb) = 0.4;
        GVAR(engineDetonationProb) = 0.4;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.7;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0.8;
        GVAR(canHaveFireRing) = 1;
    };
    class MBT_04_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.2;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0;
        GVAR(eraHitpoints)[] = {
            "HitERA_Front",
            "HitERA_Left_1", "HitERA_Left_2",
            "HitERA_Right_1", "HitERA_Right_2",
            "HitERA_Top"
        };
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left", "HitSLAT_Right"
        };
        GVAR(canHaveFireRing) = 1;
    };
    class MBT_02_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.2;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0;
        GVAR(eraHitpoints)[] = {
            "HitERA_Front",
            "HitERA_Left_1", "HitERA_Left_2",
            "HitERA_Right_1", "HitERA_Right_2",
            "HitERA_Top_Left_1", "HitERA_Top_Left_2",
            "HitERA_Top_Right_1", "HitERA_Top_Right_2"
        };
        GVAR(canHaveFireRing) = 1;
    };
    class LT_01_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0.8;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0.3;
        GVAR(hullFireProb) = 0.5;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.9;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3", 
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_back",
            "HitSLAT_front"
        };
    };
    class LT_01_scout_base_F: LT_01_base_F {
        GVAR(hullDetonationProb) = 0;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.8;
        GVAR(detonationDuringFireProb) = 0;
    };
    class APC_Tracked_03_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0.2;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.7;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.5;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3",
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_top_back", "HitSLAT_top_left", "HitSLAT_top_right",
            "HitSLAT_back", "HitSLAT_front"
        };
        GVAR(canHaveFireRing) = 1;
    };
    class APC_Wheeled_03_base_F: Wheeled_APC_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.5;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left_1", "HitSLAT_Left_2", "HitSLAT_Left_3", 
            "HitSLAT_Right_1", "HitSLAT_Right_2", "HitSLAT_Right_3",
            "HitSLAT_back",
            "HitSLAT_front"
        };
    };
    class MBT_03_base_F: Tank_F {
        GVAR(hullDetonationProb) = 0.3;
        GVAR(turretDetonationProb) = 0.5;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.3;
        GVAR(turretFireProb) = 0.2;
        GVAR(engineFireProb) = 0.5;
        GVAR(detonationDuringFireProb) = 0.7;
        GVAR(slatHitpoints)[] = {
            "HitSLAT_Left", "HitSLAT_Right", "HitSLAT_back", 
            "HitSLAT_top_left", "HitSLAT_top_right", "HitSLAT_top_back"
        };
        GVAR(canHaveFireRing) = 1;
    };
};

