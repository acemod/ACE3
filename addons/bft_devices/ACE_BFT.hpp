class ACE_BFT {
    class Devices {
        // Personal Devices
        class DK10_b {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};

            GVAR(dialogName) = QGVAR(DK10_dlg);

            class InterfaceSettings {
                dlgIfPosition[] = {};
                mode = "DESKTOP";
                showIconText = "true";
                mapWorldPos[] = {};
                mapScaleDsp = 2;
                mapScaleDlg = 2;
                class mapTypes {
                    SAT = IDC_SCREEN;
                    TOPO = IDC_SCREEN_TOPO;
                };
                mapType = "SAT";
                uavCam = "";
                hCam = "";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };
        class DK10_o: DK10_b {
            deviceSide = "EAST";
        };
        class DK10_i: DK10_b {
            deviceSide = "IND";
        };

        class GD300_b {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};

            GVAR(displayName) = QGVAR(GD300_dsp);
            GVAR(dialogName) = QGVAR(GD300_dlg);

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
                showMenu = "false";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };
        class GD300_o: GD300_b {
            deviceSide = "EAST";
        };
        class GD300_i: GD300_b {
            deviceSide = "IND";
        };

        class MicroDAGR_b {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"GroupOnly"};
            defaultInformation[] = {"Inf", 0, "", 0};

            GVAR(displayName) = QGVAR(GD300_dsp);
            GVAR(dialogName) = QGVAR(GD300_dlg);

            class InterfaceSettings {
                dlgIfPosition[] = {};
                dspIfPosition = "false";
                mapWorldPos[] = {};
                showIconText = "true";
                mapScaleDsp = 0.4;
                mapScaleDlg = 0.4;
                class mapTypes {
                    SAT = IDC_SCREEN;
                    TOPO = IDC_SCREEN_TOPO;
                };
                mapType = "SAT";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };
        class MicroDAGR_o: MicroDAGR_b {
            deviceSide = "EAST";
        };
        class MicroDAGR_i: MicroDAGR_b {
            deviceSide = "IND";
        };

        // Motorized
        class JV5_Mot_b {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Motorized", 0, "", 0};

            GVAR(dialogName) = QGVAR(JV5_dlg);

            class InterfaceSettings {
                dlgIfPosition[] = {};
                mapWorldPos[] = {};
                showIconText = "true";
                mapScaleDsp = 2;
                mapScaleDlg = 2;
                class mapTypes {
                    SAT = IDC_SCREEN;
                    TOPO = IDC_SCREEN_TOPO;
                };
                mapType = "SAT";
                mapTools = "true";
            };
        };
        class JV5_Mot_o: JV5_Mot_b {
            deviceSide = "EAST";
        };
        class JV5_Mot_i: JV5_Mot_b {
            deviceSide = "IND";
        };

        // Armor
        class JV5_Armor_b: JV5_Mot_b {
            defaultInformation[] = {"Motorized", 0, "", 0};
        };
        class JV5_Armor_o: JV5_Armor_b {
            deviceSide = "EAST";
        };
        class JV5_Armor_i: JV5_Armor_b {
            deviceSide = "IND";
        };

        // Helicopter
        class TAD_Heli_b {
            deviceSide = "NATO";
            reportingModes[] = {"MFD"};
            refreshRate = 0;
            defaultInformation[] = {"Helicopter", 0, "", 0};

            GVAR(displayName) = QGVAR(TAD_dsp);
            GVAR(dialogName) = QGVAR(TAD_dlg);

            class InterfaceSettings {
                dlgIfPosition[] = {};
                dspIfPosition = "false";
                mapWorldPos[] = {};
                showIconText = "true";
                mapScaleDsp = 2;
                mapScaleDlg = 2;
                mapScaleMin = 1;
                class mapTypes {
                    SAT = IDC_SCREEN;
                    TOPO = IDC_SCREEN_TOPO;
                    BLK = IDC_SCREEN_BLACK;
                };
                mapType = "SAT";
                mapTools = "true";
                nightMode = 0;
                brightness = 0.8;
            };
        };
        class TAD_Heli_o: TAD_Heli_b {
            deviceSide = "EAST";
        };
        class TAD_Heli_i: TAD_Heli_b {
            deviceSide = "IND";
        };

        // Plane
        class TAD_Plane_b: TAD_Heli_b {
            defaultInformation[] = {"Plane", 0, "", 0};
        };
        class TAD_Plane_o: TAD_Plane_b {
            deviceSide = "EAST";
        };
        class TAD_Plane_i: TAD_Plane_b {
            deviceSide = "IND";
        };

        // UAV
        class UAV_b {
            deviceSide = "NATO";
            reportingModes[] = {"UAV"};
            refreshRate = 1;
            defaultInformation[] = {"UAV", 0, "", 0};
        };
        class UAV_o: UAV_b {
            deviceSide = "EAST";
        };
        class UAV_i: UAV_b {
            deviceSide = "IND";
        };

        // UGV
        class UGV_b: UAV_b {
            refreshRate = 5;
        };
        class UGV_o: UGV_b {
            deviceSide = "EAST";
        };
        class UGV_i: UGV_b {
            deviceSide = "IND";
        };
    };
};