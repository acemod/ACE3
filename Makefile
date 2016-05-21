VERSION = 3.5.1
BIN = @ace
CBA = tools/cba
FLAGS = -i $(CBA) -w unquoted-string

$(BIN)/addons/ace_%.pbo: addons/%
	@mkdir -p $(BIN)/addons
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

$(BIN)/optionals/ace_%.pbo: optionals/%
	@mkdir -p $(BIN)/optionals
	@echo "  PBO  $@"
	@armake build ${FLAGS} -f $< $@

# This is a shortcut for building single addons, so you can just call "make medical.pbo"
%.pbo:
	make $(patsubst %, $(BIN)/addons/ace_%, $@)

all: $(patsubst addons/%, $(BIN)/addons/ace_%.pbo, $(wildcard addons/*)) \
		$(patsubst optionals/%, $(BIN)/optionals/ace_%.pbo, $(wildcard optionals/*))

$(BIN)/keys/%.biprivatekey:
	@mkdir -p $(BIN)/keys
	@echo "  KEY  $@"
	@armake keygen -f $(patsubst $(BIN)/keys/%.biprivatekey, $(BIN)/keys/%, $@)

$(BIN)/addons/ace_%.pbo.ace_$(VERSION).bisign: $(BIN)/addons/ace_%.pbo $(BIN)/keys/ace_$(VERSION).biprivatekey
	@echo "  SIG  $@"
	@armake sign -f $(BIN)/keys/ace_$(VERSION).biprivatekey $<

$(BIN)/optionals/ace_%.pbo.ace_$(VERSION).bisign: $(BIN)/optionals/ace_%.pbo $(BIN)/keys/ace_$(VERSION).biprivatekey
	@echo "  SIG  $@"
	@armake sign -f $(BIN)/keys/ace_$(VERSION).biprivatekey $<

signatures: $(patsubst addons/%, $(BIN)/addons/ace_%.pbo.ace_$(VERSION).bisign, $(wildcard addons/*)) \
		$(patsubst optionals/%, $(BIN)/optionals/ace_%.pbo.ace_$(VERSION).bisign, $(wildcard optionals/*))

extensions: $(wildcard extensions/*/*)
	cd extensions/build && cmake .. && make
	find ./extensions/build/ \( -name "*.so" -o -name "*.dll" \) -exec cp {} ./ \;

extensions-win64: $(wildcard extensions/*/*)
	cd extensions/build && CXX=$(eval $(which g++-w64-mingw-i686)) cmake .. && make

clean:
	rm -rf $(BIN) ace3_*.zip

release: clean signatures
	@rm $(BIN)/keys/*.biprivatekey
	@echo "  ZIP  ace3_$(VERSION).zip"
	@cp *.dll LICENSE README.md AUTHORS.txt logo_ace3_ca.paa mod.cpp meta.cpp $(BIN)
	@zip -r ace3_$(VERSION).zip @ace &> /dev/null
