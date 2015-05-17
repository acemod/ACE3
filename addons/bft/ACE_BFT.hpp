class ACE_BFT {
    class Devices {
        class FBCB2Device {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Inf", 0, "", 0};
        };
        class FBCB2VehDevice {
            deviceSide = "NATO";
            refreshRate = 5;
            reportingModes[] = {"FBCB2"};
            defaultInformation[] = {"Motorized", 0, "", 0};
        };
        class MDFDevice: FBCB2Device {
            reportingModes[] = {"MFD"};
            refreshRate = 0;
            defaultInformation[] = {"Plane", 0, "", 0};
        };
    };

    class Side {
        class NATO {
            encryptionKeys[] = {"NATO_encryption"};
        };
        class EAST {
            encryptionKeys[] = {"EAST_encryption"};
        };
        class IND {
            encryptionKeys[] = {"IND_encryption"};
        };
    };

    class Types {
        class Inf {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_inf.paa";
        };
        class Motorized {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa";
        };
        class Plane {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_plane.paa";
        };
        class Helicopter {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_air.paa";
        };
        class Armor {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_armor.paa";
        };
        class Naval {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_naval.paa";
        };
        class HQ {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_hq.paa";
        };
        class Medical {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_med.paa";
        };
        class Maintanance {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_maint.paa";
        };
        class Artillery {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_art.paa";
        };
        class Mortar {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_mortar.paa";
        };
        class Service {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_service.paa";
        };
        class Recon {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_recon.paa";
        };
        class Mechanized {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_mech_inf.paa";
        };
        class UAV {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_uav.paa";
        };
        class Installation {
            displayName = "";
            iconPath = "\A3\ui_f\data\map\markers\nato\b_installation.paa";
        };
    };
};
