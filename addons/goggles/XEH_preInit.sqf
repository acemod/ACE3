#include "script_component.hpp"

ADDON = false;

// effects
PREP(applyDirtEffect);
PREP(applyDustEffect);
PREP(applyGlassesEffect);
PREP(applyRainEffect);
PREP(removeDirtEffect);
PREP(removeDustEffect);
PREP(removeGlassesEffect);
PREP(removeRainEffect);

// general
PREP(externalCamera);
PREP(isDivingGoggles);
PREP(isGogglesVisible);
PREP(isInRotorWash);
PREP(getExplosionIndex);

// eventhandlers
PREP(handleExplosion);
PREP(handleFired);
PREP(handleKilled);



PREP(checkGoggles);
PREP(clearGlasses);
PREP(dustHandler);

PREP(onEachFrame);


ADDON = true;
