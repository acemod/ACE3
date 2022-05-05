#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"alganthe", "mharis001", "Brett Mayson"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ui\RscAttributes.hpp"
#include "ui\RscCustomArsenalButton.hpp"
#include "Display3DEN.hpp"
#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "RscDisplayMain.hpp"
#include "ACE_Arsenal_Sorts.hpp"
#include "ACE_Arsenal_Stats.hpp"
