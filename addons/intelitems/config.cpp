#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QXGVAR(notepad),
            QXGVAR(document),
            QXGVAR(photo)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu", "ace_zeus"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    class XADDON: ADDON {};
};

#include "CfgEventHandlers.hpp"
#include "CfgEditorSubcategories.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
