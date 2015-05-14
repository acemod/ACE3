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
                DamageType(std::string aTypeName, double minimalLethalDamage, std::vector<double> minDamageThreshold, std::vector<double> amountOfInjuresOnDamage, bool specificOnly);
                ~DamageType();

                std::string typeName;
                double minLethalDamage;
                std::vector<double> minDamageThreshold;
				std::vector<double> amountOfInjuresOnDamage;

				bool selectionSpecific;

                std::vector<std::shared_ptr<InjuryType>> possibleInjuries;
            };
        }
    }
}
