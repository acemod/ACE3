class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(action_title);
                    icon = QPATHTOF(data\wardrobe_logo.paa);
                    condition = QGVAR(enableAction);
                    statement = "";
                    insertChildren = QUOTE(_player call FUNC(addActions));
                    exceptions[] = {"isNotSwimming", "isNotSitting"};
                };
            };
        };
    };
};
