class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE_missionModules";
        displayName = CSTRING(DisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 0; // Server only
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Slideshow_ca.paa));
        class Arguments {
            class Objects {
                displayName = CSTRING(Objects_DisplayName);
                description = CSTRING(Objects_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Controllers {
                displayName = CSTRING(Controllers_DisplayName);
                description = CSTRING(Controllers_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Images {
                displayName = CSTRING(Images_DisplayName);
                description = CSTRING(Images_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Names {
                displayName = CSTRING(Names_DisplayName);
                description = CSTRING(Names_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class Duration {
                displayName = CSTRING(Duration_DisplayName);
                description = CSTRING(Duration_Description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Description);

            // Every object in this must be initialized with GVAR(Slides) Action applied, as well as 2 of below macros
            sync[] = {CLASSNAMES_OBJECTS, CLASSNAMES_BOTH, CLASSNAMES_CONTROLLERS};

            #define MACRO_SYNC \
                optional = 1; \
                duplicate = 1;
            #define OBJECT description = "Object";
            #define BOTH description = "Object AND Controller";
            #define CONTROLLER description = "Controller";

            class Land_MapBoard_F {MACRO_SYNC OBJECT};

            class Land_Laptop_unfolded_F {MACRO_SYNC BOTH};
            class Land_Laptop_device_F {MACRO_SYNC BOTH};
            class Land_PCSet_01_screen_F {MACRO_SYNC BOTH};
            class Land_FlatTV_01_F {MACRO_SYNC BOTH};

            class Land_HandyCam_F {MACRO_SYNC CONTROLLER};
            class Land_MobilePhone_smart_F {MACRO_SYNC CONTROLLER};
            class Land_Tablet_01_F {MACRO_SYNC CONTROLLER};
            class Land_PCSet_01_keyboard_F {MACRO_SYNC CONTROLLER};
            class Land_PCSet_01_mouse_F {MACRO_SYNC CONTROLLER};
            class Land_GamingSet_01_controller_F {MACRO_SYNC CONTROLLER};
        };
    };

    #define MACRO_SLIDES \
        class GVAR(Slides) { \
            displayName = CSTRING(Interaction); \
            condition = QUOTE(_this call FUNC(canChangeSlides)); \
            insertChildren = QUOTE(_this call DFUNC(addSlideActions)); \
        };

    #define MACRO_INTERACT_INIT \
        XEH_ENABLED; \
        class ACE_Actions { \
            class ACE_MainActions { \
                displayName = ECSTRING(interaction,MainAction); \
                selection = ""; \
                condition = "true"; \
                distance = 2; \
                MACRO_SLIDES \
            }; \
        };

    class ThingX;
    class Land_MapBoard_F: ThingX {
        MACRO_INTERACT_INIT
    };

    class Land_Laptop_F;
    class Land_Laptop_unfolded_F: Land_Laptop_F {
        MACRO_INTERACT_INIT
    };
    //class Land_Laptop_device_F: Land_Laptop_unfolded_F;

    class Items_base_F;
    class Land_PCSet_01_screen_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_FlatTV_01_F: Items_base_F {
        MACRO_INTERACT_INIT
    };

    class Land_HandyCam_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_MobilePhone_smart_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_Tablet_01_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_PCSet_01_keyboard_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_PCSet_01_mouse_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
    class Land_GamingSet_01_controller_F: Items_base_F {
        MACRO_INTERACT_INIT
    };
};
