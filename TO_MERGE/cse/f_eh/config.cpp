class CfgPatches
{
 class cse_f_eh
 {
  units[] = {};
  weapons[] = {};
  requiredVersion = 0.1;
  requiredAddons[] = {/*"cba_extended_eventhandlers", "cba_xeh", "extended_eventhandlers"*/ "A3_Characters_F","A3_Boat_F","A3_animals_f","A3_air_f","A3_soft_f","A3_static_f","A3_weapons_f","a3_structures_f"};
  version = "0.10.0_rc";
  author[] = {"Combat Space Enhancement"};
  authorUrl = "http://csemod.com";
 };
};
class CfgAddons {
    class PreloadAddons {
       class cse_f_eh {
          list[] = {"cse_f_eh"};
       };
    };
};
/* Event handlers */
#include "CfgVehicles.h"

/* For CBA Compatability */
#include "Extended_Init_EventHandlers.h"

 /* Ensures that the functions are being compiled */ 
#include "CfgFunctions.h"

/* To ensure that the custom eventhandler classes exist */
#include "Combat_Space_Enhancement.h"