#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {QGVAR(Topographic)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_map"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"


class RscMapControl {
    class Task; class ViewTower; class Transmitter; class Watertower; class Bunker; class Cross; class Fortress; class Fountain; class Chapel; class Ruin; class Stack; class Tourism;
    class Quay; class Shipwreck; class Lighthouse; class Power; class PowerSolar; class PowerWave; class PowerWind; class Hospital; class BusStop; class Church; class Fuelstation; 
    class Tree; class SmallTree; class Bush; class Rock; class Command; class CustomMark; class WaypointCompleted; class Waypoint; class Legend;
};


class RscDisplayMainMap {
    class controlsBackground {
        class CA_Map: RscMapControl {
            #include "ZeroizeMap.hpp"
        };
        class GVAR(baseSat): RscMapControl {
            idc = 670001;
            GVAR(mapItem) = "ItemMap";
            #include "ZeroizeIcons.hpp"
        };
        class GVAR(baseClear): RscMapControl {
            idc = 670002;
            GVAR(mapItem) = "ItemMap";
            #include "ZeroizeIcons.hpp"

            maxSatelliteAlpha = 0;
        };
        class GVAR(topographic): RscMapControl {
            idc = 670003;
            GVAR(mapItem) = QGVAR(topographic);
            #include "ZeroizeIcons.hpp"

            maxSatelliteAlpha = 0;
            showCountourInterval = 1;
            drawShaded = 0.35;
            shadedSea = 0.35;
            sizeExLevel = 0.02;
            colorCountlines[] = {0.647059, 0.533333, 0.286275, 0.5};
            colorMainCountlines[] = {0.858824, 0, 0,0.5};
            ptsPerSquareObj = 1000; // buildings
        };
        class GVAR(satellite): RscMapControl {
            idc = 670004;
            GVAR(mapItem) = QGVAR(satellite);
            #include "ZeroizeIcons.hpp"

            maxSatelliteAlpha = 1;
            colorCountlines[] = {0.647059, 0.533333, 0.286275, 0.1};
            colorMainCountlines[] = {0.858824, 0, 0,0.1};
            ptsPerSquareObj = 1000; // buildings
        };
        class GVAR(roadMap): RscMapControl {
            idc = 670005;
            GVAR(mapItem) = QGVAR(roadMap);
            #include "ZeroizeIcons.hpp"

            maxSatelliteAlpha = 0;
            ptsPerSquareObj = 1000; // buildings
            ptsPerSquareFor=1000; // forests
            ptsPerSquareForEdge=1000;
            colorMainCountlines[]={0,0,0,0};
            colorCountlines[]={0,0,0,0};
            colorMainCountlinesWater[]={0,0,0,0};
            colorCountlinesWater[]={0,0,0,0};
            colorPowerLines[]={0,0,0,0};
            colorForest[]={0,0,0,0};
            colorForestBorder[]={0,0,0,0};
            colorRocks[]={0,0,0,0};
            colorRocksBorder[]={0,0,0,0};
            colorLevels[]={0,0,0,0};
        };
    };
};
