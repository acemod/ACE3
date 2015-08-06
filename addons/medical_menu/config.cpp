#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical"};
        author[] = {$STR_ACE_Common_ACETeam, "Glowbal"};
        authorUrl = "http://ace3mod.com"; 
        VERSION_CONFIG;
    };
};
class CfgAddons {
    class PreloadAddons {
       class ADDON {
          list[] = {QUOTE(ADDON)};
       };
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\menu.hpp"

class ACE_Settings {
    class GVAR(allow) {
        displayName = CSTRING(allow);
        description = CSTRING(allow_Descr);
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(useMenu) {
        displayName = CSTRING(useMenu);
        description = CSTRING(useMenu_Descr);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
    class GVAR(openAfterTreatment) {
        displayName = CSTRING(openAfterTreatment);
        description = CSTRING(openAfterTreatment_Descr);
        typeName = "BOOL";
        value = 1;
        isClientSettable = 1;
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
        };

        class ACE_Actions {
            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical_Menu {
                    displayName = CSTRING(OpenMenu);
                    runOnHover = 0;
                    exceptions[] = {"isNotInside"};
                    condition = QUOTE(GVAR(allow) && GVAR(useMenu));
                    statement = QUOTE([_target] call DFUNC(openMenu));
                    icon = PATHTOEF(medical,UI\icons\medical_cross.paa);
                };
            };
        };
    };
};
