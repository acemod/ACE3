
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableFrag);
            description = CSTRING(EnableFrag_Desc);
            defaultValue = 1;
        };
        class GVAR(spallEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableSpall);
            description = CSTRING(EnableSpall_Desc);
            defaultValue = 0;
        };
        class GVAR(reflectionsEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableReflections);
            description = CSTRING(EnableReflections_Desc);
            defaultValue = 0;
        };
        class GVAR(maxTrack): CBA_Setting_Slider_base {
            displayName = CSTRING(MaxTrack);
            description = CSTRING(MaxTrack_Desc);
            min = 0;
            max = 1000;
            defaultValue = 500;
        };
        class GVAR(maxTrackPerFrame): CBA_Setting_Slider_base {
            displayName = CSTRING(MaxTrackPerFrame);
            description = CSTRING(MaxTrackPerFrame_Desc);
            min = 0;
            max = 100;
            defaultValue = 50;
        };
        class GVAR(enableDebugTrace): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableDebugTrace);
            description = CSTRING(EnableDebugTrace_Desc);
            defaultValue = 0;
        };
    };
};
