
class Cfg3DEN {
    class Mission {
        class ACE_Settings {
            displayName = "ACE Settings";
        };
    };
};

class ctrlMenuStrip;

class Display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Attributes {
                    items[] += {ACE_Settings};
                };
                class ACE_Settings {
                    text = "ACE Settings";
                    action = "edit3DENMissionAttributes 'ACE_Settings'";
                    //picture = 
                };
            };
        };
    };
};
