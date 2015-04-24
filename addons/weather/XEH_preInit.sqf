//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

PREP(calculateAirDensity);
PREP(calculateBarometricPressure);
PREP(displayWindInfo);
PREP(getMapData);
PREP(getWind);
PREP(initWind);
PREP(serverController);
PREP(updateHumidity);
PREP(updateRain);
PREP(updateTemperature);
PREP(updateWind);

// Control server side weather propagation
GVAR(enableServerController) = true;

// Control client side weather effects
GVAR(syncRain) = true; 
GVAR(syncWind) = true; // Wind, Gusts, Waves
GVAR(syncMisc) = true; // Lightnings, Rainbow, Fog

// Make sure this data is read before client/server postInit
call FUNC(getMapData);

ADDON = true;
