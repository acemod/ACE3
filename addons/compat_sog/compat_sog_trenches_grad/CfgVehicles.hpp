class CfgVehicles {
    // Trench Actions
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                // delete in reverse order
                delete EGVAR(compat_sog,digSpiderholeDual);
                delete EGVAR(compat_sog,digSpiderholeAngled);
                delete EGVAR(compat_sog,digSpiderhole);
                delete EGVAR(trenches,digEnvelopeSmall);
            };
        };
    };

    // Spiderholes
    delete EGVAR(compat_sog,spiderhole_01_nogeo);
    delete EGVAR(compat_sog,spiderhole_02_nogeo);
    delete EGVAR(compat_sog,spiderhole_03_nogeo);
};
