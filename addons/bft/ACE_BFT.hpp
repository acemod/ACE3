class ACE_BFT {
    class VehicleDevices {
        class FBCB2 {
            deviceSide = "WEST";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
        };
        class MDF: MyDevice {
            reportingModes[] = {"MFD"};
            refreshRate = 0; // in real time.
        };
    };
    class Devices {
        class FBCB2 {
            deviceSide=  "WEST";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
        };
    };
};
