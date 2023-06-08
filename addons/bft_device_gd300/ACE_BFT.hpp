// ACE BFT configuration for devices
class ACE_BFT {
    /*
     * To add a device to a vehicle reference the device class name on the vehicle
     * EGVAR(bft,vehicleDevice) = "GroundVehicle_b";
     */
    class Devices {
        class GD300_b {
            deviceSide = "WEST";
            refreshRate[] = {5,2};
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};
            interface = "GD300";
            icon = PATHTOF(UI\icon_bft_GD300.paa);
        };
        class GD300_o: GD300_b {
            deviceSide = "EAST";
        };
        class GD300_i: GD300_b {
            deviceSide = "IND";
        };
    };

    class Interfaces {
        class GD300 {
            displayName = QGVAR(GD300_dsp);
            dialogName = QGVAR(GD300_dlg);
            backgroundDay = QUOTE(PATHTOF(UI\images\GD300_background_ca.paa));
            backgroundNight = QUOTE(PATHTOF(UI\images\GD300_background_night_ca.paa));

            class InterfaceSettings {
                dlgIfPosition[] = {};
                dspIfPosition = "false";
                mode = "BFT";
                showIconText = "true";
                mapWorldPos[] = {};
                mapScaleDsp = 0.4;
                mapScaleDlg = 0.4;
                class mapTypes {
                    SAT = IDC_SCREEN;
                    TOPO = IDC_SCREEN_TOPO;
                };
                mapType = "SAT";
                drawSizeMultiplier = 1;
                showMenu = "false";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };
    };
};
