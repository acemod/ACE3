#define CN_SOUND(base,dur) QUOTE(TRIPLES(ADDON,base,dur))

class GVAR(base) {

    modifiableTo[] = {""};

    // describes the components of the current item.
    // When the current wearable is being changed into something, that does not have these 
    components[] = {};

    // Supports Multiple Sounds, will pick one by random.
    sound[] = {CN_SOUND(fabric,06),CN_SOUND(fabric,07),CN_SOUND(fabric,16),CN_SOUND(fabric,20),CN_SOUND(fabric,25)};
    sound_timing = 0;    // [0..1] 0 at the start of the action, 0.5 half way during the duration of the action - always, if completed or not. 1 at the end, only when completed.

    // Gesture
    gesture = "Gear";

    // These will be read from the Target Class, so for example, the uniformclass with the rolled up sleaves, it should say "Roll Up Sleeves"
    alternativePicture = "";
    alternativeDisplayName = "";

    duration = 1; // Minimum Value: 1 - Anything above will produce a progressbar.
};

// Common Base Class for Uniforms with Sleeves Up/Down Variants
class GVAR(base_U_sleeves_up): GVAR(base) {
    alternativeDisplayName = CSTRING(sleevesUp);  
};
class GVAR(base_U_sleeves_down): GVAR(base) {
    alternativeDisplayName = CSTRING(sleevesDown);
};

// Common Base Class for Uniforms with Gloves On/Off Variants
class GVAR(base_U_gloves_on): GVAR(base) {
    alternativeDisplayName = CSTRING(glovesOn); 
};
class GVAR(base_U_gloves_off): GVAR(base) {
    alternativeDisplayName = CSTRING(glovesOff);
};

// Common Base Class for Uniforms who are open/closed in the front
class GVAR(base_U_jacket_open): GVAR(base) {
    alternativeDisplayName = CSTRING(jacketOpen); 
};
class GVAR(base_U_jacket_closed): GVAR(base) {
    alternativeDisplayName = CSTRING(jacketClose);
};

// Common Base Class for Helmets with a Visor that can be flipped up or down
class GVAR(base_H_visor_up): GVAR(base) {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorUp);
};

class GVAR(base_H_visor_down): GVAR(base) {
    duration = 0.25;
    gesture ="gestureNod";

    sound[] = {CN_SOUND(helmet_visor,05)};
    sound_timing = 0;

    alternativeDisplayName = CSTRING(visorDown);
};

// Common Base Class for Headgear with goggles that can be used as a facewear item.
class GVAR(base_H_goggles_on): GVAR(base) {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOn);
};

class GVAR(base_H_goggles_off): GVAR(base) {
    gesture ="GestureWipeFace";
    alternativeDisplayName = CSTRING(gogglesOff);
};
