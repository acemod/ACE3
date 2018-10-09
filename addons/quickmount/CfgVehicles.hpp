class CfgVehicles {
    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Category);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 0;
        icon = "a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_getin_ca.paa";
        class Arguments {
            class enabled {
                displayName = ECSTRING(common,Enabled);
                description = CSTRING(KeybindDescription);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class distance {
                displayName = CSTRING(Distance);
                description = CSTRING(DistanceDescription);
                typeName = "NUMBER";
                defaultValue = DEFAULT_DISTANCE;
            };
            class speed {
                displayName = CSTRING(Speed);
                description = CSTRING(SpeedDescription);
                typeName = "NUMBER";
                defaultValue = DEFAULT_SPEED;
            };
        };
        class ModuleDescription {
            description = CSTRING(KeybindDescription);
        };
    };
};
