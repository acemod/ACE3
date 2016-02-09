
class Cfg3DEN {
    class Mission {
        class PREFIX {
            displayName = QUOTE(PREFIX);
        };
    };
};

class ctrlMenuStrip;
class Display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Attributes {
                    items[] += {QUOTE(PREFIX)};
                };
                class PREFIX {
                    text = "ACE SETTINGS";
                    action = QUOTE(edit3DENMissionAttributes QUOTE(QUOTE(PREFIX)));
                    data = QUOTE(class QUOTE(QUOTE(PREFIX)));
                };
            };
        };
    };
};
