#include "script_component.hpp"

PREP(flashbangEffectStages);
PREP(flashbangExplosionEH);
PREP(flashbangThrownFuze);
PREP(nextMode);
PREP(throwGrenade);

["flashbangExplosion", { _this call DFUNC(flashbangExplosionEH) }] call EFUNC(common,addEventHandler);
