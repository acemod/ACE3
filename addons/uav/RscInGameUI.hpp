class RscControlsGroup;
class RscPicture;
class RscInGameUI {
    class RscUnitInfo;
    class RscOptics_CAS_01_TGP: RscUnitInfo {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                class ValueDistance;
                class ValueGrid;
                class TextGrid;
                class CA_VisionMode;
                class CA_FlirMode;
                class CA_Laser;
                class TextTrackArea;
                class TextTrackPoint;
            };
        };
    };
    class ACE_RscOptics_UAVPod: RscOptics_CAS_01_TGP {
        class CA_IGUI_elements_group: CA_IGUI_elements_group {
            class controls: controls {
                class ValueDistance: ValueDistance {};
                class ValueGrid: ValueGrid {};
                class TextGrid: TextGrid {};
                class CA_VisionMode: CA_VisionMode {};
                class CA_FlirMode: CA_FlirMode {};
                class CA_Laser: CA_Laser {};
                class TextTrackArea: TextTrackArea {};
                class TextTrackPoint: TextTrackPoint {};
                class ACE_HorizontalCompass: RscPicture {
                    idc = 207;
                    type = 105;
                    font = "EtelkaMonospacePro";
                    textSize = "0.02*SafezoneH";
                    style = 1;
                    color[] = {1,1,1,1};
                    x = "6.0 *      (0.01875 * SafezoneH)";
                    y = "1.75 *         (0.025 * SafezoneH)";
                    w = "41.3 *         (0.01875 * SafezoneH)";
                    h = "1 *        (0.025 * SafezoneH)";
                    imageHull = "A3\Ui_f\data\IGUI\RscIngameUI\RscOptics\horizontalCompassHull.paa";
                    imageTurret = "A3\Ui_f\data\IGUI\RscIngameUI\RscOptics\horizontalCompassTurret.paa";
                    imageObsTurret = "A3\Ui_f\data\IGUI\RscIngameUI\RscOptics\horizontalCompassObsTurret.paa";
                    imageGun = "#(rgb,8,8,3)color(0,0,0,0)";
                };
            };
        };
    };
};

//Big thanks to commy2
