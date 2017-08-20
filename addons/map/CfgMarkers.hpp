// MARKERS
class CfgMarkers {
    class Flag;

    // Reenable NATO symbols ...
    class b_unknown: Flag {scope = 2;};
    class n_unknown: b_unknown {};
    class o_unknown: b_unknown {};
    
    // disable all civy markers (harbor etc.)
    class c_unknown: b_unknown {scope = 1;};

    // disable quantity indicators (fire team/squad/platoon ...)
    class group_0: b_unknown {scope = 1;};
};
