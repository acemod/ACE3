class ACE_Settings {
    class GVAR(viewDistance) {
        typeName = "SCALAR";
        isClientSettable = 1;
        value = 0; // not sure what to set this to.
        values[] = {"1500","2000","2500","3000","3500","4000","5000","6000","7000","8000","9000","10000"}; // Values also need to be changed in functions/fnc_returnViewDistanceValue.sqf
        displayName = "Change View Distance";
        description = "Changes in game view distance";
    };
};

// To do: include string table style displayName & description.