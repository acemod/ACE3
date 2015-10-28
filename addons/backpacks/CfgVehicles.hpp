class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_attachBackpack {
                    displayName = CSTRING(BackpackToFront);
                    condition = QUOTE(player call FUNC(canAttachBackpack));
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE(player call FUNC(attachBackpack));
                    priority = 2.5;
                    icon = "\A3\ui_f\data\map\VehicleIcons\iconbackpack_ca.paa";
                    hotkey = "B";
                };
                class ACE_detachBackpack {
                    displayName = CSTRING(BackpackToBack);
                    condition = QUOTE(player call FUNC(canDetachBackpack));
                    exceptions[] = {"isNotInside"};
                    statement = QUOTE(player call FUNC(detachBackpack));
                    priority = 2.5;
                    icon = "\A3\ui_f\data\map\VehicleIcons\iconbackpack_ca.paa";
                    hotkey = "B";
                };
            };
        };
    };
};
