
class CfgSettings {
    class CBA {
        class Versioning {
            class ACE {
                class dependencies {
                    //ACE will hard exit if this is missing
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};

                    //Warnings for missing RHS compat pbos
                    compat_rhs_afrf3[] = {"ace_compat_rhs_afrf3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'rhs_main')"};
                    compat_rhs_usf3[] = {"ace_compat_rhs_usf3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'rhsusf_main')"};
                    compat_rhs_gref3[] = {"ace_compat_rhs_gref3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'rhsgref_main')"};
                };
            };
        };
    };
};
