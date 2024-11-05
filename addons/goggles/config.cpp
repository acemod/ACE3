#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'L-H' de Wet"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgGlasses.hpp"
#include "RscTitles.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgGesturesMale.hpp"
#include "CfgCloudlets.hpp"
#include "ComplexEffects.hpp"

#include "ACE_Settings.hpp"
