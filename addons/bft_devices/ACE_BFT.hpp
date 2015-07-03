class ACE_BFT {
    /*
     * To add a device to a vehicle reference the device class name on the vehicle
     * EGVAR(bft,vehicleDevice) = "Motorized_b";
     */
    class Devices {
        // Personal Devices
        class DK10_b {
            deviceSide = "WEST";
            refreshRate[] = {5,5};
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};
            interface = "DK10";
        };
        class DK10_o: DK10_b {
            deviceSide = "EAST";
        };
        class DK10_i: DK10_b {
            deviceSide = "IND";
        };

        class GD300_b {
            deviceSide = "WEST";
            refreshRate[] = {5,5};
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};
            interface = "GD300";
        };
        class GD300_o: GD300_b {
            deviceSide = "EAST";
        };
        class GD300_i: GD300_b {
            deviceSide = "IND";
        };

        class MicroDAGR_b {
            deviceSide = "WEST";
            refreshRate[] = {5,5};
            reportingModes[] = {"GroupOnly"};
            defaultInformation[] = {"Inf", 0, "", 0};
            interface = "MicroDAGR";
        };
        class MicroDAGR_o: MicroDAGR_b {
            deviceSide = "EAST";
        };
        class MicroDAGR_i: MicroDAGR_b {
            deviceSide = "IND";
        };

        // Motorized
        class Motorized_b {
            deviceSide = "WEST";
            refreshRate[] = {5,5};
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Motorized", 0, "", 0};
        };
        class Motorized_o: Motorized_b {
            deviceSide = "EAST";
        };
        class Motorized_i: Motorized_b {
            deviceSide = "IND";
        };

        // Mechanized
        class Mechanized_b: Motorized_b {
            defaultInformation[] = {"Mechanized", 0, "", 0};
        };
        class Mechanized_o: Mechanized_b {
            deviceSide = "EAST";
        };
        class Mechanized_i: Mechanized_b {
            deviceSide = "IND";
        };

        // Armor
        class Armor_b: Motorized_b {
            defaultInformation[] = {"Armor", 0, "", 0};
        };
        class Armor_o: Armor_b {
            deviceSide = "EAST";
        };
        class Armor_i: Armor_b {
            deviceSide = "IND";
        };

        // Artillery
        class Artillery_b: Motorized_b {
            defaultInformation[] = {"Artillery", 0, "", 0};
        };
        class Artillery_o: Artillery_b {
            deviceSide = "EAST";
        };
        class Artillery_i: Artillery_b {
            deviceSide = "IND";
        };

        // Maintenance
        class Maintenance_b: Motorized_b {
            defaultInformation[] = {"Maintenance", 0, "", 0};
        };
        class Maintenance_o: Maintenance_b {
            deviceSide = "EAST";
        };
        class Maintenance_i: Maintenance_b {
            deviceSide = "IND";
        };

        // Medical
        class Medical_b: Motorized_b {
            defaultInformation[] = {"Medical", 0, "", 0};
        };
        class Medical_o: Medical_b {
            deviceSide = "EAST";
        };
        class Medical_i: Medical_b {
            deviceSide = "IND";
        };

        // Service
        class Service_b: Motorized_b {
            defaultInformation[] = {"Service", 0, "", 0};
        };
        class Service_o: Service_b {
            deviceSide = "EAST";
        };
        class Service_i: Service_b {
            deviceSide = "IND";
        };

        // Naval
        class Naval_b: Motorized_b {
            defaultInformation[] = {"Naval", 0, "", 0};
        };
        class Naval_o: Naval_b {
            deviceSide = "EAST";
        };
        class Naval_i: Naval_b {
            deviceSide = "IND";
        };

        // Helicopter
        class TAD_Heli_b {
            deviceSide = "WEST";
            reportingModes[] = {"MFD"};
            refreshRate[] = {1,1};
            defaultInformation[] = {"Helicopter", 0, "", 0};
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
            deviceSide = "WEST";
            reportingModes[] = {"UAV"};
            refreshRate[] = {1,-1};
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
            refreshRate[] = {5,-1};
        };
        class UGV_o: UGV_b {
            deviceSide = "EAST";
        };
        class UGV_i: UGV_b {
            deviceSide = "IND";
        };
    };

    /*
     * To add an interface to a vehicle reference the interface class name on the vehicle
     * EGVAR(bft,vehicleInterfaces)[] = {"JV5"};
     * A vehicle can have multiple interfaces available, just add them to the list
     *
     * The above will make the interface "JV5" available to all positions within that vehicle.
     * To limit the positions that the interface will be available for, encapsulate the interface
     * config name in an array and add a whereAvailable array as the second array item
     * EGVAR(bft,vehicleInterfaces)[] = {"JV5",{"TAD",{whereAvailable}}}
     * In the exacmple above, "JV5" will be available everywhere, but "TAD" is limited to certain
     * positions on that vehicle defined by whereAvailable.
     *
     * Here is how whereAvailable works
     * To define avialability for driver, all turret positions (excluding cargo-turrets) and
     * cargo positions with cargoIndex 0 and 1:
     * {"Driver","Turret",{"Cargo",{0,1}}}
     *
     * Here are some common settings for whereAvailable
     * To define pilot and co-pilot for most helicopters:
     * {"Driver",{"Turret",{0}}}
     * To define all the crew-members of an APC, but exclude passengers:
     * {"Driver","Turret"}
     * To define the driver and and passenger sitting next to him for a truck:
     * {"Driver",{"Cargo",{0}}}
     */
    class Interfaces {
        class DK10 {
            dialogName = QGVAR(DK10_dlg);
            backgroundDay = QUOTE(PATHTOF(UI\images\DK10_background_ca.paa));
            backgroundNight = QUOTE(PATHTOF(UI\images\DK10_background_night_ca.paa));

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
                showMenu = "false";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };

        class MicroDAGR {
            displayName = QGVAR(GD300_dsp);
            dialogName = QGVAR(GD300_dlg);
            backgroundDay = QUOTE(PATHTOF(UI\images\MicroDAGR_background_ca.paa));
            backgroundNight = QUOTE(PATHTOF(UI\images\MicroDAGR_background_night_ca.paa));

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

        class JV5 {
            dialogName = QGVAR(JV5_dlg);

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

        class TAD {
            displayName = QGVAR(TAD_dsp);
            dialogName = QGVAR(TAD_dlg);
            backgroundDay = QUOTE(PATHTOF(UI\images\TAD_background_ca.paa));
            backgroundNight = QUOTE(PATHTOF(UI\images\TAD_background_night_ca.paa));

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
    };
};