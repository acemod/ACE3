#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_MapTools", "ACE_PlottingBoard"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class RscPicture;
class RscText;
class RscObject;

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscDisplayMainMap.hpp"
