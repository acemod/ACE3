/**
 * fn_closeAllDialogs_f.sqf
 * @Descr: Close all dialogs
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: void
 * @PublicAPI: true
 */
#include "script_component.hpp"

while {dialog} do {
    closeDialog 0;
};