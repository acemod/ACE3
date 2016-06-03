
class CfgVehicles {

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_Chemlights {
                    displayName = CSTRING(Action_Chemlights);
                    icon = "\a3\ui_f\data\gui\cfg\Hints\chemlights_ca.paa";
                    condition = QUOTE((count ([ACE_player] call FUNC(getShieldComponents)) > 0) || (count ([ACE_player] call FUNC(getShields)) > 0));
                    statement = "true";
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    insertChildren = QUOTE(_this call DFUNC(compileChemlightMenu));
                    showDisabled = 0;
                    priority = 99;
                };
            };
        };
    };
    
    class Thing;
    class ThingX;
    
    class ACE_Chemlight_IR_Marker: Thing {
        author = ECSTRING(common,ACETeam);
        displayName = "ACE Chemlight IR Marker";
        mapSize = 0.2;
        icon = "iconObject_1x2";
        scope = 2;
        type = 1;
        vehicleClass = "";
        simulation = "nvmarker";
        nvTarget = 1;
        brightness = 0.2;
        class NVGMarker {
            diffuse[] = {0.1,0.1,0.1};
            ambient[] = {0.01,0.01,0.01};
            brightness = 0.015;
            name = "pozicni blik";
            drawLight = 0;
            drawLightSize = 0;
            drawLightCenterSize = 0;
            activeLight = 0;
            blinking = 0;
            dayLight = 0;
            onlyInNvg = 1;
            useFlare = 0;
        };
    };
    
    class ACE_Chemlight_IR_X: ThingX {
        ACE_Pickup = "ACE_Chemlight_IR";
        author = ECSTRING(common,ACETeam);
        displayName = "ACE Chemlight IR Phys Dummy";
        mass = 1;
        model = "\A3\Weapons_f\chemlight\chemlight_blue";
        scope = 2;
        vehicleClass = "";
    };
    
    class Item_Base_F;

    class ACE_Item_Chemlight_Shield: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Shield_Empty_DisplayName);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Chemlight_Shield {
                name = "ACE_Chemlight_Shield";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_Green: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Shield_Green_DisplayName);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Chemlight_Shield_Green {
                name = "ACE_Chemlight_Shield_Green";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_Red: ACE_Item_Chemlight_Shield_Green {
        displayName = CSTRING(Shield_Red_DisplayName);
        class TransportItems {
            class ACE_Chemlight_Shield_Red {
                name = "ACE_Chemlight_Shield_Red";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_Blue: ACE_Item_Chemlight_Shield_Green {
        displayName = CSTRING(Shield_Blue_DisplayName);
        class TransportItems {
            class ACE_Chemlight_Shield_Blue {
                name = "ACE_Chemlight_Shield_Blue";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_Yellow: ACE_Item_Chemlight_Shield_Green {
        displayName = CSTRING(Shield_Yellow_DisplayName);
        class TransportItems {
            class ACE_Chemlight_Shield_Yellow {
                name = "ACE_Chemlight_Shield_Yellow";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_Orange: ACE_Item_Chemlight_Shield_Green {
        displayName = CSTRING(Shield_Orange_DisplayName);
        class TransportItems {
            class ACE_Chemlight_Shield_Orange {
                name = "ACE_Chemlight_Shield_Orange";
                count = 1;
            };
        };
    };
    
    class ACE_Item_Chemlight_Shield_White: ACE_Item_Chemlight_Shield_Green {
        displayName = CSTRING(Shield_White_DisplayName);
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
    class ReammoBox_F;

    class Box_NATO_Grenades_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class B_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };

    class Box_East_Grenades_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class O_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };

    class Box_IND_Grenades_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class I_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };

    class Box_FIA_Ammo_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class IG_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class C_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Chemlight_Shield,12);
        };
    };
    
    class ACE_Box_Chemlights: NATO_Box_Base {
        scope = 2;
        accuracy = 1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Box_DisplayName);
        transportMaxWeapons = 9002;
        transportMaxMagazines = 9002;
        transportMaxItems = 9002;
        maximumload = 9002;
        model = "\A3\weapons_F\AmmoBoxes\WpnsBox_large_F";
        
        class TransportItems {
            MACRO_ADDITEM(Chemlight_red,20);
            MACRO_ADDITEM(Chemlight_blue,20);
            MACRO_ADDITEM(Chemlight_green,20);
            MACRO_ADDITEM(Chemlight_yellow,20);
            MACRO_ADDITEM(ACE_Chemlight_Orange,20);
            MACRO_ADDITEM(ACE_Chemlight_White,20);
            MACRO_ADDITEM(ACE_Chemlight_HiRed,10);
            MACRO_ADDITEM(ACE_Chemlight_HiYellow,10);
            MACRO_ADDITEM(ACE_Chemlight_HiOrange,10);
            MACRO_ADDITEM(ACE_Chemlight_HiWhite,10);
            MACRO_ADDITEM(ACE_Chemlight_Shield,20);
        };
        
        class AnimationSources {
            class Ammo_source {
                source = "user";
                animPeriod = 1;
                initPhase = 0;
            };
            class AmmoOrd_source {
                source = "user";
                animPeriod = 1;
                initPhase = 1;
            };
            class Grenades_source {
                source = "user";
                animPeriod = 1;
                initPhase = 1;
            };
            class Support_source {
                source = "user";
                animPeriod = 1;
                initPhase = 1;
            };
        };
    };
    /*
    //curator/editor
    
    class Module_F;
    
    class Module_Chemlight_F: Module_F {
        class Arguments {
            class Type {
                displayName = "$STR_A3_CfgVehicles_ModuleChemlight_F_Arguments_Color_0";
                description = "$STR_A3_CfgVehicles_ModuleChemlight_F_Arguments_Color_1";
                class Repeat {
                    displayName = "$STR_A3_CfgVehicles_ModuleChemlight_F_Arguments_Repeat";
                    description = "";
                    typeName = "NUMBER";
                    class values {
                        class Enabled {
                            name = "$STR_DISP_OPT_ENABLED";
                            value = 1;
                        };
                        class Disabled {
                            name = "$STR_DISP_OPT_DISABLED";
                            value = 0;
                            default = 1;
                        };
                    };
                };
                class values {
                    displayName = "$STR_A3_CfgVehicles_ModuleChemlight_F_Arguments_Values_01";
                    description = "$STR_A3_CfgVehicles_ModuleChemlight_F_Arguments_Values_02";
                    class Blue {
                        name = "$STR_A3_CFGMAGAZINES_CHEMLIGHTT_Blue_DNS";
                        value = "Chemlight_blue";
                    };
                    class Green {
                        name = "$STR_A3_CfgMagazines_Chemlight_dns";
                        value = "Chemlight_green";
                    };
                    class Red {
                        name = "$STR_A3_CFGMAGAZINES_CHEMLIGHTT_Red_DNS";
                        value = "Chemlight_Red";
                    };
                    class Yellow {
                        name = "$STR_A3_CFGMAGAZINES_CHEMLIGHTT_Yellow_DNS";
                        value = "Chemlight_Yellow";
                    };
                    class Orange {
                        name = CSTRING(Orange_DisplayNameShort);
                        value = "ACE_Chemlight_Orange";
                    };
                    class White {
                        name = CSTRING(White_DisplayNameShort);
                        value = "ACE_Chemlight_White";
                    };
                };
            };
        };
    };
    
    class ModuleChemlightBlue_F: Module_Chemlight_F {};
    
    class ACE_Module_ChemlightOrange_F: ModuleChemlightBlue_F {
        ammo = "ACE_Chemlight_Orange";
        portrait = PATHTOF(UI\ace_portraitChemlightOrange_ca.paa);
    };
    
    class ACE_Module_ChemlightWhite_F: ModuleChemlightBlue_F {
        ammo = "ACE_Chemlight_White";
        portrait = PATHTOF(UI\ace_portraitChemlightWhite_ca.paa);
    };
    */
};
