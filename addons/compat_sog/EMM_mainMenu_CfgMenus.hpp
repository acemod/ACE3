class EMM_mainMenu_CfgMenus {
    class VN {
        class menus {
            class MainMenu;
            class Tutorials: MainMenu {
                items[] = {
                    "Bootcamp",
                    "VRTraining",
                    "Arsenal",
                    QGVAR(Arsenal),
                    "FieldManual",
                    "CommunityGuides",
                    "Exit"
                };

                class Arsenal;
                class GVAR(Arsenal): Arsenal {
                    idc = -1;
                    action = QUOTE(playMission [ARR_2('','PATHTOEF(Arsenal,missions\Arsenal.VR)')]);
                    text = ECSTRING(Arsenal,Mission);
                    tooltip = ECSTRING(Arsenal,Mission_tooltip);
                };
            };
        };
    };
};
