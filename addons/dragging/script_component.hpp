#define COMPONENT dragging
#define COMPONENT_BEAUTIFIED Dragging
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_ENABLED_DRAGGING
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_DRAGGING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_DRAGGING
    #define DEBUG_SETTINGS DEBUG_ENABLED_DRAGGING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DRAG_ANIMATIONS ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon", "acinpknlmwlksraswrfldb", "acinpknlmwlksnonwnondb"]
#define CARRY_ANIMATIONS ["acinpercmstpsnonwnondnon", "acinpknlmstpsnonwnondnon_acinpercmrunsnonwnondnon"]
