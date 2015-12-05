#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_Clacker", "ACE_DefusalKit", "ACE_M26_Clacker", "ACE_DeadManSwitch", "ACE_Cellphone"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Garth 'L-H' de Wet"};
        authorUrl = "http://garth.snakebiteink.co.za/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"

#include "CfgEventHandlers.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "ACE_Triggers.hpp"
#include "ExplosivesUI.hpp"
#include "GUI_VirtualAmmo.hpp"

class CfgActions {
    class None;
    class Deactivate:None {
        show = 0;
    };
    class DeactivateMine:None {
        show = 0;
    };
};

class CfgMineTriggers {
    class RangeTrigger;
    class MagneticTrigger: RangeTrigger {
        mineMagnetic = 1;
        mineTriggerRange = 1;
    };
};
