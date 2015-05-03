#include <string>
#include <vector>
#include <memory>


namespace ace {
	namespace medical {
		namespace injuries {
			class InjuryType;

			class DamageType
			{
			public:
				DamageType(std::string aTypeName, unsigned int minimalLethalDamage, unsigned int minDamageThreshold, unsigned int maxDamageThreshold);
				~DamageType();

				std::string typeName;
				unsigned int minLethalDamage;
				unsigned int minDamageThreshold;
				unsigned int maxDamageThreshold;

				std::vector<std::shared_ptr<InjuryType>> possibleInjuries;
			};
		}
	}
}
