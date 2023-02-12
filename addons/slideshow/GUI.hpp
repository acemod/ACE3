class GVAR(mapDisplay) {
    onLoad = QUOTE(call FUNC(mapImage_init));
    idd = -1;
    class Controls {};
};

class RscMapControl;
class GVAR(mapNormal): RscMapControl {
    sizeExLabel = 0;
    sizeExUnits = 0;
    sizeExInfo = 0;
    sizeExLevel = 0;
    sizeExGrid = 0;
    sizeEx = 0;
    scaleMin = 0.005;
    scaleMax = 10;
    showCountourInterval = 0;
};
class GVAR(mapTopo): GVAR(mapNormal) {
    maxSatelliteAlpha = 0;
    drawShaded=0.35;
    shadedSea=0.35;
    showMarkers = 0;
};
class GVAR(mapSat): GVAR(mapNormal) {
    maxSatelliteAlpha = 1;
    ptsPerSquareObj = 2000;
    showMarkers = 0;
};
