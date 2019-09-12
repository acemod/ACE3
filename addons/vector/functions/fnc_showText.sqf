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
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_c.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_g.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("settings"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("nigt"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_g.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_t.paa);
    };

    case ("eret"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_r.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_t.paa);
    };

    case ("on"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("off"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("deg"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText QPATHTOF(rsc\vector_3.paa);
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_6.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_0.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_degree.paa);
    };

    case ("mil"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText QPATHTOF(rsc\vector_6.paa);
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_4.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_0.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_0.paa);
    };

    case ("meter"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_minus.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("feet"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_e.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("stor"): {
        (_dlgVector displayCtrl IDC_DIGIT_E1) ctrlSetText QPATHTOF(rsc\vector_5.paa);
        (_dlgVector displayCtrl IDC_DIGIT_E2) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_E3) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_E4) ctrlSetText QPATHTOF(rsc\vector_r.paa);
    };

    case ("old_config"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_d.paa);
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_c.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText QPATHTOF(rsc\vector_f.paa);
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("old_settings"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText QPATHTOF(rsc\vector_o.paa);
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText QPATHTOF(rsc\vector_1.paa);
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText QPATHTOF(rsc\vector_d.paa);
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText QPATHTOF(rsc\vector_u.paa);
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText QPATHTOF(rsc\vector_n.paa);
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText QPATHTOF(rsc\vector_i.paa);
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText QPATHTOF(rsc\vector_t.paa);
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("clear_left"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText "";
    };

    case ("clear_right"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("clear_stor"): {
        (_dlgVector displayCtrl IDC_DIGIT_E1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_E2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_E3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_E4) ctrlSetText "";
    };
};

[GVAR(illuminate)] call FUNC(illuminate);
