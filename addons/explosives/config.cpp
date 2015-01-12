#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"ACE_Clacker", "ACE_DefusalKit", "ACE_M26_Clacker", "ACE_DeadManSwitch"};
    requiredVersion = 0.60;
    requiredAddons[] = {ace_common, ace_interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"Garth 'L-H' de Wet"};
    authorUrl = "http://garth.snakebiteink.co.za/";
  };
};

#include "CfgEventHandlers.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

#include "ExplosivesUI.hpp"

class CfgActions {
  class None;
  class Deactivate:None {
    show = 0;
  };
  class DeactivateMine:None {
    show = 0;
  };
};

class CfgMineTriggers {
  class RangeTrigger;
  class MagneticTrigger: RangeTrigger {
    mineMagnetic = 1;
    mineTriggerRange = 1;
  };
};

class ACE_Parameters_Boolean {
  GVAR(RequireSpecialist) = 0;
  GVAR(PunishNonSpecialists) = 1;
};
