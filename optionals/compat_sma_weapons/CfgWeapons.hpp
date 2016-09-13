
class CfgWeapons {
    class mk20_base_f;
    class SMA_AssaultBase: mk20_base_f {};
    class GrenadeLauncher;
    class UGL_F: GrenadeLauncher {};
    class SMA_556_RIFLEBASE: SMA_AssaultBase {
        magazines[]= {
            "SMA_30Rnd_556x45_M855A1",
            "SMA_30Rnd_556x45_M855A1_Tracer",
            "SMA_30Rnd_556x45_M855A1_IR",
            "SMA_30Rnd_556x45_Mk318",
            "SMA_30Rnd_556x45_Mk318_Tracer",
            "SMA_30Rnd_556x45_Mk318_IR",
            "SMA_30Rnd_556x45_Mk262",
            "SMA_30Rnd_556x45_Mk262_Tracer",
            "SMA_30Rnd_556x45_Mk262_IR",
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
    };
    class SMA_762_RIFLEBASE: SMA_AssaultBase {
        magazines[]= {
            "SMA_20Rnd_762x51mm_M80A1_EPR",
            "SMA_20Rnd_762x51mm_M80A1_EPR_Tracer",
            "SMA_20Rnd_762x51mm_M80A1_EPR_IR",
            "SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range",
            "SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_Tracer",
            "SMA_20Rnd_762x51mm_Mk316_Mod_0_Special_Long_Range_IR",
            "SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier",
            "SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_Tracer",
            "SMA_20Rnd_762x51mm_Mk319_Mod_0_Ball_Barrier_IR",
            "SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic",
            "SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_Tracer",
            "SMA_20Rnd_762x51mm_Lapua_FMJ_Subsonic_IR",
            "20Rnd_762x51_Mag",
            "20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer_Dim",
            "ACE_20Rnd_762x51_Mag_SD",
            "ACE_20Rnd_762x51_M118LR_Mag",
            "ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
            "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
            "ACE_20Rnd_762x51_M993_AP_Mag",
        };
    };
    class SMA_MK16: SMA_556_RIFLEBASE {};
    class SMA_Mk16_EGLM: SMA_MK16 {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_Mk17: SMA_762_RIFLEBASE {};
    class SMA_Mk17_EGLM: SMA_MK17 {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_A3_BASE_F: SMA_556_RIFLEBASE {};
    class SMA_AUG_EGLM: SMA_A3_BASE_F {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_AUG_EGLM_Olive: SMA_AUG_EGLM {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_AUG_EGLM_tan: SMA_AUG_EGLM {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_HK416_BASE: SMA_556_RIFLEBASE {};
    class SMA_HK416GL: SMA_HK416_BASE {
        class HK_GL: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_HK416GLCQB: SMA_HK416_BASE {
        class HK_GL: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_HK416GLCQB_B: SMA_HK416_BASE {
        class HK_GL: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_M4_BASE: SMA_556_RIFLEBASE {};
    class SMA_M4_GL: SMA_M4_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_M4_GL_SM: SMA_M4_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18_BASE: SMA_556_RIFLEBASE {};
    class SMA_MK18_GL: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18_GL_SM: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18TANBLK_GL: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18TANBLK_GL_SM: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18TAN_GL: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
    class SMA_MK18TAN_GL_SM: SMA_MK18_BASE {
        class EGLM: UGL_F {
            magazines[]= {
                "1Rnd_HE_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "UGL_FlareYellow_F",
                "UGL_FlareWhite_F",
                "UGL_FlareRed_F",
                "UGL_FlareGreen_F",
                "UGL_FlareCIR_F",
                "ACE_HuntIR_M203"
            };
        };
    };
};