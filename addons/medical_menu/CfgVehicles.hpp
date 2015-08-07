
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
        };

        class ACE_Actions {
            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical_Menu {
                    displayName = CSTRING(OpenMenu);
                    runOnHover = 0;
                    exceptions[] = {"isNotInside"};
                    condition = QUOTE(GVAR(allow) && GVAR(useMenu));
                    statement = QUOTE([_target] call DFUNC(openMenu));
                    icon = PATHTOEF(medical,UI\icons\medical_cross.paa);
                };
            };
        };
    };
};
