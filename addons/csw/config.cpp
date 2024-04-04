#include "script_component.hpp"
#include "script_config_macros_csw.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(m3Tripod),QGVAR(m3TripodLow),QGVAR(kordTripod),QGVAR(kordTripodLow),QGVAR(sag30Tripod),QGVAR(m220Tripod),QGVAR(spg9Tripod),QGVAR(mortarBaseplate)};
        weapons[] = {QGVAR(m3CarryTripod),QGVAR(m3CarryTripodLow),QGVAR(kordCarryTripod),QGVAR(kordCarryTripodLow),QGVAR(m220CarryTripod),QGVAR(spg9CarryTripod),QGVAR(sag30CarryTripod),QGVAR(carryMortarBaseplate),QGVAR(staticATCarry),QGVAR(staticAACarry),QGVAR(staticHMGCarry),QGVAR(staticM2ShieldCarry),QGVAR(staticGMGCarry),QGVAR(staticMortarCarry)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"TCVM"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
