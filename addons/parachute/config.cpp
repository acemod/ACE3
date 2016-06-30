#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_NonSteerableParachute"};
        weapons[] = {"ACE_Altimeter"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        VERSION_CONFIG;
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'LH' de Wet"};
        url = ECSTRING(main,URL);
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"
