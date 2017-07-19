// MARKERS
class CfgMarkers {
    class Flag;

    // Reenable NATO symbols ...
    class b_unknown: Flag {scope = 2;};

    // ... and disable all the useless ones
    // If you think that some of these are needed, create an issue; But until
    // there's a better way to place markers, there should be only the most
    // important markers here.
    // Keep in mind that all of these can still be placed in the editor.
    class b_hq: b_unknown {scope = 1;};
    class b_installation: b_unknown {scope = 1;};
    class b_maint: b_unknown {scope = 1;};
    class b_service: b_unknown {scope = 1;};
    class b_support: b_unknown {scope = 1;};

    class n_unknown: b_unknown {};
    class n_hq: n_unknown {scope = 1;};
    class n_installation: n_unknown {scope = 1;};
    class u_installation: n_unknown {scope = 1;}; // i have no idea...
    class n_maint: n_unknown {scope = 1;};
    class n_service: n_unknown {scope = 1;};
    class n_support: n_unknown {scope = 1;};

    class o_unknown: b_unknown {};
    class o_hq: o_unknown {scope = 1;};
    class o_installation: o_unknown {scope = 1;};
    class o_maint: o_unknown {scope = 1;};
    class o_service: o_unknown {scope = 1;};
    class o_support: o_unknown {scope = 1;};

    // disable all civy markers (harbor etc.)
    class c_unknown: b_unknown {scope = 1;};

    // disable quantity indicators (fire team/squad/platoon ...)
    class group_0: b_unknown {scope = 1;};
};
