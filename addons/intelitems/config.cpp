#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QXGVAR(notepad),
            QXGVAR(document),
            QXGVAR(photo)
        };
        weapons[] = {QGVAR(notepad_Item)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu", "ace_zeus"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    BWC_CONFIG(XADDON);
};

#include "CfgEventHandlers.hpp"
#include "CfgEditorSubcategories.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
