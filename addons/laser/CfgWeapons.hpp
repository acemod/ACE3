
class CfgWeapons {
    class Binocular;
    class Laserdesignator: Binocular {
        visionMode[] = {"Normal","NVG"};
        class ADDON {
            markerEnabled = 1;
        };
    };
    class Default;
    class Laserdesignator_Mounted: Default {
        class ADDON {
            markerEnabled = 1;
        };
    };
    class Laserdesignator_pilotCamera: Laserdesignator_Mounted {
        class ADDON {
            markerEnabled = 1;
            pilotLaser = 1;
        };
    };
};
