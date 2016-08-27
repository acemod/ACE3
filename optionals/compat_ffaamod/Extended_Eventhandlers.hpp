class Extended_Init_Eventhandlers {
    class ffaa_ar_lcm {
        ffaa_ar_lcm_init="_nil=(_this select 0) execvm ""\ffaa_ar_lcm\scripts\init_lcm.sqf"";";
    };
    class ffaa_ar_zodiac_hurricane {
        ffaa_ar_zodiac_init="_this execvm ""\ffaa_ar_zodiac\script\lightbar.sqf"";";
    };
    class ffaa_ea_hercules_base {
        ffaa_ea_hercules_init="[(_this select 0),[[3,'n','2'],[4,'n','2']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_spike_tripode {
        ffaa_estatico_init="(_this select 0) setvariable [""modo"",""manual""];";
    };
    class ffaa_et_ch47_base {
        ffaa_et_ch47_init="[] execvm ""\ffaa_et_ch47\scripts\init_ch47.sqf""; [(_this select 0),[[2,'n','1'],[3,'n','1'],[4,'b','1'],[5,'b','1']]] spawn ffaa_fnc_numerales; _script=[] execVM '\FFAA_rapel\func\FFAA_init_rapel.sqf';";
    };
    class ffaa_famet_cougar_base {
        ffaa_et_cougar_init="_script=[] execVM '\FFAA_rapel\func\FFAA_init_rapel.sqf';[(_this select 0),[[1,'n','1'],[2,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_pizarro {
        ffaa_et_pizarro_init="[(_this select 0),[[0,'n','1',[0,1,4]],[1,'n','1'],[2,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_famet_tigre_base {
        ffaa_et_tigre_init="(_this select 0) setvariable [""modo"",""manual""];[(_this select 0),[[2,'n','2'],[3,'n','2']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_toa {
        ffaa_et_toa_init="[(_this select 0),[[0,'n','1',[0,6,8]],[1,'n','1'],[2,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_toa_m2 {
        ffaa_et_toa_init="[(_this select 0),[[1,'n','1',[0,6,8]],[2,'n','1'],[3,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_toa_mando {
        ffaa_et_toa_init="[(_this select 0),[[1,'n','1',[0,6,8]],[2,'n','1'],[3,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_toa_zapador {
        ffaa_et_toa_init="[(_this select 0),[[1,'n','1',[0,6,8]],[2,'n','1'],[3,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_toa_ambulancia {
        ffaa_et_toa_init="[(_this select 0),[[1,'n','1',[0,6,8]],[2,'n','1'],[3,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_leopardo_base {
        ffaa_et_leopardo_init="[(_this select 0),[[0,'n','1',[0,1,3]],[1,'n','1'],[2,'n','1']]] spawn ffaa_fnc_numerales;";
    };
    class ffaa_et_searcherIII {
        ffaa_et_searcher_init="[(_this select 0),[[1,'n','2',[0,0,2]],[2,'n','2']]] spawn ffaa_fnc_numerales;";
    };
};
class Extended_firedBIS_Eventhandlers {
    class ffaa_spike_tripode {
        ffaa_estatico_fired="_this call BIS_Effects_EH_Fired;_scr2=_this execvm ""\ffaa_estatico\script\misil.sqf"";";
    };
    class ffaa_famet_tigre_base {
        ffaa_et_tigre_fired="_this call BIS_Effects_EH_Fired;src2=_this execvm ""\ffaa_et_tigre\script\tigre_spike.sqf"";";
    };
};
class Extended_GetIn_EventHandlers {
    class ffaa_UAVStation {
        ffaa_et_searcher_GetIn="_this execvm ""\ffaa_et_searcher\script\UAVStation.sqf"";";
    };
};
