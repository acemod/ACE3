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

// public
PREP(externalCamera);
PREP(isDivingGoggles);
PREP(isGogglesVisible);

// general
PREP(clearGlasses);
PREP(dustHandler);
PREP(getExplosionIndex);
PREP(isInRotorWash);

// eventhandlers
PREP(handleExplosion);
PREP(handleFired);
PREP(handleKilled);



PREP(checkGoggles);
PREP(onEachFrame);



ADDON = true;
