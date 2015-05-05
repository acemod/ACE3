#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"NouberNou", "esteldunedain"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"

#include "CursorMenus.hpp"

class ACE_Settings {
    class GVAR(AlwaysUseCursorSelfInteraction) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_AlwaysUseCursorSelfInteraction";
    };    
    class GVAR(cursorKeepCentered) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_cursorKeepCentered";
        description = "$STR_ACE_Interact_cursorKeepCenteredDescription";
    };
    class GVAR(AlwaysUseCursorInteraction) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_AlwaysUseCursorInteraction";
    };
    class GVAR(UseListMenu) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_UseListMenu";
    };
    class GVAR(colorTextMax) {
        value[] = {1, 1, 1, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_ColorTextMax";
    };
    class GVAR(colorTextMin) {
        value[] = {1, 1, 1, 0.25};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_ColorTextMin";
    };
    class GVAR(colorShadowMax) {
        value[] = {0, 0, 0, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_ColorShadowMax";
    };
    class GVAR(colorShadowMin) {
        value[] = {0, 0, 0, 0.25};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_ColorShadowMin";
    };
    class GVAR(textSize) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_textSize";
        values[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
    };    
    class GVAR(shadowSetting) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_shadowSetting";
        description = "$STR_ACE_Interact_shadowSettingDescription";
        values[] = {"$STR_A3_OPTIONS_DISABLED", "$STR_A3_OPTIONS_ENABLED", "$STR_ACE_Interact_shadowOutline"};
    };
    class GVAR(actionOnKeyRelease) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_Menu_ActionOnKeyRelease";
    };
    class GVAR(showBackground) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_Interact_showBackgroundSetting";
    };
};

class ACE_Extensions {
    extensions[] += {"ace_break_line"};
};
