
// point of this file is to disable "auto-weather"
// we want this, because it breaks weather commands we use in this component

// we hide the settings name and remove the tooltip
#define ALWAYS_ENABLE_WEATHER_SETTING control = QGVAR(disabledCheckbox);\
    displayName = "";\
    tooltip = ""

class Cfg3DEN {
    class Attributes {
        class Title;
        class Checkbox: Title {
            class Controls {
                class Title;
                class Value;
            };
        };

        class GVAR(disabledCheckbox): Checkbox {
            // setting is still in the menu, because they have to appear somewhere
            // we can however set the size to 0
            w = 0;
            h = 0;
            attributeLoad = "";
            attributeSave = "";
            class Controls: Controls {
                // the control has to have a "Title" and a "Value", otherwise the game crashes
                class Title: Title {
                    // these also have to have a size of 0 or they would appear over the settings below
                    w = 0;
                    h = 0;
                };
                // We change the "Value"s type to the same of the "Title", so it's not selectable
                class Value: Title {
                    // hard coded. has to be 100, otherwise the game crashes
                    idc = 100;
                };
            };
        };
    };
    class Mission {
        class Intel {
            class AttributeCategories {
                class Rain {
                    class Attributes {
                        class RainForced {
                            ALWAYS_ENABLE_WEATHER_SETTING;
                        };
                    };
                };
                class Lightnings {
                    class Attributes {
                        class LightningsForced {
                            ALWAYS_ENABLE_WEATHER_SETTING;
                        };
                    };
                };
                class Waves {
                    class Attributes {
                        class WavesForced {
                            ALWAYS_ENABLE_WEATHER_SETTING;
                        };
                    };
                };
                class Wind {
                    class Attributes {
                        class WindForced {
                            ALWAYS_ENABLE_WEATHER_SETTING;
                        };
                    };
                };
            };
        };
    };
};
