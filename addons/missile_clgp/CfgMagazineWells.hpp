class CfgMagazineWells {
    class ACE_155mm_artillery {
        ADDON[] = {"ace_1rnd_155mm_m712", "ace_8rnd_155mm_m712"};
    };
    class gm_magazineWell_155mm { 
        // gm magwells are misconfigured (extra s on weapon cfg `magazineWells[]` so it does nothing)
        ADDON[] = {"ace_1rnd_155mm_m712", "ace_8rnd_155mm_m712"};
    };
    class CBA_40mm_EGLM { // for longer grenades that can only fit side breech-loading
        ADDON[] = {"ACE_40mm_Pike"};
    };
};
