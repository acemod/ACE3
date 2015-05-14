#pragma once

#include <string>
#include <vector>
#include <memory>

namespace ace {
    namespace medical {

        namespace injuries {
            class DamageType;
            class InjuryType;
            class OpenWound;
        }

        class handleDamage
        {
        public:
            ~handleDamage();

            /**
            *
            */
            static std::vector<injuries::OpenWound> HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage);

            /**
            *
            */
            static void AddDamageType(const std::vector<std::string>& sqfDamageTypeDefinition);

            /**
            *
            */
            static void AddInjuryType(const std::vector<std::string>& sqfInjuryDefinition);

            /**
            *
            */
            static std::string SetInjuryTypeData(const std::string& data);


            /**
            *
            */
            static int SelectionToNumber(const std::string& selectionName);

            /**
            *
            */
            static std::vector<std::shared_ptr<injuries::InjuryType>> GetInjuryInfoFor(const std::string& damageType);

            /**
            *
            */
            static void FinalizeDefinitions();

        private:
            handleDamage();
            
            static std::vector<std::shared_ptr<injuries::DamageType>> damageTypes;
            static std::vector<std::shared_ptr<injuries::InjuryType>> injuryTypes;
            static std::vector<std::string> selections;
            static std::vector<std::string> hitPoints;
        };
    }
}
