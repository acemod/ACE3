#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"

class CfgACEArsenalStats {
    class statBase;
    class gReduction: statBase {
        scope = 2;
        priority = 1;
        stats[]= {"ACE_GForceCoef"};
        displayName= CSTRING(statGReduction);
        showBar= 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(1, 0)], [ARR_2(0.01, 1)], false)])] call EFUNC(arsenal,statBarStatement_default));
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[]= {{3}, {}};
    };
};
