class Man;
class CAManBase: Man {
    class ACE_SelfActions {
        class ACE_Equipment {
            class EGVAR(trenches,digEnvelopeSmall) {
                condition = QUOTE(_player call FUNC(canDigTrench));
            };
            class EGVAR(trenches,digEnvelopeBig) {
                condition = QUOTE(_player call FUNC(canDigTrench));
            };
            class GVAR(digSpiderhole): EGVAR(trenches,digEnvelopeSmall) {
                displayName = "Dig Spiderhole";
                statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_01')])] call CBA_fnc_execNextFrame);
            };
            class GVAR(digSpiderholeAngled): EGVAR(trenches,digEnvelopeSmall) {
                displayName = "Dig Spiderhole (Angled Cover)";
                statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_02')])] call CBA_fnc_execNextFrame);
            };
            class GVAR(digSpiderholeDual): EGVAR(trenches,digEnvelopeSmall) {
                displayName = "Dig Spiderhole (Dual)";
                statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_03')])] call CBA_fnc_execNextFrame);
            };
        };
    };
};

class vn_b_men_aircrew_base;
class vn_b_men_jetpilot_01: vn_b_men_aircrew_base {
    ACE_GForceCoef = 0.55;
};

class vn_o_men_aircrew_01;
class vn_o_men_aircrew_05: vn_o_men_aircrew_01 {
    ACE_GForceCoef = 0.55;
};

class vn_i_men_aircrew_base;
class vn_i_men_jetpilot_01: vn_i_men_aircrew_base {
    ACE_GForceCoef = 0.55;
};
