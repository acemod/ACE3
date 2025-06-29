class RscInGameUI {
    // NATO Laser Designator
    class RscOptics_LaserDesignator {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                // Distance indicator UI element
                class CA_Distance: RscText { // Vanilla distance indicator control, kept to retain manual rangefinding behaviour
                    fade = 1; // Hide the control
                    colorText[] = {0,0,0,0}; // fade doesn't work in some cases (e.g. controlling remote designator uav)
                };
                class ACE_ConstantDistance: CA_Distance {
                    idc = IDC_LASERDESIGNATOR_CONSTANTDISTANCE; // Purposeful overwrite, makes range update constantly, do not remove
                };
                // Custom distance indicator which either displays manual rangefinding info or the constantly computed range while designating (determined by the lasercode helper's draw function)
                class ACE_Distance: CA_Distance {
                    idc = IDC_LASERDESIGNATOR_ACEDISTANCE;
                    fade = 0;
                    colorText[] = {0.706,0.0745,0.0196,1};
                };

                // Lasercode UI element
                class ACE_LaserCode_Helper: RscMapControl {
                    idc = -1;
                    onDraw = QUOTE(call FUNC(onLaserDesignatorDraw));
                    w = 0;
                    h = 0;
                };
                class ACE_LaserCode: RscText {
                    idc = IDC_LASERDESIGNATOR_LASERCODE;
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

    // CSAT Laser Designator
    class RscOptics_LaserDesignator_02 {
        class CA_IGUI_elements_group: RscControlsGroup {
            class controls {
                // Distance indicator UI element
                class CA_Distance: RscText { // Vanilla distance indicator control, kept to retain manual rangefinding behaviour
                    fade = 1; // Hide the control
                    colorText[] = {0,0,0,0}; // fade doesn't work in some cases (e.g. controlling remote designator uav)
                };
                class ACE_ConstantDistance: CA_Distance {
                    idc = IDC_LASERDESIGNATOR_CONSTANTDISTANCE; // Purposeful overwrite, makes range update constantly, do not remove
                };
                // Custom distance indicator which either displays manual rangefinding info or the constantly computed range while designating (determined by the lasercode helper's draw function)
                class ACE_Distance: CA_Distance {
                    idc = IDC_LASERDESIGNATOR_ACEDISTANCE;
                    fade = 0;
                    colorText[] = {0.706,0.0745,0.0196,1};
                };

                // Lasercode UI element
                class ACE_LaserCode_Helper: RscMapControl {
                    idc = -1;
                    onDraw = QUOTE(call FUNC(onLaserDesignatorDraw));
                    w = 0;
                    h = 0;
                };
                class ACE_LaserCode: RscText {
                    idc = IDC_LASERDESIGNATOR_LASERCODE;
                    style = 0;
                    sizeEx = "0.038*SafezoneH";
                    colorText[] = {0.706,0.0745,0.0196,1};
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "Code: 1001";
                    x = "23 *          (0.01875 * SafezoneH)";
                    y = "9.5 *         (0.025 * SafezoneH)";
                    w = "12 *          (0.01875 * SafezoneH)";
                    h = "1.6 *         (0.025 * SafezoneH)";
                };

                // Move vanilla laser icon below the laser code label
                class CA_Laser: RscText {
                    y = "11 * 		   (0.025 * SafezoneH)";
                };
            };
        };
    };
};
