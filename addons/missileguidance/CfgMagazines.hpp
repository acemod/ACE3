class CfgMagazines {
    class 12Rnd_PG_missiles;

    class 6Rnd_ACE_Hydra70_DAGR: 12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        count = 12;
        displayName = CSTRING(Hydra70_DAGR_6x);
        weight = 36;

    };
    class 12Rnd_ACE_Hydra70_DAGR: 6Rnd_ACE_Hydra70_DAGR {
        count = 12;
        displayName = CSTRING(Hydra70_DAGR_12x);
        weight = 72;
    };
    class 24Rnd_ACE_Hydra70_DAGR: 6Rnd_ACE_Hydra70_DAGR {
        count = 24;
        displayName = CSTRING(Hydra70_DAGR_24x);
        weight = 72;
    };

    class PylonRack_12Rnd_PG_missiles;
    class PylonRack_6Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = CSTRING(Hydra70_DAGR_6x);
        count = 6;
        pylonWeapon = QGVAR(dagr);
    };

    class PylonRack_12Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = CSTRING(Hydra70_DAGR_12x);
        count = 12;
        pylonWeapon = QGVAR(dagr);
    };

    class PylonRack_24Rnd_ACE_DAGR: PylonRack_12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        displayName = CSTRING(Hydra70_DAGR_24x);
        count = 24;
        pylonWeapon = QGVAR(dagr);
    };

#ifdef CREATE_MOCK_PLATFORMS
#include "dev\mock_magazines.hpp"
#endif
};
