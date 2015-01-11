#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {"AGM_Box_Misc"};
    weapons[] = {"AGM_ItemCore", "AGM_FakePrimaryWeapon"};
    requiredVersion = 0.60;
    requiredAddons[] = {
		"ace_main"
    };
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class CfgFactionClasses {
  class PREFIX {
    displayName = QUOTE(PREFIX);
    priority = 0.1;
    side = 7;
  };
};

class AGM_Rsc_Display_Base {
  idd = -1;
  type = 0;
  style = 48;
  name = "";
  duration = 999999;
  fadeIn = 0;
  fadeOut = 0;
  font = "TahomaB";
  size = 1;
  colorBackground[] = {1, 1, 1, 0};
  colorText[] = {1, 1, 1, 1};
};

class AGM_Rsc_Control_Base {
  idc = 1;
  type = 0;
  style = 48;
  access = 0;
  lineSpacing = 0;
  moving = 1;
  text = "";
  size = 1;
  sizeEx = 0;
  font = "TahomaB";
  colorBackground[] = {1, 1, 1, 0};
  colorText[] = {1, 1, 1, 1};
  x = 0;
  y = 0;
  w = 0;
  h = 0;
};

class GVAR(canInteractConditions) {
  class GVAR(notOnMap) {
    condition = "!visibleMap";
  };
};

class GVAR(Options) {
  class enableNumberHotkeys {
    displayName = "$STR_AGM_Core_EnableNumberHotkeys";
    default = 1;
  };
};

#include <MainMenu.hpp>
#include <MenuConfig.hpp>
#include <ProgressScreen.hpp>
#include <HintConfig.hpp>

/*
class RscControlsGroupNoScrollbars; 
class RscAttributeInventory: RscControlsGroupNoScrollbars {
  onSetFocus = "[_this,""RscAttributeInventory"",'CuratorCommon'] call (uinamespace getvariable ""BIS_fnc_initCuratorAttribute""); _this select 0 call AGM_CuratorFix_fnc_addUnloadEventhandler;";
};
*/

#include <RscInfoType.hpp>
#include <FixPickup.hpp>
#include <FixAnimations.hpp>
#include <NoVoice.hpp>
