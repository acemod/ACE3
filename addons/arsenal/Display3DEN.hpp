class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
            class Arsenal {
                items[]= {"aceArsenal", "virtualArsenal"};
            };
            class virtualArsenal {
                text = "BI Virtual Arsenal";
                action = QUOTE(['arsenal'] call bis_fnc_3DENEntityMenu);
                value = 0;
                data = "Arsenal";
                opensNewWindow = 1;
            };
            class aceArsenal: virtualArsenal {
                text = "ACE Arsenal";
                action = QUOTE(call FUNC(open3DEN));
            };
        };
    };
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Tools {
                    items[] += {"ACE_arsenal_portVALoadouts"};
                };
                class ACE_arsenal_portVALoadouts {
                    text = CSTRING(portLoadoutsText);
                    picture = QPATHTOEF(common,data\logo_ace3_ca.paa);
                    action = "call ace_arsenal_fnc_portVALoadouts;";
                };
            };
        };
    };
};
