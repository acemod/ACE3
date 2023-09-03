#include "\z\ace\addons\compat_spe\script_component.hpp"

#define SUBCOMPONENT explosives
#undef ADDON
#define ADDON TRIPLES(PREFIX,COMPONENT,SUBCOMPONENT)

#define EXPLOSIVES_PLACE(CLASS) EGVAR(explosives,DOUBLES(Place,CLASS))
#define QEXPLOSIVES_PLACE(CLASS) QUOTE(EXPLOSIVES_PLACE(CLASS))
