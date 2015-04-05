/**
 * XEH_preInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

ADDON = false;

PREP(calculateAirDensity);
PREP(calculateAmmoTemperatureVelocityShift);
PREP(calculateAtmosphericCorrection);
PREP(calculateBarrelLengthVelocityShift);
PREP(calculateRetardation);
PREP(calculateRoughnessLength);
PREP(calculateStabilityFactor);
PREP(calculateWindSpeed);
PREP(displayProtractor);
PREP(displayWindInfo);
PREP(handleFired);
PREP(handleFiredExtension);
PREP(initializeTerrainExtension);
PREP(initalizeModule);
	
ADDON = true;
