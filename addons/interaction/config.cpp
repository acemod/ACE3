#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_common"};
    version = QUOTE(VERSION);
    versionStr = QUOTE(VERSION);
    versionAr[] = { VERSION_AR };
    author[] = {"commy2", "KoffeinFlummi", "CAA-Picard", "bux578"};
    authorUrl = "https://github.com/commy2/";
  };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"

#include <Menu_Config.hpp>

class ACE_Default_Keys {
  class openInteractionMenuNew {
    displayName = "$STR_ACE_Interaction_InteractionMenu";
    condition = "true";
    statement = QUOTE(call FUNC(onButtonDown));
    conditionUp = QUOTE(!isNull (findDisplay 1713999) && {profileNamespace getVariable [ARR_2(QUOTE(QGVAR(AutoCloseMenu)), false)]});
    statementUp = QUOTE(if (GVAR(MenuType) mod 2 == 0) then {call FUNC(onButtonUp)};);
    exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Medical_canTreat", "ACE_Interaction_isNotEscorting", "ACE_Interaction_isNotSwimming"};
    key = 219;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class openInteractionMenuSelfNew {
    displayName = "$STR_ACE_Interaction_InteractionMenuSelf";
    condition = "true";
    statement = QUOTE(call FUNC(onButtonDownSelf));
    conditionUp = QUOTE(!isNull (findDisplay 1713999) && {profileNamespace getVariable [ARR_2(QUOTE(QGVAR(AutoCloseMenu)), false)]});
    statementUp = QUOTE(if (EGVAR(interaction,MenuType) mod 2 == 1) then {call FUNC(onButtonUp)};);
    exceptions[] = {"ACE_Drag_isNotDragging", "ACE_Medical_canTreat", "ACE_Interaction_isNotEscorting", "ACE_Interaction_isNotSwimming", "ACE_Common_notOnMap"};
    key = 219;
    shift = 0;
    control = 1;
    alt = 0;
  };
  class openDoor {
    displayName = "$STR_ACE_Interaction_OpenDoor";
    condition = QUOTE(!GVAR(isOpeningDoor) && {[2] call FUNC(getDoor) select 1 != ''});
    statement = QUOTE(call ACE_Interaction_fnc_openDoor);
    conditionUp = QUOTE( GVAR(isOpeningDoor) );
    statementUp = QUOTE( GVAR(isOpeningDoor) = false;);
    key = 57;
    shift = 0;
    control = 1;
    alt = 0;
  };
  class tapShoulder {
    displayName = "$STR_ACE_Interaction_TapShoulder";
    condition = QUOTE([_player, cursorTarget] call FUNC(canTapShoulder));
    statement = QUOTE([_player, cursorTarget] call FUNC(tapShoulder););
    key = 20;
    shift = 1;
    control = 0;
    alt = 0;
  };
  class modifierKey {
    displayName = "$STR_ACE_Interaction_ModifierKey";
    condition = "";
    statement = QUOTE(ACE_Modifier = 1;);
    conditionUp = "";
    statementUp = QUOTE(ACE_Modifier = 0;);
    exceptions[] = {"ACE_Drag_isNotDragging"};
    key = 29;
    shift = 0;
    control = 0;
    alt = 0;
  };
};

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
  class ACE_Interaction_isNotEscorting {
    condition = QUOTE( !(_player getVariable ['ACE_isEscorting', false]) );
  };
  class ACE_Interaction_isNotCaptive {
    condition = QUOTE( !(_player getVariable ['ACE_isCaptive', false]) );
  };
  class ACE_Interaction_isNotSurrendering {
    condition = QUOTE( !(_player getVariable ['ACE_isSurrender', false]) );
  };
  class ACE_Interaction_isNotSwimming {
    condition = QUOTE( !underwater _player );
  };
};
