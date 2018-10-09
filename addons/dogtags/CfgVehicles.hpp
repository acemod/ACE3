class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Dogtag {
                displayName = CSTRING(itemName);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeDogtag));
                statement = "";
                exceptions[] = {"isNotSwimming", "isNotInside"};
                showDisabled = 0;
                distance = 1.75;
                icon = QPATHTOF(data\dogtag_icon_ca.paa);
                selection = "neck";
                class ACE_CheckDogtag {
                    displayName = CSTRING(checkDogtag);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canCheckDogtag));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(checkDogtag));
                    exceptions[] = {"isNotSwimming", "isNotInside"};
                    showDisabled = 0;
                    icon = QPATHTOF(data\dogtag_icon_ca.paa);
                };
                class ACE_TakeDogtag {
                    displayName = CSTRING(takeDogtag);
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canTakeDogtag));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(takeDogtag));
                    exceptions[] = {"isNotSwimming", "isNotInside"};
                    showDisabled = 0;
                    icon = QPATHTOF(data\dogtag_icon_ca.paa);
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_CheckDogtags {
                    displayName = CSTRING(checkItem);
                    condition = "true";
                    statement = "";
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    insertChildren = QUOTE(_player call DFUNC(addDogtagActions));
                };
            };
        };
    };
};
