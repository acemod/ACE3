#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2","KoffeinFlummi","esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#include "CfgMagazines.hpp"

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"

#include "ACE_Settings.hpp"

class ACE_newEvents {
    setAmmoSync = "ace_setAmmoSync";
    returnedAmmo = "ace_returnedAmmo";
    setAmmoSync = "ace_setAmmoSync";
    returnedAmmo = "ace_returnedAmmo";
    returnedAmmo = "ace_returnedAmmo";
    linkedAmmo = "ace_linkedAmmo";
};