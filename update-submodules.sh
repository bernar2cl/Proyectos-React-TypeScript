#!/bin/bash

echo "🔄 Actualizando todos los submódulos y sincronizando con el repositorio principal..."

# Recorre cada submódulo
git submodule foreach '
  echo "📁 Entrando a $name..."
  git add . 
  if ! git diff --cached --quiet; then
    git commit -m "Auto: actualización dentro del submódulo $name"
    git push origin main
  else
    echo "✅ No hay cambios en $name"
  fi
'

# Volver al repo raíz y actualizar las referencias
echo "📦 Actualizando referencias en el repositorio principal..."
git add .
git commit -m "Auto: actualización de referencias de submódulos"
git push origin main

echo "✅ Todo sincronizado correctamente."
