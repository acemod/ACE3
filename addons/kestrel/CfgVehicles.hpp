class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_OpenKestrel {
                displayName = "$STR_ACE_Wind_OpenKestrel";
                condition = QUOTE('ACE_Kestrel' in items _player && {!GVAR(isKestrel)});
                statement = QUOTE(call FUNC(openKestrel));
                showDisabled = 0;
                priority = 2;
                icon = PATHTOF(data\4500NV1.paa);
                hotkey = "K";
            };
            class ACE_CloseKestrel {
                displayName = "$STR_ACE_Wind_CloseKestrel";
                condition = QUOTE(GVAR(isKestrel));
                statement = QUOTE(call FUNC(closeKestrel));
                showDisabled = 0;
                priority = 2;
                icon = PATHTOF(data\4500NV1.paa);
                hotkey = "K";
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Kestrel: Item_Base_F {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_ACE_Kestrel_Name";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Kestrel {
                name = "ACE_Kestrel";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Kestrel,6);
        };
    };
};
