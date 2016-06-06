class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Category);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        //icon = PATHTOF(UI\Icon_Module_AdvancedThrowing_ca.paa);//@todo
        class Arguments {
            class Enabled {
                displayName = CSTRING(EnableThrowingSystem_DisplayName);
                description = CSTRING(EnableThrowingSystem_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ShowThrowArc {
                displayName = CSTRING(ShowThrowArc_DisplayName);
                description = CSTRING(ShowThrowArc_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class ShowMouseControls {
                displayName = CSTRING(ShowMouseControls_DisplayName);
                description = CSTRING(ShowMouseControls_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };


    class Items_base_F;
    class GVAR(pickUpHelper): Items_base_F {
        author = ECSTRING(common,Author);
        displayName = "ACE Throwable Pick Up Helper";
        model = "\a3\weapons_f\dummyweapon.p3d";
        scope = 1;

        class ACE_Actions {
            class GVAR(pickUp) {
                displayName = CSTRING(PickUp);
                condition = QUOTE(_player call FUNC(canPrepare));
                statement = QUOTE(_this call FUNC(pickUp));
                distance = 1.5;
                icon = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takemine_ca.paa";
            };
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};
