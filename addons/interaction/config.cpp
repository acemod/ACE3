class CfgPatches {
  class AGM_Interaction {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi", "CAA-Picard", "bux578"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Interaction {
    class AGM_Interaction {
      file = "\AGM_interaction\functions";
      class addInteraction;
      class addInteractionSelf;
      class AddSelectableItem;
      class addToTooltip;
      class applyButtons;
      class canInteractWith;
      class canLockDoor;
      class canTapShoulder;
      class getActions2;
      class GetActions;
      class getDoor;
      class getDoorAnimations;
      class getDown;
      class getSelectedButton;
      class hideMenu;
      class hideMouseHint;
      class initialiseInteraction;
      class isInRange;
      class joinTeam;
      class lockDoor;
      class menuKeyInput;
      class moduleInteraction;
      class moveDown;
      class onButtonDown;
      class onButtonDownSelf;
      class onButtonUp;
      class onClick;
      class onSelectMenuDblClick;
      class openDoor;
      class openMenu;
      class openMenuSelectUI;
      class openMenuSelf;
      class openSelectMenu;
      class openSubMenu;
      class openSubMenuSelf;
      class prepareSelectMenu;
      class push;
      class removeInteraction;
      class removeInteractionSelf;
      class removeTag;
      class sendAway;
      class showMenu;
      class showMouseHint;
      class sortOptionsByPriority;
      class tapShoulder;
      class updateTooltipPosition;

      // backwards compatibility, remove in some patches
      class getCaptivityStatus;
      class setCaptivityStatus;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Interaction {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Interaction\clientInit.sqf'";
  };
};

class Extended_GetIn_EventHandlers {
  class All {
    class AGM_AutoCloseMenu {
      clientGetIn = "if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1}";
    };
  };
};

class Extended_GetOut_EventHandlers {
  class All {
    class AGM_AutoCloseMenu {
      clientGetOut = "if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1}";
    };
  };
};

class AGM_Core_Default_Keys {
  class openInteractionMenuNew {
    displayName = "$STR_AGM_Interaction_InteractionMenu";
    condition = "true";
    statement = "call AGM_Interaction_fnc_onButtonDown";
    conditionUp = "!isNull (findDisplay 1713999) && {profileNamespace getVariable ['AGM_Interaction_AutoCloseMenu', false]}";
    statementUp = "if (AGM_Interaction_MenuType mod 2 == 0) then {call AGM_Interaction_fnc_onButtonUp};";
    exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Medical_canTreat", "AGM_Interaction_isNotEscorting", "AGM_Interaction_isNotSwimming"};
    key = 219;
    shift = 0;
    control = 0;
    alt = 0;
  };
  class openInteractionMenuSelfNew {
    displayName = "$STR_AGM_Interaction_InteractionMenuSelf";
    condition = "true";
    statement = "call AGM_Interaction_fnc_onButtonDownSelf";
    conditionUp = "!isNull (findDisplay 1713999) && {profileNamespace getVariable ['AGM_Interaction_AutoCloseMenu', false]}";
    statementUp = "if (AGM_Interaction_MenuType mod 2 == 1) then {call AGM_Interaction_fnc_onButtonUp};";
    exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Medical_canTreat", "AGM_Interaction_isNotEscorting", "AGM_Interaction_isNotSwimming", "AGM_Core_notOnMap"};
    key = 219;
    shift = 0;
    control = 1;
    alt = 0;
  };
  class openDoor {
    displayName = "$STR_AGM_Interaction_OpenDoor";
    condition = "!AGM_Interaction_isOpeningDoor && {[2] call AGM_Interaction_fnc_getDoor select 1 != ''}";
    statement = "call AGM_Interaction_fnc_openDoor";
    conditionUp = "AGM_Interaction_isOpeningDoor";
    statementUp = "AGM_Interaction_isOpeningDoor = false";
    key = 57;
    shift = 0;
    control = 1;
    alt = 0;
  };
  // disabled for now
  /*class lockDoor {
    displayName = "$STR_AGM_Interaction_LockDoor";
    condition = "[true] call AGM_Interaction_fnc_canLockDoor && {!AGM_Interaction_isOpeningDoor}";
    statement = "[true] call AGM_Interaction_fnc_lockDoor";
    key = 57;
    shift = 0;
    control = 0;
    alt = 1;
  };
  class unlockDoor {
    displayName = "$STR_AGM_Interaction_UnlockDoor";
    condition = "[false] call AGM_Interaction_fnc_canLockDoor";
    statement = "[false] call AGM_Interaction_fnc_lockDoor";
    key = 57;
    shift = 0;
    control = 1;
    alt = 1;
  };*/
  class tapShoulder {
    displayName = "$STR_AGM_Interaction_TapShoulder";
    condition = "[_player, cursorTarget] call AGM_Interaction_fnc_canTapShoulder";
    statement = "[_player, cursorTarget] call AGM_Interaction_fnc_tapShoulder";
    key = 20;
    shift = 1;
    control = 0;
    alt = 0;
  };
  class modifierKey {
    displayName = "$STR_AGM_Interaction_ModifierKey";
    condition = "";
    statement = "AGM_Modifier = 1;";
    conditionUp = "";
    statementUp = "AGM_Modifier = 0;";
    exceptions[] = {"AGM_Drag_isNotDragging"};
    key = 29;
    shift = 0;
    control = 0;
    alt = 0;
  };
};

class AGM_Core_Options {
  class Interaction_FlowMenu {
    displayName = "$STR_AGM_Interaction_FlowMenu";
    default = 0;
  };
  class Interaction_AutoCloseMenu {
    displayName = "$STR_AGM_Interaction_AutoCloseMenu";
    default = 0;
  };
  class Interaction_AutoCenterCursor {
    displayName = "$STR_AGM_Interaction_AutoCenterCursor";
    default = 1;
  };
};

class AGM_Parameters {
  AGM_Modifier = 0;
};
class AGM_Parameters_Boolean {
  AGM_Interaction_EnableTeamManagement = 1;
};

class AGM_Core_canInteractConditions {
  class AGM_Interaction_isNotEscorting {
    condition = "!(_player getVariable ['AGM_isEscorting', false])";
  };
  class AGM_Interaction_isNotCaptive {
    condition = "!(_player getVariable ['AGM_isCaptive', false])";
  };
  class AGM_Interaction_isNotSurrendering {
    condition = "!(_player getVariable ['AGM_isSurrender', false])";
  };
  class AGM_Interaction_isNotSwimming {
    condition = "!underwater _player";
  };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {

  class Module_F;
  class AGM_ModuleInteraction: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Interaction System";
    function = "AGM_Interaction_fnc_moduleInteraction";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Interaction\UI\IconInteraction_ca.paa";
    class Arguments {
      class EnableTeamManagement {
        displayName = "Enable Team Management";
        description = "Should players be allowed to use the Team Management Menu? Default: Yes";
        typeName = "BOOL";
        class values {
          class Yes { default = 1; name = "Yes"; value = 1;};
          class No { name = "No"; value = 0; };
        };
      };
    };
  };

  class Man;
  class CAManBase: Man {
    class AGM_Actions {
      class AGM_TeamManagement {
        displayName = "$STR_AGM_Interaction_TeamManagement";
        distance = 4;
        condition = "alive _target && {!isPlayer _target} && {_target in units group _player} && {AGM_Interaction_EnableTeamManagement}";
        statement = "";
        showDisabled = 0;
        priority = 3.2;
        icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
        subMenu[] = {"AGM_TeamManagement", 0};
        hotkey = "M";
        enableInside = 1;

        class AGM_JoinTeamRed {
          displayName = "$STR_AGM_Interaction_JoinTeamRed";
          distance = 4;
          condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
          statement = "[_target, 'RED'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          icon = "\AGM_Interaction\UI\team\team_red_ca.paa";
          priority = 2.4;
          hotkey = "R";
          enableInside = 1;
        };
        class AGM_JoinTeamGreen {
          displayName = "$STR_AGM_Interaction_JoinTeamGreen";
          distance = 4;
          condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
          statement = "[_target, 'GREEN'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          icon = "\AGM_Interaction\UI\team\team_green_ca.paa";
          priority = 2.3;
          hotkey = "G";
          enableInside = 1;
        };
        class AGM_JoinTeamBlue {
          displayName = "$STR_AGM_Interaction_JoinTeamBlue";
          distance = 4;
          condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
          statement = "[_target, 'BLUE'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          icon = "\AGM_Interaction\UI\team\team_blue_ca.paa";
          priority = 2.2;
          hotkey = "B";
          enableInside = 1;
        };
        class AGM_JoinTeamYellow {
          displayName = "$STR_AGM_Interaction_JoinTeamYellow";
          distance = 4;
          condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
          statement = "[_target, 'YELLOW'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          icon = "\AGM_Interaction\UI\team\team_yellow_ca.paa";
          priority = 2.1;
          hotkey = "Y";
          enableInside = 1;
        };

        class AGM_LeaveTeam {
          displayName = "$STR_AGM_Interaction_LeaveTeam";
          distance = 4;
          condition = "alive _target && {!isPlayer _target} && {_target in units group _player} && {assignedTeam _player != 'MAIN'}";
          statement = "[_target, 'MAIN'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
          priority = 2.5;
          hotkey = "N";
          enableInside = 1;
        };
      };

      class AGM_TapShoulder {
        displayName = "$STR_AGM_Interaction_TapShoulder";
        distance = 4;
        condition = "[_player, _target] call AGM_Interaction_fnc_canTapShoulder";
        statement = "[_player, _target] call AGM_Interaction_fnc_tapShoulder";
        showDisabled = 1;
        priority = 2.8;
        hotkey = "Q";
        enableInside = 1;
      };
      class AGM_JoinGroup {
        displayName = "$STR_AGM_Interaction_JoinGroup";
        distance = 4;
        condition = "side group _player == side group _target && {group _player != group _target}";
        statement = "[_player] joinSilent group _target;";
        showDisabled = 0;
        priority = 2.6;
        icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
        hotkey = "J";
        enableInside = 1;
      };

      class AGM_GetDown {
        displayName = "$STR_AGM_Interaction_GetDown";
        distance = 4;
        condition = "[_target] call AGM_Interaction_fnc_canInteractWith";
        statement = "[_target] call AGM_Interaction_fnc_getDown";
        showDisabled = 0;
        priority = 2.2;
      };
      class AGM_SendAway {
        displayName = "$STR_AGM_Interaction_SendAway";
        distance = 4;
        condition = "[_target] call AGM_Interaction_fnc_canInteractWith";
        statement = "[_target] call AGM_Interaction_fnc_sendAway";
        showDisabled = 0;
        priority = 2.0;
      };
      class AGM_Pardon {
        displayName = "$STR_AGM_Interaction_Pardon";
        distance = 4;
        condition = "rating _target < -2000 && {alive _target} && {side group _player == side group _target}";
        statement = "[_target, '{_this addRating -rating _this}', _target] call AGM_Core_fnc_execRemoteFnc";
        showDisabled = 0;
        priority = 2.5;
        enableInside = 1;
      };
    };

    class AGM_SelfActions {
      class AGM_TeamManagement {
        displayName = "$STR_AGM_Interaction_TeamManagement";
        condition = "AGM_Interaction_EnableTeamManagement";
        statement = "";
        showDisabled = 1;
        priority = 3.2;
        icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
        subMenu[] = {"AGM_TeamManagement", 1};
        enableInside = 1;
        hotkey = "M";

        class AGM_JoinTeamRed {
          displayName = "$STR_AGM_Interaction_JoinTeamRed";
          condition = "true";
          statement = "[_player, 'RED'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          priority = 2.4;
          icon = "\AGM_Interaction\UI\team\team_red_ca.paa";
          enableInside = 1;
          hotkey = "R";
        };
        class AGM_JoinTeamGreen {
          displayName = "$STR_AGM_Interaction_JoinTeamGreen";
          condition = "true";
          statement = "[_player, 'GREEN'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          priority = 2.3;
          icon = "\AGM_Interaction\UI\team\team_green_ca.paa";
          enableInside = 1;
          hotkey = "G";
        };
        class AGM_JoinTeamBlue {
          displayName = "$STR_AGM_Interaction_JoinTeamBlue";
          condition = "true";
          statement = "[_player, 'BLUE'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          priority = 2.2;
          icon = "\AGM_Interaction\UI\team\team_blue_ca.paa";
          enableInside = 1;
          hotkey = "B";
        };
        class AGM_JoinTeamYellow {
          displayName = "$STR_AGM_Interaction_JoinTeamYellow";
          condition = "true";
          statement = "[_player, 'YELLOW'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          priority = 2.1;
          icon = "\AGM_Interaction\UI\team\team_yellow_ca.paa";
          enableInside = 1;
          hotkey = "Y";
        };

        class AGM_LeaveTeam {
          displayName = "$STR_AGM_Interaction_LeaveTeam";
          condition = "assignedTeam _player != 'MAIN'";
          statement = "[_player, 'MAIN'] call AGM_Interaction_fnc_joinTeam";
          showDisabled = 1;
          priority = 2.5;
          icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
          enableInside = 1;
          hotkey = "N";
        };

        class AGM_BecomeLeader {
          displayName = "$STR_AGM_Interaction_BecomeLeader";
          condition = "count (units group _player) > 1 && {leader group _player != _player}";
          statement = "_newGroup = createGroup side group _player; (units group _player) joinSilent _newGroup; _newGroup selectLeader _player;";
          showDisabled = 1;
          priority = 1.0;
          icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
          enableInside = 1;
          hotkey = "L";
        };
        class AGM_LeaveGroup {
          displayName = "$STR_AGM_Interaction_LeaveGroup";
          condition = "count (units group _player) > 1";
          statement = "_oldGroup = units group _player; _newGroup = createGroup side _player; [_player] joinSilent _newGroup; {_player reveal _x} forEach _oldGroup;";
          showDisabled = 1;
          priority = 1.2;
          icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
          enableInside = 1;
          hotkey = "M";
        };
      };

      /* DANCE ANIMATION DOESN'T WORK :(
      class AGM_Dance {
        displayName = "$STR_AGM_Interaction_Dance";
        condition = "isClass (configFile >> 'CfgPatches' >> 'AGM_Movement') and !AGM_Dancing";
        statement = "AGM_Dancing = true; [-2, {_this switchMove 'TestDance';}, player] call CBA_fnc_globalExecute;";
        showDisabled = 0;
        priority = -1.2;
      };
      class AGM_StopDancing {
        displayName = "$STR_AGM_Interaction_StopDancing";
        condition = "AGM_Dancing";
        statement = "AGM_Dancing = false; [-2, {_this switchMove '';}, player] call CBA_fnc_globalExecute;";
        showDisabled = 0;
        priority = -1.2;
      };
      */

      class AGM_Gestures {
        displayName = "$STR_AGM_Interaction_Gestures";
        condition = "canStand _target";
        statement = "";
        showDisabled = 1;
        priority = 3.5;
        subMenu[] = {"AGM_Gestures", 1};
        icon = "AGM_Interaction\UI\gestures_ca.paa";
        hotkey = "G";

        /*class AGM_Gesture_Advance {
          displayName = "$STR_AGM_Interaction_Gestures_Attack";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureAttack';";
          showDisabled = 1;
          priority = 2.0;
        };*/
        class AGM_Gesture_Advance {
          displayName = "$STR_AGM_Interaction_Gestures_Advance";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureAdvance';";
          showDisabled = 1;
          priority = 1.9;
          hotkey = "1";
        };
        class AGM_Gesture_Go {
          displayName = "$STR_AGM_Interaction_Gestures_Go";
          condition = "canStand _target";
          statement = "_target playActionNow (['gestureGo', 'gestureGoB'] select (floor random 2));";
          showDisabled = 1;
          priority = 1.8;
          hotkey = "2";
        };
        class AGM_Gesture_Follow {
          displayName = "$STR_AGM_Interaction_Gestures_Follow";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureFollow';";
          showDisabled = 1;
          priority = 1.7;
          hotkey = "3";
        };
        /*class AGM_Gesture_Point {
          displayName = "$STR_AGM_Interaction_Gestures_Point";
          condition = "canStand _target";
          statement = "_target playActionNow 'gesturePoint';";
          showDisabled = 1;
          priority = 1.6;
        };*/
        class AGM_Gesture_Up {
          displayName = "$STR_AGM_Interaction_Gestures_Up";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureUp';";
          showDisabled = 1;
          priority = 1.5;
          hotkey = "4";
        };
        class AGM_Gesture_Cover {
          displayName = "$STR_AGM_Interaction_Gestures_Cover";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureCover';";
          showDisabled = 1;
          priority = 1.4;
          hotkey = "5";
        };
        class AGM_Gesture_CeaseFire {
          displayName = "$STR_AGM_Interaction_Gestures_Cease_Fire";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureCeaseFire';";
          showDisabled = 1;
          priority = 1.3;
          hotkey = "6";
        };
        class AGM_Gesture_Freeze {
          displayName = "$STR_AGM_Interaction_Gestures_Freeze";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureFreeze';";
          showDisabled = 1;
          priority = 1.2;
          hotkey = "7";
        };
        class AGM_Gesture_Yes {
          displayName = "$STR_AGM_Interaction_Gestures_Yes";
          condition = "canStand _target";
          statement = "_target playActionNow (['gestureYes', 'gestureNod'] select (floor random 2));";
          showDisabled = 1;
          priority = 1.1;
          hotkey = "8";
        };
        class AGM_Gesture_No {
          displayName = "$STR_AGM_Interaction_Gestures_No";
          condition = "canStand _target";
          statement = "_target playActionNow 'gestureNo';";
          showDisabled = 1;
          priority = 1.0;
          hotkey = "9";
        };
        class AGM_Gesture_Hi {
          displayName = "$STR_AGM_Interaction_Gestures_Hi";
          condition = "canStand _target";
          statement = "_target playActionNow (['gestureHi', 'gestureHiB', 'gestureHiC'] select (floor random 3));";
          showDisabled = 1;
          priority = 0.9;
          hotkey = "0";
        };
      };

      class AGM_Equipment {
        displayName = "$STR_AGM_Interaction_Equipment";
        condition = "true";
        statement = "";
        showDisabled = 1;
        priority = 4.5;
        icon = "";  // @todo
        subMenu[] = {"AGM_Equipment", 1};
        enableInside = 1;
        hotkey = "E";

        class AGM_Dummy {
          displayName = "";
          condition = "false";
          statement = "";
          showDisabled = 1;
          priority = -99;
          icon = "AGM_Core\UI\blank_CO.paa";
          enableInside = 1;
        };
      };
    };
  };

  class LandVehicle;
  class Car: LandVehicle {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };
  class Tank: LandVehicle {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };

  class Air;
  class Helicopter: Air {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };
  class Plane: Air {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };

  class Ship;
  class Ship_F: Ship {
    class AGM_Actions {
      class AGM_Push {
        displayName = "$STR_AGM_Interaction_Push";
        distance = 4;
        condition = "getMass _target < 1000 and alive _target";
        statement = "[_target, [2 * (vectorDir _player select 0), 2 * (vectorDir _player select 1), 0.5]] call AGM_Interaction_fnc_push;";
        showDisabled = 0;
        priority = -1;
      };
    };
    class AGM_SelfActions {};
  };

  class StaticWeapon: LandVehicle {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };

  class StaticMortar;
  class Mortar_01_base_F: StaticMortar {
    class AGM_Actions {};
    class AGM_SelfActions {};
  };

  class Box_NATO_Support_F;
  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_CableTie,24)
    };
  };
};

class CfgWeapons {
  class AGM_ItemCore;
  class InventoryItem_Base_F;

  class AGM_CableTie: AGM_ItemCore {
    displayName = "$STR_AGM_Interaction_CableTie_Name";
    descriptionShort = "$STR_AGM_Interaction_CableTie_Description";
    model = "\AGM_Interaction\agm_cabletie.p3d";
    picture = "\AGM_Interaction\UI\agm_cabletie_x_ca.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 1;
    };
  };
};

#include <Menu_Config.hpp>
