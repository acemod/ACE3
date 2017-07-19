class ACE_Settings {
    class GVAR(enabled) {
        value = 0;
        typeName = "BOOL";
        category = CSTRING(Category);
        displayName = ECSTRING(common,Enabled);
        description = CSTRING(KeybindDescription);
        isClientSettable = 1;
        force = 0;
    };
    class GVAR(distance) {
        value = DEFAULT_DISTANCE;
        typeName = "SCALAR";
        category = CSTRING(Category);
        displayName = CSTRING(Distance);
        description = CSTRING(DistanceDescription);
        isClientSettable = 0;
        force = 0;
        values[] = {"0m", "1m", "2m", "3m", "4m", "5m", "6m", "7m", "8m", "9m", "10m"};
    };
    class GVAR(speed) {
        value = DEFAULT_SPEED;
        typeName = "SCALAR";
        category = CSTRING(Category);
        displayName = CSTRING(Speed);
        description = CSTRING(SpeedDescription);
        isClientSettable = 0;
        force = 0;
        values[] = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"};
    };
    class GVAR(priority) {
        value = DEFAULT_PRIORITY;
        typeName = "SCALAR";
        category = CSTRING(Category);
        displayName = CSTRING(Priority);
        description = CSTRING(PriorityDescription);
        isClientSettable = 1;
        force = 0;
        values[] = {"$str_getin_pos_driver", "$str_getin_pos_gunn", "$str_getin_pos_comm", "$STR_GETIN_POS_PASSENGER"};
    };
};
