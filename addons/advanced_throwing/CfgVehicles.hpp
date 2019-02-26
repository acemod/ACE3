class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class GVAR(Module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Category);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        icon = QPATHTOF(UI\Icon_Module_AdvancedThrowing_ca.paa);
        class Arguments {
            class enabled {
                displayName = CSTRING(Enable_DisplayName);
                description = CSTRING(Enable_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class showThrowArc {
                displayName = CSTRING(ShowThrowArc_DisplayName);
                description = CSTRING(ShowThrowArc_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class showMouseControls {
                displayName = CSTRING(ShowMouseControls_DisplayName);
                description = CSTRING(ShowMouseControls_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enablePickUp {
                displayName = CSTRING(EnablePickUp_DisplayName);
                description = CSTRING(EnablePickUp_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class enablePickUpAttached {
                displayName = CSTRING(EnablePickUpAttached_DisplayName);
                description = CSTRING(EnablePickUpAttached_Description);
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
        author = ECSTRING(common,ACETeam);
        displayName = "ACE Throwable Pick Up Helper";
        model = "\a3\weapons_f\dummyweapon.p3d";
        scope = 1;

        class ACE_Actions {
            class GVAR(pickUp) {
                displayName = CSTRING(PickUp);
                condition = QUOTE([ARR_2(_player,true)] call FUNC(canPrepare));
                statement = QUOTE(_this call FUNC(pickUp));
                exceptions[] = {"isNotSwimming"};
                distance = 1.8; // Requires >1.7 to work when standing with weapon on back
                icon = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takemine_ca.paa";
            };
        };

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};
