class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class ACE_DisarmInventory {
                    displayName = "$STR_ACE_Disarming_OpenInventory";
                    distance = 4;
                    condition = QUOTE([_target] call FUNC(canDisarm));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(openDisarmDialog));
                    icon = "\a3\Modules_F_Curator\Data\portraitRespawnInventory_ca.paa"; //todo
                    selection = "spine3";
                    exceptions[] = {};
                };
            };
        };
    };
};
