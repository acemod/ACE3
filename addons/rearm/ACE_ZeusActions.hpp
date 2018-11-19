class ACE_ZeusActions {
    class ZeusUnits {
        class GVAR(rearm) {
            displayName = CSTRING(Rearm);
            icon = QPATHTOF(ui\icon_rearm_interact.paa);
            condition = QUOTE(ZEUS_ACTION_CONDITION && {-1 < (curatorSelected select 0) findIf {_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}}});
            statement = QUOTE( \
                { \
                    if (_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}) then { \
                        [ARR_2(objNull,_x)] call ace_rearm_fnc_rearmEntireVehicleSuccess; \
                    }; \
                } forEach (curatorSelected select 0); \
            );
        };
    };
};
