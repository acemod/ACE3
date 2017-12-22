#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"alganthe"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class Cfg3DEN {
    class Mission {
        class GVAR(DummyCategory) {
            displayName="Dummy attribute, should never show up";
            class AttributeCategories {
                class ACE3_Arsenal {
                    class Attributes {
                        class GVAR(DefaultLoadoutsListAttribute) {
                            property = QGVAR(DefaultLoadoutsListAttribute);
                            value=0;
                            expression="if !(is3DEN) then {ace_arsenal_defaultLoadoutsList = _value};";
                            defaultValue="[]";
                            validate="none";
                            wikiType="[[Array]]";
                        };
                    };
                };
            };
        };
    };
};

#include "ui\RscAttributes.hpp"
#include "CfgEventHandlers.hpp"