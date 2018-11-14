#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_ballistics"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"ACE2 Team"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"

// CfgMagazines and CfgWeapons are included for testing only and may be removed for release version.
// There is also an ammo class B_556x45_Ball_Tracer_White commented out in CfgAmmo
// this should also be uncommented when testing white tracers.
/*
class CfgMagazines {
    class 200Rnd_556x45_Box_Tracer_F;
    class 200Rnd_556x45_Box_Green_F : 200Rnd_556x45_Box_Tracer_F {
        ammo = "B_556x45_Ball_Tracer_Green";
        displayName = "5.56 mm 200Rnd Tracer (Green) Box";
    };
    class 200Rnd_556x45_Box_White_F : 200Rnd_556x45_Box_Tracer_F {
        ammo = "B_556x45_Ball_Tracer_White";
        displayName = "5.56 mm 200Rnd Tracer (White) Box";
    };
};

class CfgWeapons {
    class LMG_03_base_F;
    class LMG_03_F : LMG_03_base_F {
        magazines[] = {"200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F","200Rnd_556x45_Box_Green_F","200Rnd_556x45_Box_White_F"};
    };
};
*/
