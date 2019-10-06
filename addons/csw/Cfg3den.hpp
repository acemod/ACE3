class ctrlCombo;
class Cfg3DEN {
    class Attributes {
        class Title;
        class Combo: Title {
            class Controls {
                class Title;
                class Value;
            };
        };
        class GVAR(assemblyModeControl): Combo {
            class Controls: Controls {
                class Title: Title {};
                class Value: Value {
                    class Items {
                        class Disable {
                            text = "$STR_DISABLED";
                            value = 0;
                        };
                        class Enable {
                            text = "$STR_CONFIG_JOYSTICK_ENABLED";
                            value = 1;
                        };
                        class EnableAndEmpty {
                            text = CSTRING(eden_enableAndEmpty);
                            value = 2;
                        };
                        class Default {
                            text = "$STR_VEHICLE_DEFAULT";
                            value = 3;
                            default = 1;
                        };
                    };
                };
            };
        };
    };
};
