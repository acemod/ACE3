class Cfg3DEN {
    class Mission {
        class ADDON {// Custom section class, everything inside will be opened in one window
            displayName = "Dummy"; // Text visible in the window title as "Edit <displayName>"
            display = ""; // Optional - display for attributes window. Must have the same structure and IDCs as the default Display3DENEditAttributes
            class AttributeCategories {
                class ADDON {
                    displayName = "Dummy"; // Category name visible in Edit Attributes window
                    collapsed = 0; // When 1, the category is collapsed by default
                    class Attributes {
                        class ACE_MissionSettings {
                            displayName = "Dummy";
                            tooltip = "";
                            property = "ACE_MissionSettings";
                            control = "";
                            defaultValue = "[]";
                            typeName = "ARRAY";
                        };
                    };
                };
            };
        };
    };
};

//Add "Ace Settings" to menu toolbar:
class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                items[] += {"ACE_Settings"}; // += must be used; you want to expand the array, not override it!
                class ACE_Settings {
                    text = "ACE Settings"; // Item text
                    // picture = "\z\ace\addons\common\data\icon_banana_ca.paa"; //Doesn't seem to work
                    items[] = {};
                };
            };
        };
    };
};
