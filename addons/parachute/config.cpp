#include "script_component.hpp"

class CfgPatches {
    class ACE_Parachute {
        units[] = {"ACE_NonSteerableParachute"};
        weapons[] = {"ACE_Altimeter"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        VERSION_CONFIG;
        author[] = {"Garth 'LH' de Wet"};
        authorUrl = "http://garth.snakebiteink.co.za/";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"
