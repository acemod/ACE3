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
			/**
			*
			*/
			static handleDamage& GetInstance();

            ~handleDamage();

            /**
            *
            */
            std::vector<ace::medical::injuries::OpenWound> HandleDamageWounds(const std::string& selectionName, double amountOfDamage, const std::string& typeOfDamage);

			std::vector<ace::medical::injuries::OpenWound> GetInjuryInfoFor(const std::string& typeOfDamage, double amountOfDamage, int selection);

            /**
            *
            */
            void AddDamageType(const std::vector<std::string>& sqfDamageTypeDefinition);

            /**
            *
            */
            void AddInjuryType(const std::vector<std::string>& sqfInjuryDefinition);

            /**
            *
            */
            //static std::string SetInjuryTypeData(const std::string& data);


            /**
            *
            */
            int SelectionToNumber(const std::string& selectionName);

            /**
            *
            */
            //static std::vector<std::shared_ptr<ace::medical::injuries::InjuryType>> GetInjuryInfoFor(const std::string& damageType);

            /**
            *
            */
            void FinalizeDefinitions();

        private:
            handleDamage();
			
			handleDamage(handleDamage const&) = delete;
			void operator=(handleDamage const&) = delete;

            std::vector<std::shared_ptr<ace::medical::injuries::DamageType>> damageTypes;
            std::vector<std::shared_ptr<ace::medical::injuries::InjuryType>> injuryTypes;
            std::vector<std::string> selections;
            std::vector<std::string> hitPoints;
        };
    }
}
