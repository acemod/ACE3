class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionCategory);
                    insertChildren = QUOTE(_this call FUNC(getActions));
                    icon = QPATHTOF(data\icons\place\white_place_icon.paa);

                    class GVAR(furlFlag) {
                        displayName = CSTRING(Furl);
                        condition = QUOTE(_player call FUNC(carriesFlag));
                        statement = QUOTE(_player call FUNC(furlFlag));
                        icon = QPATHTOF(data\icons\carry\white_furl_icon.paa);
                    };
                };
            };
        };
    };
};
