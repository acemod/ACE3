#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_82mm_Mo_HE","ACE_Box_82mm_Mo_Smoke",
            "ACE_Box_82mm_Mo_Illum","ACE_Box_82mm_Mo_Combo"};
        weapons[] = {"ACE_RangeTable_82mm","ace_mortar_82mm"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror","Grey","VKing"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"


//UI Stuff:
class RscText;
class RscListbox;
class RscListNBox;
class RscPicture;
class RscControlsGroup;
class ScrollBar;
class RscActiveText;
class RscStructuredText;

#include "RscInGameUI.hpp"
#include "RscRangeTable.hpp"
