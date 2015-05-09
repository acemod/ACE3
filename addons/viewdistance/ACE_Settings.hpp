class ACE_Settings {
    class GVAR(viewDistance) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 11; // index, NOT value // not sure what to set this to.
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnValue.sqf
        displayName = "Change View Distance";
        description = "Changes in game view distance";
    };
    class GVAR(limitViewDistance) {
        typeName = "SCALAR";
        value = 10000; // Value, NOT index. 10000 is the maximum in A3
        displayName = "View Distance Limit";
        description = "Limit for client's view distance set here and can overridden by module";
    };
};

// To do: include string table style displayName & description.