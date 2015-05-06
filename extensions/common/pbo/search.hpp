#pragma once

#include "shared.hpp"
#include "pbo/archive.hpp"

namespace ace { 
    namespace pbo {
        class search {
        public:
            search();

            const std::map<std::string, std::string> & file_index() { return _file_pbo_index; }
            const std::vector<std::string> & active_pbo_list() { return _active_pbo_list;  }
        protected:
            bool index_files();
            bool generate_pbo_list();

            std::map<std::string, std::string> _file_pbo_index;

            std::vector<std::string> _active_pbo_list;
            std::vector<ace::pbo::archive_p> _archives;
        };
        typedef std::shared_ptr<search> search_p;
    }
}