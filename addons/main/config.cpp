#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = ECSTRING(common,ACETeam);
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@ace";
        name = "Advanced Combat Environment 3";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = CSTRING(URL);
        description = "Issue Tracker: https://github.com/acemod/ACE3/issues";
    };
};

#include "CfgSettings.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgEditorSubcategories.hpp"
