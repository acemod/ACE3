/*
 * Author: Rosuto, Ruthberg
 * Creates the DAGR menu dialog
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

[] spawn {
    if (DAGR_MENU_RUN) then {
        closeDialog 266860;
        DAGR_PWR = true;
        sleep 0.1;
    };

    135471 cutText ["", "PLAIN"];
    
    DAGR_RUN = false;
    DAGR_MENU_RUN = true;
    DAGR_Menu_Handler = [] execFSM QUOTE(PATHTOF(DAGR_MENU.fsm));
};
