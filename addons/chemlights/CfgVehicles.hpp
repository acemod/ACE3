
class CfgVehicles {

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            //todo: add flashlight attach actions
            class ACE_Equipment {
                class ACE_ChemlightShield {
                    displayName = "Chemlight Shield";
                    icon = PATHTOF(UI\ace_chemlight_shield_x_ca.paa);
                    condition = QUOTE(true && {count ([ACE_player] call FUNC(getShieldComponents)) > 0});
                    statement = "true";
                    exceptions[] = {"isNotDragging", "isNotInside", "isNotSitting"};
                    insertChildren = QUOTE(_this call DFUNC(compileShieldMenu));
                    showDisabled = 0;
                    priority = 99;
                };
            };
        };
    };
    
    class Item_Base_F;

    class ACE_Chemlight_ShieldItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Chemlight Shield (Empty)";
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_ChemlightShield {
                name = "ACE_Chemlight_Shield";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_GreenItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Chemlight Shield (Green)";
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Chemlight_Shield_Green {
                name = "ACE_Chemlight_Shield_Green";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_RedItem: ACE_Chemlight_Shield_GreenItem {
        displayName = "Chemlight Shield (Red)";
        class TransportItems {
            class ACE_Chemlight_Shield_Red {
                name = "ACE_Chemlight_Shield_Red";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_BlueItem: ACE_Chemlight_Shield_GreenItem {
        displayName = "Chemlight Shield (Blue)";
        class TransportItems {
            class ACE_Chemlight_Shield_Blue {
                name = "ACE_Chemlight_Shield_Blue";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_YellowItem: ACE_Chemlight_Shield_GreenItem {
        displayName = "Chemlight Shield (Yellow)";
        class TransportItems {
            class ACE_Chemlight_Shield_Yellow {
                name = "ACE_Chemlight_Shield_Yellow";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_OrangeItem: ACE_Chemlight_Shield_GreenItem {
        displayName = "Chemlight Shield (Orange)";
        class TransportItems {
            class ACE_Chemlight_Shield_Orange {
                name = "ACE_Chemlight_Shield_Orange";
                count = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_WhiteItem: ACE_Chemlight_Shield_GreenItem {
        displayName = "Chemlight Shield (White)";
        class TransportItems {
            class ACE_Chemlight_Shield_White {
                name = "ACE_Chemlight_Shield_White";
                count = 1;
            };
        };
    };

    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;
    class Box_NATO_Support_F;

    class Box_NATO_Grenades_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_M84,12);
        };
    };

    class Box_East_Grenades_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_M84,12);
        };
    };

    class Box_IND_Grenades_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_M84,12);
        };
    };

    class Box_FIA_Grenades_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_M84,12);
        };
    };
    
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_M84,12);
        };
    };
};
