/*
 * Author: Glowbal
 * Make a copy of an array with only the unique elements.
 *
 * Arguments:
 * 0: array <ARRAY>
 *
 * Return Value:
 * Copy of original array <ARRAY>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_LOGWARNING_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3","ace_common_fnc_uniqueElementsOnly","3.5.0","ace_common_fnc_uniqueElements");

_this call FUNC(uniqueElements)
