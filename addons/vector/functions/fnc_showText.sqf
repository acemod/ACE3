#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: String <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["5"] call ace_vector_fnc_showText
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

switch (_this select 0) do {
    case ("config"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText "";
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_c.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_g.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText "";
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("settings"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("nigt"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_g.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_t.paa);
    };

    case ("eret"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_r.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_t.paa);
    };

    case ("on"): {
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText "";
        (_dlgVector displayCtrl 1313) ctrlSetText "";
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("off"): {
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText "";
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("deg"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText QPATHTOF(rsc\vector_3.paa);
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_6.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_0.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_degree.paa);
    };

    case ("mil"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText QPATHTOF(rsc\vector_6.paa);
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_4.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_0.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_0.paa);
    };

    case ("meter"): {
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_minus.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("feet"): {
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("stor"): {
        (_dlgVector displayCtrl 1321) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl 1322) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1323) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1324) ctrlSetText QPATHTOF(rsc\vector_r.paa);
    };

    case ("old_config"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText "";
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_d.paa);
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_c.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("old_settings"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText "";
        (_dlgVector displayCtrl 1317) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl 1318) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl 1319) ctrlSetText QPATHTOF(rsc\vector_d.paa);
        (_dlgVector displayCtrl 1310) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl 1311) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl 1312) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl 1313) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("clear_left"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText "";
        (_dlgVector displayCtrl 1317) ctrlSetText "";
        (_dlgVector displayCtrl 1318) ctrlSetText "";
        (_dlgVector displayCtrl 1319) ctrlSetText "";
    };

    case ("clear_right"): {
        (_dlgVector displayCtrl 1310) ctrlSetText "";
        (_dlgVector displayCtrl 1311) ctrlSetText "";
        (_dlgVector displayCtrl 1312) ctrlSetText "";
        (_dlgVector displayCtrl 1313) ctrlSetText "";
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };

    case ("clear_stor"): {
        (_dlgVector displayCtrl 1321) ctrlSetText "";
        (_dlgVector displayCtrl 1322) ctrlSetText "";
        (_dlgVector displayCtrl 1323) ctrlSetText "";
        (_dlgVector displayCtrl 1324) ctrlSetText "";
    };
};

[GVAR(illuminate)] call FUNC(illuminate);
