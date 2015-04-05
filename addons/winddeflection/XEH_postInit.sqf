#include "script_component.hpp"

#include "initKeybinds.sqf"

GVAR(bulletDatabase) = [];
GVAR(bulletDatabaseStartTime) = [];
GVAR(bulletDatabaseSpeed) = [];
GVAR(bulletDatabaseFrames) = [];
GVAR(bulletDatabaseLastFrame) = [];
GVAR(bulletDatabaseHDeflect) = [];
GVAR(bulletDatabaseSpinDrift) = [];
GVAR(bulletDatabaseOccupiedIndices) = [];
GVAR(bulletDatabaseFreeIndices) = [];

GVAR(WindInfo) = false;
GVAR(WindInfoStart) = time;

GVAR(Protractor) = false;
GVAR(ProtractorStart) = time;

GVAR(Altitude) = 0;
GVAR(Latitude) = 50;

if (worldName in ["Chernarus", "Bootcamp_ACR", "Woodland_ACR", "utes"]) then { GVAR(Latitude) = 50; GVAR(Altitude) = 0; };
if (worldName in ["Altis", "Stratis"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["Takistan", "Zargabad", "Mountains_ACR"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 2000; };
if (worldName in ["Shapur_BAF", "ProvingGrounds_PMC"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 100; };
if (worldName in ["fallujah"]) then { GVAR(Latitude) = 33; GVAR(Altitude) = 0; };
if (worldName in ["fata", "Abbottabad"]) then { GVAR(Latitude) = 30; GVAR(Altitude) = 1000; };
if (worldName in ["sfp_wamako"]) then { GVAR(Latitude) = 14; GVAR(Altitude) = 0; };
if (worldName in ["sfp_sturko"]) then { GVAR(Latitude) = 56; GVAR(Altitude) = 0; };
if (worldName in ["Bornholm"]) then { GVAR(Latitude) = 55; GVAR(Altitude) = 0; };
if (worldName in ["Imrali"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["Caribou"]) then { GVAR(Latitude) = 68; GVAR(Altitude) = 0; };
if (worldName in ["Namalsk"]) then { GVAR(Latitude) = 65; GVAR(Altitude) = 0; };
if (worldName in ["MCN_Aliabad"]) then { GVAR(Latitude) = 36; GVAR(Altitude) = 0; };
if (worldName in ["Clafghan"]) then { GVAR(Latitude) = 34; GVAR(Altitude) = 640; };
if (worldName in ["Sangin", "hellskitchen"]) then { GVAR(Latitude) = 32; GVAR(Altitude) = 0; };
if (worldName in ["Sara"]) then { GVAR(Latitude) = 40; GVAR(Altitude) = 0; };
if (worldName in ["reshmaan"]) then { GVAR(Latitude) = 35; GVAR(Altitude) = 2000; };
if (worldName in ["Thirsk"]) then { GVAR(Latitude) = 65; GVAR(Altitude) = 0; };
if (worldName in ["lingor"]) then { GVAR(Latitude) = -4; GVAR(Altitude) = 0; };
if (worldName in ["Panthera3"]) then { GVAR(Latitude) = 46; GVAR(Altitude) = 0; };

// TODO: Remove this hack once the weather engine is up and running
if (isNil QUOTE(EGVAR(weather,currentTemperature))) then { EGVAR(weather,currentTemperature) = 24; };
if (isNil QUOTE(EGVAR(weather,currentHumidity))) then { EGVAR(weather,currentHumidity) = 50; };

GVAR(SimulationPrecision) = 1;

GVAR(INIT_MESSAGE_ENABLED) = true;

GVAR(WindEnabled) = true;
GVAR(SpinDriftEnabled) = true;
GVAR(CoriolisEnabled) = true;
GVAR(EoetvoesEnabled) = true;
GVAR(AdvancedAirDragEnabled) = true;
GVAR(TransonicRegionEnabled) = true;
GVAR(AmmoTemperatureEnabled) = true;
GVAR(BulletTraceEnabled) = true;
GVAR(AtmosphericDensitySimulationEnabled) = true;
GVAR(BarrelLengthInfluenceEnabled) = true;
GVAR(VehicleGunnerEnabled) = true;
GVAR(ExtensionsEnabled) = false;

[] call FUNC(initializeTerrainExtension);
