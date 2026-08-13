#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_laser"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class RscText;
class RscEdit;
class RscButton;
class RscPicture;

#include "ACE_GuidanceConfig.hpp"

#include "CfgMissileTypesNato.hpp"
#include "CfgMissileTypesWarsaw.hpp"
#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "GPSDialog.hpp"
#include "MCLOSDialog.hpp"
#ifdef CREATE_MOCK_PLATFORMS
#include "dev\mock_vehicles.hpp"
#endif
