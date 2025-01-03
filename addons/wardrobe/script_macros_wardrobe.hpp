// CBA Settings
#define SET(var1) TRIPLES(ADDON,set,var1)
#define QSET(var1) QUOTE(SET(var1))
#define QQSET(var1) QQ(SET(var1))
#define ESET(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),SET,var2)
#define QESET(var1,var2) QUOTE(ESET(var1,var2))
#define QQESET(var1,var2) QQ(ESET(var1,var2))

// LSTRING for cba Settings
#define SETLSTRING(key) [LSTRING(DOUBLES(set,key)),LSTRING(TRIPLES(set,key,desc))]

#define QQ(var1) QUOTE(QUOTE(var1))

#define QADDON QUOTE(ADDON)

// Paths
#define PATH_TO_FUNC QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\functions)
#define PATH_TO_FUNC_SUB(var1) QUOTE(\MAINPREFIX\PREFIX\addons\COMPONENT\functions\var1)