#include "script_component.hpp"

ADDON = false;

PREP(addRepairActions);
PREP(addSpareParts);
PREP(canRemove);
PREP(canRepair);
PREP(canRepairTrack);
PREP(canReplaceTrack);
PREP(canReplaceWheel);
PREP(doFullRepair);
PREP(doRemoveTrack);
PREP(doRemoveWheel);
PREP(doRepair);
PREP(doRepairTrack);
PREP(doReplaceTrack);
PREP(doReplaceWheel);
PREP(getPostRepairDamage);
PREP(getWheelHitPointsWithSelections);
PREP(hasItems);
PREP(isEngineer);
PREP(isInRepairFacility);
PREP(isNearRepairVehicle);
PREP(isRepairVehicle);
PREP(moduleAddSpareParts);
PREP(moduleAssignEngineer);
PREP(moduleAssignRepairVehicle);
PREP(moduleAssignRepairFacility);
PREP(moduleRepairSettings);
PREP(normalizeHitPoints);
PREP(repair);
PREP(repair_failure);
PREP(repair_success);
PREP(setDamage);
PREP(setHitPointDamage);
PREP(spawnObject);
PREP(useItem);
PREP(useItems);

GVAR(addSparePartsCollection) = [];

ADDON = true;
