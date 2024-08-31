class CfgVehicles {
    // Trench Actions
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class EGVAR(trenches,digEnvelopeSmall);
                class EGVAR(compat_sog,digSpiderhole): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = ECSTRING(compat_sog,Action_DigSpiderhole);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_01')])] call CBA_fnc_execNextFrame);
                };
                class EGVAR(compat_sog,digSpiderholeAngled): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = ECSTRING(compat_sog,Action_DigSpiderholeAngled);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_02')])] call CBA_fnc_execNextFrame);
                };
                class EGVAR(compat_sog,digSpiderholeDual): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = ECSTRING(compat_sog,Action_DigSpiderholeDual);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_03')])] call CBA_fnc_execNextFrame);
                };
            };
        };
    };

    // Spiderholes
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class vn_o_vc_spiderhole_01: StaticWeapon {
        EGVAR(trenches,diggingDuration) = QEGVAR(trenches,smallEnvelopeDigDuration);
        EGVAR(trenches,removalDuration) = QEGVAR(trenches,smallEnvelopeRemoveDuration);
        EGVAR(trenches,noGeoClass) = QEGVAR(compat_sog,spiderhole_01_nogeo);
        EGVAR(trenches,placementData)[] = {1.5, 1.5, 0.1};
        EGVAR(trenches,grassCuttingPoints)[] = {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class ACE_ContinueDiggingTrench {
                    displayName = ECSTRING(trenches,ContinueDiggingTrench);
                    condition = QUOTE([ARR_2(_target,_player)] call EFUNC(trenches,canContinueDiggingTrench));
                    statement = QUOTE([ARR_2(_target,_player)] call EFUNC(trenches,continueDiggingTrench));
                };
            };
        };
    };
    class vn_o_vc_spiderhole_02: vn_o_vc_spiderhole_01 {
        EGVAR(trenches,noGeoClass) = QEGVAR(compat_sog,spiderhole_02_nogeo);
    };
    class vn_o_vc_spiderhole_03: vn_o_vc_spiderhole_01 {
        EGVAR(trenches,noGeoClass) = QEGVAR(compat_sog,spiderhole_03_nogeo);
        EGVAR(trenches,placementData)[] = {1.5, 2.5, 0.1};
    };
    class EGVAR(compat_sog,spiderhole_01_nogeo): vn_o_vc_spiderhole_01 {
        scope = 1;
    };
    class EGVAR(compat_sog,spiderhole_02_nogeo): vn_o_vc_spiderhole_02 {
        scope = 1;
    };
    class EGVAR(compat_sog,spiderhole_03_nogeo): vn_o_vc_spiderhole_03 {
        scope = 1;
    };

    // Vehicle animation interactions
    // BTR-40
    class vn_wheeled_car_base;
    class vn_wheeled_btr40_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class shovel_hide {
                positions[] = {{0.95, -1.5, -0.75}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class vn_wheeled_btr40_01_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{0.95, -1.5, -0.3}};
            };
        };
    };
    class vn_wheeled_btr40_ambulance_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{0.95, -1.5, -0.3}};
            };
        };
    };
    class vn_wheeled_btr40_mg_01_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{0.95, -1.5, -0.8}};
            };
        };
    };
    class vn_wheeled_btr40_mg_03_base: vn_wheeled_btr40_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{1.05, -1.55, -1.1}};
            };
        };
    };
    class vn_wheeled_btr40_mg_04_base: vn_wheeled_btr40_mg_01_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{0.95, -1.5, -0.85}};
            };
        };
    };
    class vn_wheeled_btr40_mg_05_base: vn_wheeled_btr40_mg_04_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class shovel_hide: shovel_hide {
                positions[] = {{0.9, -1.4, -0.85}};
            };
        };
    };

    // Dirt Ranger
    class vn_wheeled_lr2a_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {"_target selectionPosition ['hide_shovel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    // M151
    class vn_wheeled_m151_base: vn_wheeled_car_base {
        class EGVAR(interaction,anims) {
            class user_shovel_hide {
                positions[] = {{0.65, 0.2, -1.4}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class vn_wheeled_m151_mg_03_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_shovel_hide: user_shovel_hide {
                positions[] = {{0.35, 0.2, -1.27}};
            };
        };
    };
    class vn_wheeled_m151_mg_05_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_shovel_hide: user_shovel_hide {
                enabled = 0;
            };
        };
    };
    class vn_wheeled_m151_mg_06_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_shovel_hide: user_shovel_hide {
                enabled = 0;
            };
        };
    };
    class vn_wheeled_m151_01_base: vn_wheeled_m151_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class user_shovel_hide: user_shovel_hide {
                positions[] = {{0.72, 0.2, -0.92}};
            };
        };
    };

    // M113
    class APC_Tracked_01_base_F;
    class vn_armor_m113_base: APC_Tracked_01_base_F {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {{0.2, 2.2, -0.5}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
    class vn_armor_m113_01_base: vn_armor_m113_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_shovel: hide_shovel {};
        };
    };
    class vn_armor_m132_base: vn_armor_m113_01_base {
        class EGVAR(interaction,anims): EGVAR(interaction,anims) {
            class hide_shovel: hide_shovel {
                positions[] = {{0.2, 2.2, -0.35}};
            };
        };
    };

    // Don't inherit, as it's easier for the refuel compat
    // M577
    class vn_armor_m577_base: vn_armor_m113_base {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {{0.2, 5.05, -0.57}};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    // M48
    class vn_armor_tank_base;
    class vn_armor_m48_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_mainturret_tools {
                positions[] = {"_target selectionPosition ['hide_tools', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    // BTR-50PK
    class vn_armor_btr50pk_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {"_target selectionPosition ['hide_shovel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_EntrenchingTool", "ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    // PT-76
    class vn_armor_pt76_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {"_target selectionPosition ['hide_shovel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };

    // Type 63
    class vn_armor_type63_base: vn_armor_tank_base {
        class EGVAR(interaction,anims) {
            class hide_shovel {
                positions[] = {"_target selectionPosition ['hide_shovel', 'FireGeometry', 'AveragePoint']"};
                items[] = {"ACE_EntrenchingTool"};
                name = ECSTRING(trenches,EntrenchingToolName);
                text = ECSTRING(trenches,EntrenchingToolName);
            };
        };
    };
};
