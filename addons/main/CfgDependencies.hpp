class CfgSettings {
    class CBA {
        class Versioning {
            class ACE {
                class dependencies {
                    //ACE will hard exit if this is missing
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "true"};
                    
                    //Warnings for missing compat pbos
                    compat_r3f[] = {"ace_compat_r3f", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'R3F_Armes')"};
                    compat_rh_acc[] = {"ace_compat_rh_acc", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'RH_acc')"};
                    compat_rh_de[] = {"ace_compat_rh_de", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'RH_de_cfg')"};
                    compat_rh_m4[] = {"ace_compat_rh_m4", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'RH_m4_cfg')"};
                    compat_rh_pdw[] = {"ace_compat_rh_pdw", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'RH_PDW')"};
                    compat_rhs_afrf3[] = {"ace_compat_rhs_afrf3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'rhs_main')"};
                    compat_rhs_usf3[] = {"ace_compat_rhs_usf3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'rhsusf_main')"};
                    compat_rksl_pm_ii[] = {"ace_compat_rksl_pm_ii", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'RKSL_PMII')"};
                    compat_sma3_iansky[] = {"ace_compat_sma3_iansky", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'iansky_opt')"};
                };
            };
        };
    };
};
