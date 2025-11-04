#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_VehicleLock_ModuleSyncedAssign"};
        weapons[] = {"ACE_key_master", "ACE_key_lockpick", "ACE_key_west", "ACE_key_east", "ace_key_indp", "ace_key_civ"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        authors[] = {"PabstMirror"};
        authorUrl = "https://github.com/acemod/ACE3";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
