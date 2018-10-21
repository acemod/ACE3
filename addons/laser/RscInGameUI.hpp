class RscInGameUI {
    class RscOptics_LaserDesignator {
        idd = 300;
        controls[] = {"CA_IGUI_elements_group"};

        onLoad = "uiNameSpace setVariable ['ACE_RscOptics_LaserDesignator',(_this select 0)];";
        onUnload = "uiNameSpace setVariable ['ACE_RscOptics_LaserDesignator',nil];";

        class CA_IGUI_elements_group: RscControlsGroup {
            idc = 170;

            x = "0 *         (0.01875 * SafezoneH) +         (SafezoneX + ((SafezoneW - SafezoneH) / 2))";
            y = "0 *         (0.025 * SafezoneH) +         (SafezoneY)";
            w = "53.5 *         (0.01875 * SafezoneH)";
            h = "40 *         (0.025 * SafezoneH)";
            class VScrollbar: VScrollbar {
                width = 0;
            };
            class HScrollbar: HScrollbar {
                height = 0;
            };
            class controls {
                class CA_OpticsZoom: RscText {
                    idc = 180;
                    style = 1;
                    colorText[] = {0.706,0.0745,0.0196,1};
                    sizeEx = "0.038*SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "4.5";
                    x = "43.85 *         (0.01875 * SafezoneH)";
                    y = "19.6 *         (0.025 * SafezoneH)";
                    w = "4.5 *         (0.01875 * SafezoneH)";
                    h = "1.1 *         (0.025 * SafezoneH)";
                };
                class ACE_Distance: RscText {
                    idc = 123002;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "2456";
                    x = "24.6 *         (0.01875 * SafezoneH)";
                    y = "3 *         (0.025 * SafezoneH)";
                    w = "4 *         (0.01875 * SafezoneH)";
                    h = "1.5 *         (0.025 * SafezoneH)";
                };
                class CA_Distance: RscText {
                    idc = 151;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "2456";
                    x = 0;
                    y = 0;
                    w = 0;
                    h = 0;
                };
                class CA_Elev: RscText {
                    idc = 175;
                    style = 1;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "80.5";
                    x = "32.7 *         (0.01875 * SafezoneH)";
                    y = "3 *         (0.025 * SafezoneH)";
                    w = "5 *         (0.01875 * SafezoneH)";
                    h = "1.5 *         (0.025 * SafezoneH)";
                };
                class CA_VisionMode: RscText {
                    idc = 179;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "VIS";
                    x = "6.5 *         (0.01875 * SafezoneH)";
                    y = "19.6 *         (0.025 * SafezoneH)";
                    w = "4 *         (0.01875 * SafezoneH)";
                    h = "1.1 *         (0.025 * SafezoneH)";
                };
                class CA_Laser: RscText {
                    idc = 158;
                    style = "0x30 + 0x800";
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "\A3\ui_f\data\igui\rscingameui\rscoptics\laser_designator_iconLaserOn.paa";
                    x = "29.2 *         (0.01875 * SafezoneH)";
                    y = "3 *         (0.025 * SafezoneH)";
                    w = "3.5 *         (0.01875 * SafezoneH)";
                    h = "1.5 *         (0.025 * SafezoneH)";
                };
                class CA_Heading: RscText {
                    idc = 156;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "023";
                    x = "16.1 *         (0.01875 * SafezoneH)";
                    y = "3 *         (0.025 * SafezoneH)";
                    w = "3.5 *         (0.01875 * SafezoneH)";
                    h = "1.6 *         (0.025 * SafezoneH)";
                };

                class ACE_LaserCode_Helper : RscMapControl {
                    idc = -1;
                    onDraw = QUOTE(_this call FUNC(onLaserDesignatorDraw));
                    w = 0;
                    h = 0;
                };
                class ACE_LaserCode : RscText {
                    idc = 123001;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "Code: 1001";
                    x = "32.7 *         (0.01875 * SafezoneH)";
                    y = "35.5 *         (0.025 * SafezoneH)";
                    w = "12 *         (0.01875 * SafezoneH)";
                    h = "1.6 *         (0.025 * SafezoneH)";
                };
            };
        };
    };
};
