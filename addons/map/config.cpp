#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ace_TopographicMap"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi","Rocko","esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class RscControlsGroup;
class RscActiveText;
class RscPicture;
class RscText;
class RscObject;
class RscButton;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscEdit;

#include "ACE_Settings.hpp"
#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMarkers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
#include "CfgSounds.hpp"
#include "CfgLights.hpp"
#include "Effects.hpp"

class RscMapControl {
    maxSatelliteAlpha = 0.5;

    // From Arma 2
    colorTracks[] = {0.2,0.13,0,1};
    colorTracksFill[] = {1,0.88,0.65,0.3};
    colorRoads[] = {0.2,0.13,0,1};
    colorRoadsFill[] = {1,0.88,0.65,1};
    colorMainRoads[] = {0.0,0.0,0.0,1};
    colorMainRoadsFill[] = {0.94,0.69,0.2,1};
    colorRailWay[] = {0.8,0.2,0,1};
    colorGrid[] = {0.05,0.1,0,0.6};
    colorGridMap[] = {0.05,0.1,0,0.4};

    // From ACE2
    colorBackground[] = {0.929412, 0.929412, 0.929412, 1.0};
    colorOutside[] = {0.929412, 0.929412, 0.929412, 1.0};
    colorCountlines[] = {0.647059, 0.533333, 0.286275, 1};
    colorMainCountlines[] = {0.858824, 0, 0,1};
    colorForest[] = {0.6, 0.8, 0.2, 0.25};
    colorLevels[] = {0.0, 0.0, 0.0, 1.0};
    colorRocks[] = {0.50, 0.50, 0.50, 0.50};

    sizeExLevel = 0.03;
    showCountourInterval = 1; // refs #13673

    sizeExGrid = 0.032;
};


// Topographic Map:
class ctrlMap;
class GVAR(topographicCtrl): ctrlMap {
    idc = 9051;

    // scaleMin = 0.005;
    // scaleMax = 10;  //Lets the mini display zoom out far enough
    drawObjects = 0;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    maxSatelliteAlpha = 0;

    alphaFadeStartScale = 100;
    alphaFadeEndScale = 100;
    colorSea[] = {0.467,0.631,1,0.25};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
    colorGrid[] = {0,0,0,0.15};
    colorGridMap[] = {0,0,0,0.2};

    //Text sizes:
    sizeExLabel = 0;
    // sizeExGrid =
    sizeExUnits = 0;
    // sizeExNames = //Marker's Text
    sizeExInfo = 0;
    sizeExLevel = 0;
    // sizeEx =

    ptsPerSquareRoad = 0.75;
    ptsPerSquareObj = 2000; //don't show buildings

    showCountourInterval = 1;

    colorTracks[] = {0.0,0.0,0.0,0.25};
    colorTracksFill[] = {0.0,0.0,0.0,0.25};
    colorRoads[] = {0.0,0.0,0.0,0.5};
    colorRoadsFill[] = {1,1,0,0.5};
    colorMainRoads[] = {0.0,0.0,0.0,1};
    colorMainRoadsFill[] = {1,0.6,0.4,1};
    colorRailWay[] = {0.8,0.2,0,1};

    colorBackground[] = {0.929412, 0.929412, 0.929412, 1.0};
    colorOutside[] = {0.929412, 0.929412, 0.929412, 1.0};
    colorCountlines[] = {0.647059, 0.533333, 0.286275, 1};
    colorMainCountlines[] = {0.858824, 0, 0,1};
    colorForest[] = {0.6, 0.8, 0.2, 0.1};
    colorForestBorder[] = {0,1,0,0.25};
    colorLevels[] = {0.0, 0.0, 0.0, 0.5};
    colorRocks[] = {0.50, 0.50, 0.50, 0};

    class Legend {
        x = SafeZoneX+SafeZoneW-.340;
        y = SafeZoneY+SafeZoneH-.152;
        font = "RobotoCondensed";
        w = .340;
        h = .152;
        sizeEx = 0.039210;
        colorBackground[] = {0.906000, 0.901000, 0.880000, 0.5};
        color[] = {0, 0, 0, 0.75};
    };
};

class RscMap;
class RscDisplayArcadeMap_Layout_2: RscMap { //"Traditional" Editor:
    class controlsBackground {
        class CA_Map: RscMapControl {
            #include "MapTweaks.hpp"
        };
    };
};
class RscDisplayArcadeMap_Layout_6: RscMap { //"Streamlined" Editor:
    class controlsBackground {
        class CA_Map: RscMapControl {
            #include "MapTweaks.hpp"
        };
    };
};

// REGULAR MAP
class RscDisplayMainMap {
    // Tweak map styling
    class controlsBackground {
        class CA_Map: RscMapControl {
            onDraw = QUOTE([ctrlParent (_this select 0)] call DFUNC(onDrawMap));
            #include "MapTweaks.hpp"
        };
        class ACE_topoMap: GVAR(topographicCtrl) {};
    };
    // get rid of the "center to player position" - button (as it works even on elite)
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
    // scale up the compass
    class objects {
        class Compass: RscObject {
            scale = 0.7;
            zoomDuration = 0;
        };
    };
};

// DIARY
class RscDisplayDiary {
    // get rid of the "center to player position" - button (as it works even on elite)
    class controls {
        class TopRight: RscControlsGroup {
            class controls {
                class ButtonPlayer: RscActiveText {
                    text = "";
                    w = 0;
                    h = 0;
                    sizeEx = 0;
                    onButtonClick = "";
                };
                class CA_PlayerName: RscText {
                    x = "2 *    ( ((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class ProfilePicture: RscPicture {
                    x = "13.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class ProfileBackground: RscText {
                    x = "13.3 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                };
                class Separator1: RscPicture {
                    x = "14.5 * ( ((safezoneW / safezoneH) min 1.2) / 40)";
                };
            };
        };
    };
};

// BRIEFING SCREEN
class RscDisplayGetReady: RscDisplayMainMap {
    // Tweak map styling
    class controlsBackground {
        class CA_Map: RscMapControl {
            onDraw = QUOTE([ctrlParent (_this select 0)] call DFUNC(onDrawMap));
            #include "MapTweaks.hpp"
        };
    };
    // get rid of the "center to player position" - button (as it works even on elite)
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
class RscDisplayClientGetReady: RscDisplayGetReady {
    // get rid of the "center to player position" - button (as it works even on elite)
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
class RscDisplayServerGetReady: RscDisplayGetReady {
    // get rid of the "center to player position" - button (as it works even on elite)
    class controls {
        class TopRight: RscControlsGroup {
            #include "MapControls.hpp"
        };
    };
};
