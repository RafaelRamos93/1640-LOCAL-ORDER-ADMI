REPO_DIR="C/Citi/RepoPoC-Rafa/1640-LOCAL-ORDER-ADMI"

# Cambia al directorio del repositorio
cd "$REPO_DIR" || exit

# Encuentra todos los archivos sin extensión en el repositorio
for file in $(find . -type f ! -name "*.*"); do
    # Verifica si el archivo es un archivo COBOL
    if file "$file" | grep -q 'COBOL'; then
        # Renombra el archivo para agregar la extensión .cbl
        mv "$file" "$file.cbl"
        echo "Renombrado: $file -> $file.cbl"
    fi
done