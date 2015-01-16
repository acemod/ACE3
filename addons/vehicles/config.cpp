#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2","KoffeinFlummi"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class ACE_Default_Keys {
    class speedLimiter {
        displayName = "$STR_ACE_SpeedLimiter";
        condition = QUOTE(_player == driver _vehicle && {_vehicle isKindOf 'Car' || {_vehicle isKindOf 'Tank'}});
        statement = QUOTE([ARR_2(_player, _vehicle)] call FUNC(speedLimiter));
        key = 211;
        shift = 0;
        control = 0;
        alt = 0;
    };
};
