# Comando do compilador Java
JAVAC=javac

# Comando da JVM
JAVA=java

# Caminho para o JAR do ANTLR em tools/
ANTLR_PATH=$(CURDIR)/tools/antlr-4.13.2-complete.jar

# Opção de configuração do CLASSPATH para o ambiente Java
CLASS_PATH_OPTION=-cp .:$(ANTLR_PATH)

# Configuração do comando de compilação do ANTLR
ANTLR4=$(JAVA) -jar $(ANTLR_PATH)

# Configuração do ambiente de teste do ANTLR
GRUN=$(JAVA) $(CLASS_PATH_OPTION) org.antlr.v4.gui.TestRig

# Nome da gramática
GRAMMAR_NAME=Runner

# Arquivo da gramática
GRAMMAR_FILE=Runner.g

# Diretório para aonde vão os arquivos gerados
GEN_PATH=parser

# URL de download do JAR do ANTLR
ANTLR_URL=https://www.antlr.org/download/antlr-4.13.2-complete.jar

# Baixa o ANTLR e salva em tools/
setup: $(ANTLR_PATH)
	@echo "ANTLR pronto em $(ANTLR_PATH)"

$(ANTLR_PATH):
	@mkdir -p tools
	@echo "Baixando ANTLR..."
	@curl -L -o $(ANTLR_PATH) $(ANTLR_URL)

# Executa o ANTLR e o compilador Java
all: setup antlr javac
	@echo "Done."

# Executa o ANTLR para compilar a gramática
antlr: $(GRAMMAR_FILE)
	@mkdir -p $(GEN_PATH)
	$(ANTLR4) -no-listener -o $(GEN_PATH) $(GRAMMAR_FILE)

# Executa o javac para compilar os arquivos gerados
javac:
	$(JAVAC) $(CLASS_PATH_OPTION) $(GEN_PATH)/*.java


run:
	cd $(GEN_PATH) && $(GRUN) $(GRAMMAR_NAME) program $(FILE) -gui

# Remove os arquivos gerados pelo ANTLR
clean:
	@rm -rf $(GEN_PATH)