#include "script_component.hpp"

["backblast", FUNC(backblastDamage)] call EFUNC(common,addEventHandler);
["overpressure", FUNC(overpressureDamage)] call EFUNC(common,addEventHandler);
