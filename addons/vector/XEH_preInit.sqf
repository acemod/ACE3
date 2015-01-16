#include "script_component.hpp"

PREP(abort);
PREP(config);
PREP(convertFOS);
PREP(settings);
PREP(tabAzimuthKey);
PREP(tabDistanceKey);
/////

PREP(clearDisplay);
PREP(convertToTexturesDegree);
PREP(convertToTexturesDistance);
PREP(showCenter);
PREP(showP1);

PREP(onKeyDown);
PREP(onKeyHold);
PREP(onKeyUp);

PREP(getDirection);
PREP(getDistance);
PREP(getHeightDistance);
PREP(getRelativeAzimuthDistance);
PREP(getRelativeDistance);

PREP(showAzimuth);
PREP(showAzimuthInclination);
PREP(showHeightDistance);
PREP(showDistance);
PREP(showRelativeAzimuthDistance);
PREP(showRelativeDistance);

GVAR(holdKeyHandler) = -1;
GVAR(isKeyDownAzimuth) = false;
GVAR(isKeyDownDistance) = false;
GVAR(keyDownTimeAzimuth) = -1;
GVAR(keyDownTimeDistance) = -1;
GVAR(useMil) = false;
GVAR(useFeet) = false;
