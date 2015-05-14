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
                DamageType(std::string aTypeName, double minimalLethalDamage, double minDamageThreshold, double maxDamageThreshold);
                ~DamageType();

                std::string typeName;
                double minLethalDamage;
                double minDamageThreshold;
                double maxDamageThreshold;

                std::vector<std::shared_ptr<InjuryType>> possibleInjuries;
            };
        }
    }
}
