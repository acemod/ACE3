#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {QGVAR(base)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgJointRails.hpp"

class GVAR(display) {
    onLoad = QUOTE(call FUNC(display_init));
    idd = -1;
    class Controls {};
};
class RscStructuredText;
class GVAR(structuredText): RscStructuredText {
    colorText[] = {0.7,0.7,0.7,1};
    size = 0.05; // not safezone scaled
    shadow = 0;
};
