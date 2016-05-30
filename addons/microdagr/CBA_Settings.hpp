
class CBA_Setting_List_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(mapDataAvailable): CBA_Setting_List_base {
            displayName = CSTRING(MapDataAvailable_DisplayName);
            tooltip = CSTRING(MapDataAvailable_Description);
            values[] = {0,1,2};
            labels[] = {CSTRING(MapFill_None), CSTRING(MapFill_OnlyRoads), CSTRING(MapFill_Full)};
            defaultIndex = 2;
        };
    };
};
