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

class ACE_Options {
  class Interaction_FlowMenu {
    displayName = "$STR_ACE_Interaction_FlowMenu";
    default = 0;
  };
  class Interaction_AutoCloseMenu {
    displayName = "$STR_ACE_Interaction_AutoCloseMenu";
    default = 0;
  };
  class Interaction_AutoCenterCursor {
    displayName = "$STR_ACE_Interaction_AutoCenterCursor";
    default = 1;
  };
};

class ACE_Parameters_Boolean {
  ACE_Interaction_EnableTeamManagement = 1;
};

class ACE_canInteractConditions {
  class GVAR(isNotEscorting) {
    condition = QUOTE( !(ACE_player getVariable [ARR_2('ACE_isEscorting', false)]) );
  };
  class GVAR(isNotCaptive) {
    condition = QUOTE( !(ACE_player getVariable [ARR_2('ACE_isCaptive', false)]) );
  };
  class GVAR(isNotSurrendering) {
    condition = QUOTE( !(ACE_player getVariable [ARR_2('ACE_isSurrender', false)]) );
  };
  class GVAR(isNotSwimming) {
    condition = QUOTE( !underwater ACE_player );
  };
};
