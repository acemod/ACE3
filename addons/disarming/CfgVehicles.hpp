class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_Disarm {
                displayName = "Disarm";
                distance = 3;
                condition = QUOTE([_target] call FUNC(canDisarm));
                statement = "";
                showDisabled = 0;
                priority = 3.2;
                enableInside = 0;
            };
        };
    };
};
