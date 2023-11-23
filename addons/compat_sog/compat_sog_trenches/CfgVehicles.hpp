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
};
