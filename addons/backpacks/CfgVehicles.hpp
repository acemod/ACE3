class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
				class ACE_BackpackToFront {
					displayName = "Backpack to Front";
                    condition = "(backpack _player != '') and (vehicle _player == _player)";
                    //exceptions[] = {"isNotInside"};
                    statement = QUOTE([_player] call FUNC(backpackToFront));
                    showDisabled = 0;
                    priority = 2.5;
                    icon = "\A3\ui_f\data\map\VehicleIcons\iconbackpack_ca.paa";
                    hotkey = "B";
				};
				class ACE_BackpackToBack {
					displayName = "Backpack to Back";
                    condition = "(backpack _player == '') and (vehicle _player == _player)";
                    //exceptions[] = {"isNotInside"};
                    statement = QUOTE([_player] call FUNC(backpackToBack));
                    showDisabled = 0;
                    priority = 2.5;
                    icon = "\A3\ui_f\data\map\VehicleIcons\iconbackpack_ca.paa";
                    hotkey = "B";
				};
			};
		};
	};
};