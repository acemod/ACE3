class ACE_BFT {
    class Devices {
        class FBCB2Device {
            deviceSide = "WEST";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
        };
        class MDFDevice: FBCB2Device {
            reportingModes[] = {"MFD"};
            refreshRate = 0; // in real time.
        };
    };
};
