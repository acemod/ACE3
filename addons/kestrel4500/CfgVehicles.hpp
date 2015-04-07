class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_OpenKestrel4500 {
                displayName = "$STR_ACE_Kestrel4500_OpenKestrelDialog";
                condition = QUOTE('ACE_Kestrel4500' in items _player && {!GVAR(Kestrel4500)});
                statement = QUOTE(call FUNC(createKestrelDialog));
                showDisabled = 0;
                priority = 2;
                icon = PATHTOF(UI\Kestrel4500_Icon.paa);
                hotkey = "K";
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Kestrel4500: Item_Base_F {
        author = "Ruthberg";
        scope = 2;
        scopeCurator = 2;
        displayName = "Kestrel 4500";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Kestrel4500 {
                name = "ACE_Kestrel4500";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Kestrel4500,6);
        };
    };
};
