#pragma once

#include "shared.hpp"

namespace ace { 
    namespace pbo {
        class ext_entry {
        public:
            ext_entry();
            ext_entry(std::istream &);

            std::string name;
            std::string data;
            std::string version;

            std::vector<std::string> extras;
        };
        typedef std::shared_ptr<ext_entry> ext_entry_p;

        class entry {
        public:
            entry();
            entry(std::istream &);
 
            std::string filename;

            uint32_t    compression;
            uint32_t    size;
            uint32_t    storage_size;
            uint32_t    offset;         // pre-computed during search, offset of file

            uint32_t    reserved;
            uint32_t    timestamp;
        };
        typedef std::shared_ptr<entry> entry_p;

        class file {
        public:
            entry_p     entry;
            uint8_t     *data;
            uint32_t    size;
        };
        typedef std::shared_ptr<file> file_p;

        class archive {
        public:
            archive();
            archive(std::istream &);
            ~archive();

            bool      get_file(std::istream &, const std::string & file, file_p output);
            bool      get_file(std::istream &, const entry_p entry, file_p output);

            uint32_t                begin_data_offset;

            ext_entry_p             info;
            std::vector<entry_p>    entries;
        };
        typedef std::shared_ptr<archive> archive_p;
    } 
}
