
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_Chemlights {
                    displayName = CSTRING(Action_Chemlights);
                    icon = "\a3\ui_f\data\gui\cfg\Hints\chemlights_ca.paa";
                    condition = QUOTE(count ([ACE_player] call FUNC(getShieldComponents)) > 0);
                    statement = "true";
                    exceptions[] = {"isNotDragging", "isNotSwimming", "notOnMap", "isNotInside", "isNotSitting"};
                    insertChildren = QUOTE(_this call DFUNC(compileChemlightMenu));
                    showDisabled = 0;
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
        scope = 1;
        type = 1;
        vehicleClass = "";
        simulation = "nvmarker";
        nvTarget = 1;
        brightness = 0.2;
        class NVGMarker {
            diffuse[] = {0.04,0.04,0.04};
            ambient[] = {0.0001,0.0001,0.0001};
            brightness = 0.12;
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

    class ACE_Chemlight_IR_Dummy: ThingX {
        ACE_Attachable = "ACE_G_Chemlight_IR";
        author = ECSTRING(common,ACETeam);
        displayName = "ACE Chemlight IR Phys Dummy";
        mass = 0.75;
        model = "\A3\Weapons_f\chemlight\chemlight_blue";
        scope = 1;
        vehicleClass = "";
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
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

    class O_supplyCrate_F: B_supplyCrate_F {
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

    class I_supplyCrate_F: B_supplyCrate_F {
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
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_Chemlight_Orange,20);
            MACRO_ADDMAGAZINE(ACE_Chemlight_White,20);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiRed,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiYellow,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiBlue,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiGreen,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiWhite,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_UltraHiOrange,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_IR,20);
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
            MACRO_ADDITEM(ACE_Chemlight_Shield,20);
        };

        class TransportMagazines {
            MACRO_ADDMAGAZINE(Chemlight_red,20);
            MACRO_ADDMAGAZINE(Chemlight_blue,20);
            MACRO_ADDMAGAZINE(Chemlight_green,20);
            MACRO_ADDMAGAZINE(Chemlight_yellow,20);
            MACRO_ADDMAGAZINE(ACE_Chemlight_Orange,20);
            MACRO_ADDMAGAZINE(ACE_Chemlight_White,20);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiRed,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiYellow,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiBlue,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiGreen,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_HiWhite,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_UltraHiOrange,10);
            MACRO_ADDMAGAZINE(ACE_Chemlight_IR,20);
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

    class Module_F;
    class ModuleChemlight_F: Module_F {
        class Arguments {
            class Type {
                class values {
                    class Orange {
                        name= CSTRING(Orange_DisplayName);
                        value="ACE_G_Chemlight_Orange";
                    };
                    class White {
                        name= CSTRING(White_DisplayName);
                        value="ACE_G_Chemlight_White";
                    };
                    class HiRed {
                        name= CSTRING(HiRed_DisplayName);
                        value="ACE_G_Chemlight_HiRed";
                    };
                    class HiYellow {
                        name= CSTRING(HiYellow_DisplayName);
                        value="ACE_G_Chemlight_HiYellow";
                    };
                    class HiWhite {
                        name= CSTRING(HiWhite_DisplayName);
                        value="ACE_G_Chemlight_HiWhite";
                    };
                    class HiBlue {
                        name= CSTRING(HiBlue_DisplayName);
                        value="ACE_G_Chemlight_HiBlue";
                    };
                    class HiGreen {
                        name= CSTRING(HiGreen_DisplayName);
                        value="ACE_G_Chemlight_HiGreen";
                    };
                    class UltraHiOrange {
                        name= CSTRING(UltraHiOrange_DisplayName);
                        value="ACE_G_Chemlight_UltraHiOrange";
                    };
                };
            };
        };
    };

    class ModuleChemlightBlue_F;
    class ModuleChemlightOrange: ModuleChemlightBlue_F {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightOrange";
        displayName = CSTRING(Orange_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_orange_x_ca.paa);
        ammo = "ACE_G_Chemlight_Orange";
    };
    class ModuleChemlightWhite: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightWhite";
        displayName = CSTRING(White_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_white_x_ca.paa);
        ammo = "ACE_G_Chemlight_White";
    };
    class ModuleChemlightHiRed: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightHiRed";
        displayName = CSTRING(HiRed_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_hired_x_ca.paa);
        ammo = "ACE_G_Chemlight_HiRed";
    };
    class ModuleChemlightHiYellow: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightHiYellow";
        displayName = CSTRING(HiYellow_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_hiyellow_x_ca.paa);
        ammo = "ACE_G_Chemlight_HiYellow";
    };
    class ModuleChemlightHiWhite: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightHiWhite";
        displayName = CSTRING(HiWhite_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_hiwhite_x_ca.paa);
        ammo = "ACE_G_Chemlight_HiWhite";
    };
    class ModuleChemlightHiBlue: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightHiBlue";
        displayName = CSTRING(HiBlue_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_hiblue_x_ca.paa);
        ammo = "ACE_G_Chemlight_HiBlue";
    };
    class ModuleChemlightHiGreen: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightHiGreen";
        displayName = CSTRING(HiGreen_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_higreen_x_ca.paa);
        ammo = "ACE_G_Chemlight_HiGreen";
    };
    class ModuleChemlightUltraHiOrange: ModuleChemlightOrange {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ModuleChemlightUltraHiOrange";
        displayName = CSTRING(UltraHiOrange_DisplayName);
        portrait = QPATHTOF(UI\ace_chemlight_ultrahiorange_x_ca.paa);
        ammo = "ACE_G_Chemlight_UltraHiOrange";
    };
};
