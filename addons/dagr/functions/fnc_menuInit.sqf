/*
 * Author: Rosuto, Ruthberg
 * Creates the DAGR menu dialog
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "DAGR_MENU")
#define __F1 266874
#define __F2 266875
#define __F3 266876
#define __Option0 2668777
#define __Option1 2668778
#define __Option2 2668779
#define __Option3 2668780
#define __Option4 2668781
#define __Selection0 2668783
#define __Selection1 2668784
#define __Selection2 2668785
#define __Selection3 2668786
#define __Selection4 2668787
#define __mainText 2668782
#define __PSelection1 2668788
#define __PSelection2 2668789
#define __PSelection3 2668790
#define __PSelection4 2668791
#define __PSelection5 2668792
#define __PSelection6 2668793
#define __PSelection7 2668794
#define __PSelection8 2668795

135471 cutText ["", "PLAIN"];
closeDialog 0;
createDialog "DAGR_MENU";

GVAR(menu) = "main";
GVAR(selection) = 0;
GVAR(numSelections) = 5;
GVAR(tmpUpdateRate) = GVAR(updateInterval);
GVAR(edit) = false;
GVAR(add) = false;
GVAR(pointer) = 0;
GVAR(digit1) = 0;
GVAR(digit2) = 0;
GVAR(digit3) = 0;
GVAR(digit4) = 0;
GVAR(digit5) = 0;
GVAR(digit6) = 0;
GVAR(digit7) = 0;
GVAR(digit8) = 0;

GVAR(busy) = false;
GVAR(busyTimer) = 0;

GVAR(showNoWaypointsFound) = false;
GVAR(showInfoUpdatin) = false;
GVAR(showDeleting) = false;
GVAR(showOutOfSpace) = false;

GVAR(PWR) = false;
GVAR(menuRun) = true;
[{
    if (!dialog || GVAR(PWR) || !GVAR(menuRun)) exitWith {
        closeDialog 266860;
        GVAR(menuRun) = false;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (GVAR(MENU_B)) then {
        GVAR(menu) = "main";
        GVAR(selection) = 0;
        GVAR(numSelections) = 5;
    };

    if (!GVAR(add) && !GVAR(edit)) then {
        if (GVAR(DOWN)) then {
            GVAR(selection) = (GVAR(numSelections) + GVAR(selection) + 1);
        };
        if (GVAR(UP)) then {
            GVAR(selection) = (GVAR(numSelections) + GVAR(selection) - 1);
        };
        GVAR(selection) = if (GVAR(numSelections) > 0) then { GVAR(selection) % GVAR(numSelections) } else { 0 };
    };

    if (GVAR(LEFT)) then {
        GVAR(pointer) = (8 + GVAR(pointer) - 1);
    };
    if (GVAR(RIGHT)) then {
        GVAR(pointer) = (8 + GVAR(pointer) + 1);
    };
    GVAR(pointer) = GVAR(pointer) % 8;

    (__dsp displayCtrl __PSelection1) ctrlSetText "";
    (__dsp displayCtrl __PSelection2) ctrlSetText "";
    (__dsp displayCtrl __PSelection3) ctrlSetText "";
    (__dsp displayCtrl __PSelection4) ctrlSetText "";
    (__dsp displayCtrl __PSelection5) ctrlSetText "";
    (__dsp displayCtrl __PSelection6) ctrlSetText "";
    (__dsp displayCtrl __PSelection7) ctrlSetText "";
    (__dsp displayCtrl __PSelection8) ctrlSetText "";

    (__dsp displayCtrl __Selection0) ctrlSetText "";
    (__dsp displayCtrl __Selection1) ctrlSetText "";
    (__dsp displayCtrl __Selection2) ctrlSetText "";
    (__dsp displayCtrl __Selection3) ctrlSetText "";
    (__dsp displayCtrl __Selection4) ctrlSetText "";

    (__dsp displayCtrl __F1) ctrlSetText "";
    (__dsp displayCtrl __F2) ctrlSetText "";
    (__dsp displayCtrl __F3) ctrlSetText "";

    (__dsp displayCtrl __mainText) ctrlSetText "";
    (__dsp displayCtrl __Option0) ctrlSetText "";
    (__dsp displayCtrl __Option1) ctrlSetText "";
    (__dsp displayCtrl __Option2) ctrlSetText "";
    (__dsp displayCtrl __Option3) ctrlSetText "";
    (__dsp displayCtrl __Option4) ctrlSetText "";

    switch (GVAR(menu)) do {
        case "main": {
            if (GVAR(SEL)) then {
                 switch (GVAR(selection)) do {
                    case 0: {
                        GVAR(displaySelection) = "DATA";
                        GVAR(vectorConnected) = false;
                        if (!GVAR(busy)) then {
                            GVAR(busy) = true;
                            GVAR(busyTimer) = CBA_missionTime;
                        };
                        (__dsp displayCtrl __mainText) ctrlSetText "Acquiring Data.";
                        if (CBA_missionTime - GVAR(busyTimer) > 0.5) then {
                            (__dsp displayCtrl __mainText) ctrlSetText "Acquiring Data..";
                        };
                        if (CBA_missionTime - GVAR(busyTimer) > 1.0) then {
                            (__dsp displayCtrl __mainText) ctrlSetText "Acquiring Data...";
                        };
                        if (CBA_missionTime - GVAR(busyTimer) > 1.5) then {
                            (__dsp displayCtrl __mainText) ctrlSetText "Position Acquired";
                        };
                        if (CBA_missionTime - GVAR(busyTimer) > 3.0) then {
                            GVAR(busy) = false;
                        };
                    };
                    case 1: {
                        if (GVAR(numWaypoints) < 1) then {
                            (__dsp displayCtrl __mainText) ctrlSetText "No Waypoints Found";
                            if (!GVAR(busy)) then {
                                GVAR(showNoWaypointsFound) = true;
                                GVAR(busy) = true;
                                GVAR(busyTimer) = CBA_missionTime;
                            };
                        } else {
                            GVAR(menu) = "goto_wp"; GVAR(numSelections) = GVAR(numWaypoints); GVAR(selection) = 0;
                        };
                    };
                    case 2: { GVAR(menu) = "wp_list"; GVAR(numSelections) = GVAR(numWaypoints); GVAR(selection) = 0 };
                    case 3: { GVAR(menu) = "connect"; GVAR(numSelections) = 1; };
                    case 4: { GVAR(menu) = "options"; GVAR(numSelections) = 2; };
                 };
            };
            if (GVAR(busy) && GVAR(showNoWaypointsFound)) then {
                if (CBA_missionTime - GVAR(busyTimer) > 2) then {
                    GVAR(showNoWaypointsFound) = false;
                    GVAR(busy) = false;
                };
            };
            if (!GVAR(busy)) then {
                (__dsp displayCtrl __Option0) ctrlSetText "DATA VIEW";
                (__dsp displayCtrl __Option1) ctrlSetText "GOTO WP";
                (__dsp displayCtrl __Option2) ctrlSetText "WP LIST";
                (__dsp displayCtrl __Option3) ctrlSetText "CONNECT TO";
                (__dsp displayCtrl __Option4) ctrlSetText "OPTIONS";
                (__dsp displayCtrl (__Selection0 + GVAR(selection))) ctrlSetText QPATHTOF(UI\DAGR_Selection.paa);
            };
        };
        case "goto_wp": {
            if (!GVAR(busy)) then {
                (__dsp displayCtrl __Option0) ctrlSetText GVAR(wpString0);
                (__dsp displayCtrl __Option1) ctrlSetText GVAR(wpString1);
                (__dsp displayCtrl __Option2) ctrlSetText GVAR(wpString2);
                (__dsp displayCtrl __Option3) ctrlSetText GVAR(wpString3);
                (__dsp displayCtrl __Option4) ctrlSetText GVAR(wpString4);
                if (GVAR(numSelections) > 0) then {
                    (__dsp displayCtrl (__Selection0 + GVAR(selection))) ctrlSetText QPATHTOF(UI\DAGR_Selection.paa);
                };
            };
            if (GVAR(SEL)) then {
                GVAR(vectorConnected) = false;
                GVAR(displaySelection) = "WP";
                switch (GVAR(selection)) do {
                    case 0: { DAGR_WP_INFO = GVAR(wp0); };
                    case 1: { DAGR_WP_INFO = GVAR(wp1); };
                    case 2: { DAGR_WP_INFO = GVAR(wp2); };
                    case 3: { DAGR_WP_INFO = GVAR(wp3); };
                    case 4: { DAGR_WP_INFO = GVAR(wp4); };
                };
                if (!GVAR(busy)) then {
                    GVAR(showInfoUpdating) = true;
                    GVAR(busy) = true;
                    GVAR(busyTimer) = CBA_missionTime;
                };
            };
            if (GVAR(busy) && GVAR(showInfoUpdating)) then {
                (__dsp displayCtrl __mainText) ctrlSetText "Info Update.";
                if (CBA_missionTime - GVAR(busyTimer) > 1) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Info Update..";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 1.2) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Info Update...";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 1.4) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Info Updated";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 2.9) then {
                    GVAR(showInfoUpdating) = false;
                    GVAR(busy) = false;
                };
            };
        };
        case "wp_list": {
            if (!GVAR(add) && !GVAR(edit)) then {
                if (!GVAR(busy)) then {
                    (__dsp displayCtrl __Option0) ctrlSetText GVAR(wpString0);
                    (__dsp displayCtrl __Option1) ctrlSetText GVAR(wpString1);
                    (__dsp displayCtrl __Option2) ctrlSetText GVAR(wpString2);
                    (__dsp displayCtrl __Option3) ctrlSetText GVAR(wpString3);
                    (__dsp displayCtrl __Option4) ctrlSetText GVAR(wpString4);
                    (__dsp displayCtrl __F1) ctrlSetText "Add";
                    (__dsp displayCtrl __F2) ctrlSetText "Edit";
                    (__dsp displayCtrl __F3) ctrlSetText "Delete";
                    if (GVAR(numSelections) > 0) then {
                        (__dsp displayCtrl (__Selection0 + GVAR(selection))) ctrlSetText QPATHTOF(UI\DAGR_Selection.paa);
                    };
                };
                if (GVAR(F3) && GVAR(numWaypoints) > 0) then {
                    if (!GVAR(busy)) then {
                        switch (GVAR(selection)) do {
                            case 0: {
                                GVAR(wpString0) = GVAR(wpString1);
                                GVAR(wp0) = GVAR(wp1);
                                GVAR(wpString1) = GVAR(wpString2);
                                GVAR(wp1) = GVAR(wp2);
                                GVAR(wpString2) = GVAR(wpString3);
                                GVAR(wp2) = GVAR(wp3);
                                GVAR(wpString3) = GVAR(wpString4);
                                GVAR(wp3) = GVAR(wp4);
                                GVAR(wpString4) = "";
                                GVAR(wp4) = "";
                            };
                            case 1: {
                                GVAR(wpString1) = GVAR(wpString2);
                                GVAR(wp1) = GVAR(wp2);
                                GVAR(wpString2) = GVAR(wpString3);
                                GVAR(wp2) = GVAR(wp3);
                                GVAR(wpString3) = GVAR(wpString4);
                                GVAR(wp3) = GVAR(wp4);
                                GVAR(wpString4) = "";
                                GVAR(wp4) = "";
                            };
                            case 2: {
                                GVAR(wpString2) = GVAR(wpString3);
                                GVAR(wp2) = GVAR(wp3);
                                GVAR(wpString3) = GVAR(wpString4);
                                GVAR(wp3) = GVAR(wp4);
                                GVAR(wpString4) = "";
                                GVAR(wp4) = "";
                            };
                            case 3: {
                                GVAR(wpString3) = GVAR(wpString4);
                                GVAR(wp3) = GVAR(wp4);
                                GVAR(wpString4) = "";
                                GVAR(wp4) = "";
                            };
                            case 4: {
                                GVAR(wpString4) = "";
                                GVAR(wp4) = "";
                            };
                        };
                        GVAR(numWaypoints) = GVAR(numWaypoints) - 1;
                        GVAR(numSelections) = GVAR(numWaypoints);
                        GVAR(showDeleting) = true;
                        GVAR(busy) = true;
                        GVAR(busyTimer) = CBA_missionTime;
                    };
                };
                if (GVAR(busy) && GVAR(showDeleting)) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Deleting.";
                    if (CBA_missionTime - GVAR(busyTimer) > 1) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Deleting..";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 1.2) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Deleting...";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 1.4) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Waypoint Deleted";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 2.9) then {
                        GVAR(showDeleting) = false;
                        GVAR(busy) = false;
                    };
                };
                if (GVAR(F1)) then {
                    if (GVAR(numWaypoints) == 5) then {
                        if (!GVAR(busy)) then {
                            GVAR(showOutOfSpace) = true;
                            GVAR(busy) = true;
                            GVAR(busyTimer) = CBA_missionTime;
                        };
                    } else {
                        GVAR(digit1) = 0;
                        GVAR(digit2) = 0;
                        GVAR(digit3) = 0;
                        GVAR(digit4) = 0;
                        GVAR(digit5) = 0;
                        GVAR(digit6) = 0;
                        GVAR(digit7) = 0;
                        GVAR(digit8) = 0;
                        GVAR(pointer) = 0;
                        GVAR(add) = true;
                    };
                };
                if (GVAR(busy) && GVAR(showOutOfSpace)) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Out of Space";
                    if (CBA_missionTime - GVAR(busyTimer) > 2.5) then {
                        GVAR(showOutOfSpace) = false;
                        GVAR(busy) = false;
                    };
                };
                if (GVAR(F2) && GVAR(numWaypoints) > 0) then {
                    GVAR(pointer) = 0;
                    GVAR(edit) = true;
                    GVAR(add) = false;
                    switch (GVAR(selection)) do {
                        case 0: {
                            GVAR(digit1) = floor (GVAR(wp0) / 10000000);
                            GVAR(digit2) = floor (GVAR(wp0) / 1000000 - GVAR(digit1) *10);
                            GVAR(digit3) = floor (GVAR(wp0) / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                            GVAR(digit4) = floor (GVAR(wp0) / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                            GVAR(digit5) = floor (GVAR(wp0) / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                            GVAR(digit6) = floor (GVAR(wp0) / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                            GVAR(digit7) = floor (GVAR(wp0) / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                            GVAR(digit8) = floor (GVAR(wp0) - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                        };
                        case 1: {
                            GVAR(digit1) = floor (GVAR(wp1) / 10000000);
                            GVAR(digit2) = floor (GVAR(wp1) / 1000000 - GVAR(digit1) *10);
                            GVAR(digit3) = floor (GVAR(wp1) / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                            GVAR(digit4) = floor (GVAR(wp1) / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                            GVAR(digit5) = floor (GVAR(wp1) / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                            GVAR(digit6) = floor (GVAR(wp1) / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                            GVAR(digit7) = floor (GVAR(wp1) / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                            GVAR(digit8) = floor (GVAR(wp1) - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                        };
                        case 2: {
                            GVAR(digit1) = floor (GVAR(wp2) / 10000000);
                            GVAR(digit2) = floor (GVAR(wp2) / 1000000 - GVAR(digit1) *10);
                            GVAR(digit3) = floor (GVAR(wp2) / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                            GVAR(digit4) = floor (GVAR(wp2) / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                            GVAR(digit5) = floor (GVAR(wp2) / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                            GVAR(digit6) = floor (GVAR(wp2) / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                            GVAR(digit7) = floor (GVAR(wp2) / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                            GVAR(digit8) = floor (GVAR(wp2) - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                        };
                        case 3: {
                            GVAR(digit1) = floor (GVAR(wp3) / 10000000);
                            GVAR(digit2) = floor (GVAR(wp3) / 1000000 - GVAR(digit1) *10);
                            GVAR(digit3) = floor (GVAR(wp3) / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                            GVAR(digit4) = floor (GVAR(wp3) / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                            GVAR(digit5) = floor (GVAR(wp3) / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                            GVAR(digit6) = floor (GVAR(wp3) / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                            GVAR(digit7) = floor (GVAR(wp3) / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                            GVAR(digit8) = floor (GVAR(wp3) - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                        };
                        case 4: {
                            GVAR(digit1) = floor (GVAR(wp4) / 10000000);
                            GVAR(digit2) = floor (GVAR(wp4) / 1000000 - GVAR(digit1) *10);
                            GVAR(digit3) = floor (GVAR(wp4) / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                            GVAR(digit4) = floor (GVAR(wp4) / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                            GVAR(digit5) = floor (GVAR(wp4) / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                            GVAR(digit6) = floor (GVAR(wp4) / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                            GVAR(digit7) = floor (GVAR(wp4) / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                            GVAR(digit8) = floor (GVAR(wp4) - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                        };
                    };
                };
            } else {
                if (!GVAR(busy)) then {
                    (__dsp displayCtrl __F1) ctrlSetText "Save";
                    (__dsp displayCtrl __F2) ctrlSetText "Vector";
                    (__dsp displayCtrl __F3) ctrlSetText "Cancel";
                    GVAR(output) = str GVAR(digit1) + str GVAR(digit2) + str GVAR(digit3) + str GVAR(digit4) + str GVAR(digit5) + str GVAR(digit6) + str GVAR(digit7) + str GVAR(digit8);
                    (__dsp displayCtrl __mainText) ctrlSetText GVAR(output);
                    (__dsp displayCtrl __PSelection1 + GVAR(pointer)) ctrlSetText QPATHTOF(UI\DAGR_PSelection.paa);
                };
                if (GVAR(F1)) then {
                    if (!GVAR(busy)) then {
                        if (GVAR(add)) then {
                            switch (GVAR(numWaypoints)) do {
                                case 0: { GVAR(wpString0) = GVAR(output); GVAR(wp0) = parseNumber GVAR(output); };
                                case 1: { GVAR(wpString1) = GVAR(output); GVAR(wp1) = parseNumber GVAR(output); };
                                case 2: { GVAR(wpString2) = GVAR(output); GVAR(wp2) = parseNumber GVAR(output); };
                                case 3: { GVAR(wpString3) = GVAR(output); GVAR(wp3) = parseNumber GVAR(output); };
                                case 4: { GVAR(wpString4) = GVAR(output); GVAR(wp4) = parseNumber GVAR(output); };
                            };
                            GVAR(numWaypoints) = GVAR(numWaypoints) + 1;
                            GVAR(numSelections) = GVAR(numWaypoints);
                            GVAR(selection) = 0;
                        };
                        if (GVAR(edit)) then {
                            switch (GVAR(selection)) do {
                                case 0: { GVAR(wpString0) = GVAR(output); GVAR(wp0) = parseNumber GVAR(output); };
                                case 1: { GVAR(wpString1) = GVAR(output); GVAR(wp1) = parseNumber GVAR(output); };
                                case 2: { GVAR(wpString2) = GVAR(output); GVAR(wp2) = parseNumber GVAR(output); };
                                case 3: { GVAR(wpString3) = GVAR(output); GVAR(wp3) = parseNumber GVAR(output); };
                                case 4: { GVAR(wpString4) = GVAR(output); GVAR(wp4) = parseNumber GVAR(output); };
                            };
                        };
                        GVAR(busy) = true;
                        GVAR(busyTimer) = CBA_missionTime;
                    };
                    (__dsp displayCtrl __F1) ctrlSetText "";
                    (__dsp displayCtrl __F2) ctrlSetText "";
                    (__dsp displayCtrl __F3) ctrlSetText "";
                    (__dsp displayCtrl __mainText) ctrlSetText "Saving.";
                    if (CBA_missionTime - GVAR(busyTimer) > 1) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Saving..";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 1.2) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Saving...";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 1.4) then {
                        (__dsp displayCtrl __mainText) ctrlSetText "Waypoint Saved";
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 2.9) then {
                        GVAR(edit) = false;
                        GVAR(add) = false;
                        GVAR(busy) = false;
                    };
                };
                if (GVAR(F2)) then {
                    private _grid = toArray GVAR(vectorGrid);
                    _grid deleteAt 4;
                    _grid = toString _grid;
                    private _gridVector = parseNumber _grid;
                    GVAR(digit1) = floor(_gridVector / 10000000);
                    GVAR(digit2) = floor(_gridVector / 1000000 - GVAR(digit1) *10);
                    GVAR(digit3) = floor(_gridVector / 100000 - GVAR(digit2) * 10 - GVAR(digit1) * 100);
                    GVAR(digit4) = floor(_gridVector / 10000 - GVAR(digit3) * 10 - GVAR(digit2) * 100 - GVAR(digit1) * 1000);
                    GVAR(digit5) = floor(_gridVector / 1000 - GVAR(digit4) * 10 - GVAR(digit3) * 100 - GVAR(digit2) * 1000 - GVAR(digit1) * 10000);
                    GVAR(digit6) = floor(_gridVector / 100 - GVAR(digit5) * 10 - GVAR(digit4) * 100 - GVAR(digit3) * 1000 - GVAR(digit2) * 10000 - GVAR(digit1) * 100000);
                    GVAR(digit7) = floor(_gridVector / 10- GVAR(digit6) * 10 - GVAR(digit5) * 100 - GVAR(digit4) * 1000 - GVAR(digit3) * 10000 - GVAR(digit2) * 100000 - GVAR(digit1) * 1000000);
                    GVAR(digit8) = floor(_gridVector - GVAR(digit7) * 10 - GVAR(digit6) * 100 - GVAR(digit5) * 1000 - GVAR(digit4) * 10000 - GVAR(digit3) * 100000 - GVAR(digit2) * 1000000 - GVAR(digit1) * 10000000);
                };
                if (GVAR(F3)) then {
                    if (!GVAR(busy)) then {
                        GVAR(busy) = true;
                        GVAR(busyTimer) = CBA_missionTime;
                    } else {
                        (__dsp displayCtrl __F1) ctrlSetText "Save";
                        (__dsp displayCtrl __F2) ctrlSetText "Vector";
                        (__dsp displayCtrl __F3) ctrlSetText "Cancel";
                        GVAR(output) = str GVAR(digit1) + str GVAR(digit2) + str GVAR(digit3) + str GVAR(digit4) + str GVAR(digit5) + str GVAR(digit6) + str GVAR(digit7) + str GVAR(digit8);
                        (__dsp displayCtrl __mainText) ctrlSetText GVAR(output);
                    };
                    if (CBA_missionTime - GVAR(busyTimer) > 0.1) then {
                        GVAR(add) = false;
                        GVAR(edit) = false;
                        GVAR(busy) = false;
                    };
                };
                if (GVAR(UP)) then {
                    switch (GVAR(pointer) + 1) do {
                        case 1: { GVAR(digit1) = (10 + GVAR(digit1) + 1) % 10 };
                        case 2: { GVAR(digit2) = (10 + GVAR(digit2) + 1) % 10 };
                        case 3: { GVAR(digit3) = (10 + GVAR(digit3) + 1) % 10 };
                        case 4: { GVAR(digit4) = (10 + GVAR(digit4) + 1) % 10 };
                        case 5: { GVAR(digit5) = (10 + GVAR(digit5) + 1) % 10 };
                        case 6: { GVAR(digit6) = (10 + GVAR(digit6) + 1) % 10 };
                        case 7: { GVAR(digit7) = (10 + GVAR(digit7) + 1) % 10 };
                        case 8: { GVAR(digit8) = (10 + GVAR(digit8) + 1) % 10 };
                    };
                };
                if (GVAR(DOWN)) then {
                    switch (GVAR(pointer) + 1) do {
                        case 1: { GVAR(digit1) = (10 + GVAR(digit1) - 1) % 10 };
                        case 2: { GVAR(digit2) = (10 + GVAR(digit2) - 1) % 10 };
                        case 3: { GVAR(digit3) = (10 + GVAR(digit3) - 1) % 10 };
                        case 4: { GVAR(digit4) = (10 + GVAR(digit4) - 1) % 10 };
                        case 5: { GVAR(digit5) = (10 + GVAR(digit5) - 1) % 10 };
                        case 6: { GVAR(digit6) = (10 + GVAR(digit6) - 1) % 10 };
                        case 7: { GVAR(digit7) = (10 + GVAR(digit7) - 1) % 10 };
                        case 8: { GVAR(digit8) = (10 + GVAR(digit8) - 1) % 10 };
                    };
                };
            };
        };
        case "connect": {
            if (!GVAR(busy)) then {
                (__dsp displayCtrl __Option0) ctrlSetText "Vector 21";
                (__dsp displayCtrl __Selection0) ctrlSetText QPATHTOF(UI\DAGR_Selection.paa);
            };
            if (GVAR(SEL)) then {
                if (!GVAR(busy)) then {
                    GVAR(busy) = true;
                    GVAR(busyTimer) = CBA_missionTime;
                };
                (__dsp displayCtrl __mainText) ctrlSetText "Connecting.";
                if (CBA_missionTime - GVAR(busyTimer) > 0.2) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Connecting..";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 0.4) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Connecting...";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 0.6) then {
                    if (({_x isKindOf  ["ACE_Vector", configFile >> "CfgWeapons"]} count (weapons ACE_player)) > 0) then {
                        GVAR(displaySelection) = "VECTOR";
                        (__dsp displayCtrl __mainText) ctrlSetText "Vector Connected";
                        GVAR(vectorConnected) = true;
                    } else {
                        (__dsp displayCtrl __mainText) ctrlSetText "No Device Found";
                        GVAR(vectorConnected) = false;
                    };
                };
                if (CBA_missionTime - GVAR(busyTimer) > 3.1) then {
                    GVAR(busy) = false;
                    if (GVAR(vectorConnected)) then {
                        GVAR(menu) = "main"; GVAR(numSelections) = 5;
                    };
                };
            };
        };
        case "options": {
            (__dsp displayCtrl __Option0) ctrlSetText "Signal Delay";
            (__dsp displayCtrl __Option1) ctrlSetText (if (GVAR(useDegrees)) then { "Direction: Deg" } else { "Direction: MIL" });
            (__dsp displayCtrl (__Selection0 + GVAR(selection))) ctrlSetText QPATHTOF(UI\DAGR_Selection.paa);
            if (GVAR(SEL)) then {
                GVAR(vectorConnected) = false;
                switch (GVAR(selection)) do {
                    case 0: { GVAR(menu) = "update_rate"; GVAR(numSelections) = 1; GVAR(tmpUpdateRate) = GVAR(updateInterval); };
                    case 1: { GVAR(useDegrees) = !GVAR(useDegrees); };
                };
            }
        };
        case "update_rate": {
            if (GVAR(F1)) then {
                GVAR(updateInterval) = GVAR(tmpUpdateRate);
                if (!GVAR(busy)) then {
                    GVAR(busy) = true;
                    GVAR(busyTimer) = CBA_missionTime;
                };
                (__dsp displayCtrl __mainText) ctrlSetText "Updating.";
                if (CBA_missionTime - GVAR(busyTimer) > 0.2) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Updating..";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 0.4) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Updating...";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 0.6) then {
                    (__dsp displayCtrl __mainText) ctrlSetText "Update Success";
                };
                if (CBA_missionTime - GVAR(busyTimer) > 2.1) then {
                    GVAR(busy) = false;
                    GVAR(menu) = "options"; GVAR(numSelections) = 2;
                };
            };
            if (GVAR(F3)) then {
                GVAR(menu) = "options"; GVAR(numSelections) = 2;
            };
            if (GVAR(DOWN)) then {
                GVAR(tmpUpdateRate) = GVAR(tmpUpdateRate) - 0.1;
            };
            if (GVAR(UP)) then {
                GVAR(tmpUpdateRate) = GVAR(tmpUpdateRate) + 0.1;
            };
            GVAR(tmpUpdateRate) = 0.1 max GVAR(tmpUpdateRate) min 2.0;
            if (!GVAR(busy)) then {
                (__dsp displayCtrl __mainText) ctrlSetText (Str(GVAR(tmpUpdateRate) * 1000) + "ms");
                (__dsp displayCtrl __F1) ctrlSetText "Save";
                (__dsp displayCtrl __F3) ctrlSetText "Cancel";
            };
        };
    };

    if (!GVAR(busy)) then {
        GVAR(F3) = false;
        GVAR(F2) = false;
        GVAR(F1) = false;
        GVAR(MENU_B) = false;
        GVAR(SEL) = false;
        DAGR_NEXT = false;
        GVAR(RIGHT) = false;
        GVAR(LEFT) = false;
        GVAR(UP) = false;
        GVAR(DOWN) = false;
        GVAR(PWR) = false;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
