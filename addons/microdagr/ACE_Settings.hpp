class ACE_Settings {
    class GVAR(mapDataAvailable) {
        displayName = CSTRING(MapDataAvailable_DisplayName);
        description = CSTRING(MapDataAvailable_Description);
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 0;
        values[] = {CSTRING(MapFill_None), CSTRING(MapFill_OnlyRoads), CSTRING(MapFill_Full)};
    };
};
