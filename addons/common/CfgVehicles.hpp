class CfgVehicles {
    /*class Man;
    class CAManBase: Man {
        // @todo
        class UserActions {
            class ACE_Fire {
            displayName = "";
            priority = -99;
            available = 1;
            radius = 2.5;
            radiusView = 0;
            position = "";
            showWindow = 0;
            showIn3D = 0;
            onlyForPlayer = 1;
            shortcut = "DefaultAction";
            condition = QUOTE(call GVAR(UserActionFireCondition));
            statement = QUOTE(call GVAR(UserActionFire));
            userActionID = 100;
            };
        };
    };*/

    // += needs a non inherited entry in that class, otherwise it simply overwrites
    //#include <DefaultItems.hpp>
    class Logic;
    class Module_F: Logic {
        class ModuleDescription;
    };
    class ACE_Module: Module_F {};
    class ACE_ModuleCheckPBOs: ACE_Module {
        author = CSTRING(ACETeam);
        category = "ACE";
        displayName = CSTRING(CheckPBO_DisplayName);
        function = QFUNC(moduleCheckPBOs);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_CheckPBO_ca.paa);
        class Arguments {
            class Action {
                displayName = CSTRING(CheckPBO_Action_DisplayName);
                description = CSTRING(CheckPBO_Action_Description);
                typeName = "NUMBER";
                class values {
                    class WarnOnce {
                        default = 1;
                        name = CSTRING(CheckPBO_Action_WarnOnce);
                        value = 0;
                    };
                    class Warn {
                        name = CSTRING(CheckPBO_Action_WarnPerm);
                        value = 1;
                    };
                    class Kick {
                        name = CSTRING(CheckPBO_Action_Kick);
                        value = 2;
                    };
                };
            };
            class CheckAll {
                displayName = CSTRING(CheckPBO_CheckAll_DisplayName);
                description = CSTRING(CheckPBO_CheckAll_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class Whitelist {
                displayName = CSTRING(CheckPBO_Whitelist_DisplayName);
                description = CSTRING(CheckPBO_Whitelist_Description);
                typeName = "STRING";
                defaultValue = "[]";
            };
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(CheckPBO_Description);
        };
    };

    class ACE_ModuleLSDVehicles: ACE_Module {
        author = CSTRING(ACETeam);
        category = "ACE";
        displayName = CSTRING(LSDVehicles_DisplayName);
        function = "ACE_Common_fnc_moduleLSDVehicles";
        scope = 2;
        icon = QPATHTOF(UI\Icon_Module_LSD_ca.paa);
        isGlobal = 1;
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = CSTRING(LSDVehicles_Description);
            sync[] = {"AnyVehicle"};
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        author = CSTRING(ACETeam);
        displayName = CSTRING(MiscItems);
        transportMaxWeapons = 9001;
        transportMaxMagazines = 9001;
        transportMaxItems = 9001;
        maximumload = 9001;

        class TransportWeapons {};
        class TransportMagazines {};
        class TransportItems {};
        class TransportBackpacks {};
    };

    class Item_Base_F;
    class ACE_bananaItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(bananaDisplayName);
        author = CSTRING(ACETeam);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_banana,1);
        };
    };

    class Land_HelipadEmpty_F;
    class ACE_LogicDummy: Land_HelipadEmpty_F {
        scope = 1;
        SLX_XEH_DISABLED = 1;
        author = CSTRING(ACETeam);
        class EventHandlers {
            init = "(_this select 0) enableSimulation false";
        };
    };

    class Bicycle;
    class ACE_Headbug_Fix: Bicycle {
        scope = 1;
        side = 3;
        model = QPATHTOF(data\ACE_HeadBanger.p3d);
        //model = QPATHTO_M(ACE_HeadBanger.p3d);
        author = CSTRING(ACETeam);
        displayName = " ";
        soundEngine[] = {"", 20, 0.875};
        soundEnviron[] = {"", 25, 0.925};
        isBicycle = 1;
        XEH_DISABLED;
    };

    class Bag_Base;
    class ACE_FakeBackpack: Bag_Base {
        scope = 1;
        maximumLoad = 1E6;
    };
};
