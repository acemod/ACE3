
class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class ace_attributes {
                class Attributes {
                    class GVAR(hideBlueForceMarker) {
                        property = QGVAR(hideBlueForceMarker);
                        control = "Checkbox";
                        displayName = CSTRING(disableBFT);
                        tooltip = CSTRING(disableBFT_description);
                        // groups are kaputt. have to delay setVariable public for it to work.
                        expression = QUOTE(if (_value) then {[ARR_2({(_this select 0) setVariable [ARR_3('%s',_this select 1,true)];},[ARR_2(_this,_value)])] call CBA_fnc_execNextFrame};);
                        typeName = "BOOL";
                        defaultValue = "(false)"; // fix pbo project preprocessing bug
                    };
                };
            };
        };
    };
};
