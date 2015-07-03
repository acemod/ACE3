#ifndef __ADDON_HPP_
#define __ADDON_HPP_


#define __ADDON_NAME__ ace_finger
#define __BASENAME__ __ADDON_NAME__##_var
#define __PREFIX__ "\z\ace\addons\finger"
#define __PREFIXC__ "\z\ace\addons\finger\code\"

#define FUNC(x) __BASENAME__##_fnc_##x
#define CFUNC(x) __ADDON_NAME__##_fnc_##x

#define GVAR(x) __BASENAME__##_##x

#define __LOCALIZE_PREFIX__ STR_Addons_ACE__dfinger__
#define LOCALIZE(x) (localize ('__LOCALIZE_PREFIX__##x'))




#define PV(x) private ['x']; x




#endif
