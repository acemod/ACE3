#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical_status", "ace_medical_damage", "ace_apl"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "KoffeinFlummi", "Arcanum"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "ACE_Medical_Facilities.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgReplacementItems.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "Cfg3DEN.hpp"
