// testing, update fncs on the fly
#undef PREP
#define PREP(var1) TRIPLES(ADDON,fnc,var1) = { call compile preProcessFileLineNumbers '\MAINPREFIX\PREFIX\SUBPREFIX\COMPONENT_F\functions\DOUBLES(fnc,var1).sqf' }

PREP(calculateCooling);
PREP(canUnjam);
PREP(canSwapBarrel);
PREP(canCheckSpareBarrelsTemperatures);
PREP(canCoolWeaponWithItem);
PREP(checkSpareBarrelsTemperatures);
PREP(checkTemperature);
PREP(clearJam);
PREP(cookoffWeapon);
PREP(cookoffWeaponDummy);
PREP(coolWeaponWithItem);
PREP(coolWeaponWithWaterSource);
PREP(displayTemperature);
PREP(firedEH);
PREP(getAmmoTemperature);
PREP(getBarrelMass);
PREP(getConsumableChildren);
PREP(getWeaponData);
PREP(getWeaponTemperature);
PREP(handleTakeEH);
PREP(handleRespawn);
PREP(jamWeapon);
PREP(loadCoolestSpareBarrel);
PREP(overheat);
PREP(sendSpareBarrelsTemperaturesHint);
PREP(setAmmoTemperature);
PREP(setWeaponTemperature);
PREP(swapBarrel);
PREP(swapBarrelAssistant);
PREP(swapBarrelCallback);
PREP(updateAmmoTemperature);
PREP(updateAmmoTemperatureThread);
PREP(updateSpareBarrelsTemperaturesThread);
PREP(updateTemperature);
PREP(updateTemperatureThread);
