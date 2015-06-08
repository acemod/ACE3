class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Weapon {
                class GVAR(copyRangeCard) {
                    displayName = CSTRING(CopyRangeCard);
                    distance = 2.0;
                    condition = QUOTE(_target call FUNC(canCopy));
                    statement = QUOTE(_target call FUNC(updateClassNames));
                    icon = QUOTE(PATHTOF(UI\RangeCard_Icon.paa));
                };
            };
        };
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    displayName = CSTRING(OpenRangeCard);
                    condition = QUOTE(call FUNC(canShow) && !GVAR(RangeCardOpened));
                    statement = QUOTE(false call FUNC(openRangeCard));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QUOTE(PATHTOF(UI\RangeCard_Icon.paa));
                    exceptions[] = {"notOnMap"};
                };
                class GVAR(openCopy) {
                    displayName = CSTRING(OpenRangeCardCopy);
                    condition = QUOTE(call FUNC(canShowCopy) && !GVAR(RangeCardOpened));
                    statement = QUOTE(true call FUNC(openRangeCard));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QUOTE(PATHTOF(UI\RangeCard_Icon.paa));
                    exceptions[] = {"notOnMap"};
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_RangeCard: Item_Base_F {
        author = "Ruthberg";
        scope = 2;
        scopeCurator = 2;
        displayName = "Range Card";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_RangeCard {
                name = "ACE_RangeCard";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_RangeCard,6);
        };
    };
};
