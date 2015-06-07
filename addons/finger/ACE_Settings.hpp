#include "code\addon.hpp"

#define LOC(x) $__LOCALIZE_PREFIX__##x


class ACE_Settings {
	class GVAR(FP_indicator_for_self) {
		displayName = LOC(indicator_for_self);
		description = LOC(indicator_for_self__desc);
		isClientSettable = 1;
		typeName = "BOOL";
		value = 1;
	};
	class GVAR(FP_indicator_color)
	{
		value[] = {0.83, 0.68, 0.21, 0.75};
		typeName = "COLOR";
		isClientSettable = 1;
		displayName = LOC(color);
		description = LOC(color__desc);
	};

};
