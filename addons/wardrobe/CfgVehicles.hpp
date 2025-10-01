class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(action_title); // Text shown to user
                    icon = QPATHTOF(data\wardrobe_logo.paa);
                    condition = QUOTE(_player call FUNC(addActionsCondition));
                    statement = "";
                    insertChildren = QUOTE(_player call FUNC(addActions));
                    exceptions[] = {"isNotSwimming","isNotSitting"};
                };
            };
        };
    };
};
