#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common"};
    author[] = {"commy2", "KoffeinFlummi", "CAA-Picard", "bux578"};
    authorUrl = "https://github.com/commy2/";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"

#include <Menu_Config.hpp>

class ACE_Settings {
  class GVAR(FlowMenu) {
    value = 0;
    typeName = "BOOL";
    isClientSetable = 1;
    displayName = "$STR_ACE_Interaction_FlowMenu";
  };
  class GVAR(AutoCloseMenu) {
    value = 0;
    typeName = "BOOL";
    isClientSetable = 1;
    displayName = "$STR_ACE_Interaction_AutoCloseMenu";
  };
  class GVAR(AutoCenterCursor) {
    value = 1;
    typeName = "BOOL";
    isClientSetable = 1;
    displayName = "$STR_ACE_Interaction_AutoCenterCursor";
  };
  class GVAR(EnableTeamManagement) {
    value = 1;
    typeName = "BOOL";
  };
};

class ACE_canInteractConditions {
  class GVAR(isNotSwimming) {
    condition = QUOTE( !underwater ACE_player );
  };
};
