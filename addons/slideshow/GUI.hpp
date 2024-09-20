class GVAR(mapDisplay) {
    onLoad = QUOTE(call FUNC(mapImage_init));
    idd = -1;
    class Controls {};
};

class ctrlMap;
class GVAR(mapNormal): ctrlMap {
    maxSatelliteAlpha = 0;
    sizeExLabel = 0;
    sizeExUnits = 0;
    sizeExInfo = 0;
    sizeExLevel = 0;
    sizeEx = 0;
    scaleMin = 0.005;
    scaleMax = 10;
    showCountourInterval = 0;
    drawShaded = 0.15;
    shadedSea = 0.15;
    showMarkers = 0;
};
class GVAR(mapTopo): GVAR(mapNormal) {
    drawShaded = 0.35;
    shadedSea = 0.35;
    sizeExLevel = 0.02;
    colorCountlines[] = {0.647059, 0.533333, 0.286275, 0.5};
    colorMainCountlines[] = {0.858824, 0, 0,0.5};
    ptsPerSquareObj = 2000; // don't show buildings
};
class GVAR(mapSat): GVAR(mapNormal) {
    // ref https://feedback.bistudio.com/T170918 - may have problems loading sat textures
    maxSatelliteAlpha = 0.95;       
    colorForest[] = {0, 1, 0, 0};
    colorForestBorder[] = {0, 1, 0, 0};
};
