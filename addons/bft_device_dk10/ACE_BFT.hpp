// ACE BFT configuration for devices
class ACE_BFT {
    /*
     * To add a device to a vehicle reference the device class name on the vehicle
     * EGVAR(bft,vehicleDevice) = "GroundVehicle_b";
     */
    class Devices {
        class DK10_b {
            deviceSide = "WEST";
            refreshRate[] = {5,2};
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};
            interface = "DK10";
            icon = PATHTOF(UI\icon_bft_DK10.paa);
        };
        class DK10_o: DK10_b {
            deviceSide = "EAST";
        };
        class DK10_i: DK10_b {
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
                drawSizeMultiplier = 1;
                uavCam = "";
                hCam = "";
                mapTools = "true";
                nightMode = 2;
                brightness = 0.9;
            };
        };
    };
};
