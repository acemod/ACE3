//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

PREP(calculateAirDensity);
PREP(calculateBarometricPressure);
PREP(calculateDewPoint);
PREP(calculateHeatIndex);
PREP(calculateRoughnessLength);
PREP(calculateSpeedOfSound);
PREP(calculateTemperatureAtHeight);
PREP(calculateWetBulb);
PREP(calculateWindChill);
PREP(calculateWindSpeed);
PREP(displayWindInfo);
PREP(getMapData);
PREP(getWind);
PREP(initModuleSettings);
PREP(initWind);
PREP(serverController);
PREP(updateAceWeather);
PREP(updateHumidity);
PREP(updateRain);
PREP(updateTemperature);
PREP(updateWind);

// Make sure this data is read before client/server postInit
call FUNC(getMapData);

ADDON = true;
