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
                class VRTraining;
                class Arsenal;
                class GVAR(mission): Arsenal {
                    idc = -1;
                    text = CSTRING(Mission);
                    tooltip = CSTRING(Mission_tooltip);
                    y = "(3 *   1.5) *  (pixelH * pixelGrid * 2) +  (pixelH)";
                    onbuttonclick = QUOTE(playMission [ARR_2('','PATHTOF(missions\Arsenal.VR)')]);
                    animTextureNormal = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenu_ca.paa"; //@todo custom icons
                    animTextureDisabled = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenu_ca.paa";
                    animTextureOver = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenuHover_ca.paa";
                    animTextureFocused = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenuHover_ca.paa";
                    animTexturePressed = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenu_ca.paa";
                    animTextureDefault = "\a3\Ui_f\data\GUI\Rsc\RscDisplayMain\buttonMenu_ca.paa";
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
