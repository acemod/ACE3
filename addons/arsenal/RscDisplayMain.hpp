class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
    class controls {
        class GroupSingleplayer: RscControlsGroupNoScrollbars {
            class Controls;
        };
        class GroupTutorials: GroupSingleplayer {
            h = "(6 *   1.5) *  (pixelH * pixelGrid * 2)";

            class Controls: Controls {
                class Bootcamp;
                class Arsenal;
                class GVAR(mission): Arsenal {
                    idc = -1;
                    text = CSTRING(Mission);
                    tooltip = CSTRING(Mission_tooltip);
                    y = "(3 *   1.5) *  (pixelH * pixelGrid * 2) +  (pixelH)";
                    onbuttonclick = QUOTE(playMission [ARR_2('','PATHTOF(missions\Arsenal.VR)')]);
                    animTextureNormal = QPATHTOF(data\buttonMissionMainMenu_ca.paa);
                    animTextureDisabled = QPATHTOF(data\buttonMissionMainMenu_ca.paa);
                    animTextureOver = QPATHTOF(data\buttonMissionMainMenuHover_ca.paa);
                    animTextureFocused = QPATHTOF(data\buttonMissionMainMenuHover_ca.paa);
                    animTexturePressed = QPATHTOF(data\buttonMissionMainMenu_ca.paa);
                    animTextureDefault = QPATHTOF(data\buttonMissionMainMenu_ca.paa);
                };
                class FieldManual: Bootcamp {
                    y = "(4 *   1.5) *  (pixelH * pixelGrid * 2) +  (pixelH)";
                };
                class CommunityGuides: Bootcamp {
                    y = "(5 *   1.5) *  (pixelH * pixelGrid * 2) +  (pixelH)";
                };
            };
        };
    };
};
