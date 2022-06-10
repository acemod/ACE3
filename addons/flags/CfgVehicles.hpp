class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(action);
                    condition = QUOTE(_player call FUNC(hasFlag));
                    insertChildren = QUOTE(_this call FUNC(addActions));

                    class GVAR(furlFlag) {
                        displayName = CSTRING(furlFlag);
                        condition = QUOTE(_player call FUNC(carriesFlag));
                        statement = QUOTE(_player call FUNC(furlFlag));
                    };
                };
            };
        };
    };
};
