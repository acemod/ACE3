class ACE_ZeusActions {
    class ZeusUnits {
        class GVAR(rearm) {
            displayName = CSTRING(Rearm);
            icon = QPATHTOF(ui\icon_rearm_interact.paa);
            condition = QUOTE(ZEUS_ACTION_CONDITION && {-1 < (curatorSelected select 0) findIf {_x isKindOf 'AllVehicles' && {!(_x isKindOf 'Man')}}});
            statement = QUOTE(call FUNC(rearm_statement));
        };
    };
};
