/*
 * Author: aeroson
 * Images, index in images and order of roles.
 * Defined number also implies order, lower number shows more on top of the list.
 */

#define PILOT 0
#define DRIVER 1
#define COPILOT PILOT
#define COMMANDER 2
#define GUNNER 3
#define FFV 4
#define CARGO 5

#define ROLE_IMAGES [ \
    "a3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa", \
    "a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa", \
    "a3\ui_f\data\IGUI\Cfg\Actions\getincommander_ca.paa", \
    "a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa", \
    QPATHTOF(UI\icon_position_ffv.paa), \
    "a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa" \
]
