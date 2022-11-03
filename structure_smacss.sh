#!bin/bash
#
# Script que genera la arquitectura SMACSS, para SASS
# Autor : Jmrx
# Version : 1.0
#

# Carpetas y archivos de la arquitectura SMACSS
function proyectCreate() {
    read -p "Nombre del proyecto : " name
    mkdir $name
    cd $name

    mkdir {abstracts,base,components,layout,pages,public,themes,vendors}

    cd public
    mkdir {js,css,media,fonts}
    touch index.html

    cd ../base
    touch _reset.scss _typography.scss

    cd ../components
    touch _buttons.scss _carousel.scss _cover.scss

    cd ../layout
    touch _navigation.scss _grid.scss _header.scss _footer.scss _sidebar.scss _forms.scss

    cd ../pages
    touch _home.scss _contact.scss

    cd ../themes
    touch _theme.scss _dark.scss

    cd ../abstracts
    touch _variables.scss _functions.scss _mixins.scss _helpers.scss _placeholders.scss

    cd ../vendors

    touch _bootstrap.scss _jquery-ui.scss

    cd ../
    import
    readme

}
# Archivo Principal
# Este archivo tiene todo el codigo, mediante el @import
function import() {
    echo "
    @import 'abstracts/variables';
    @import 'abstracts/functions';
    @import 'abstracts/mixins';
    @import 'abstracts/placeholders';

    @import 'vendors/bootstrap';
    @import 'vendors/jquery-ui';

    @import 'base/reset';
    @import 'base/typography';

    @import 'layout/navigation';
    @import 'layout/grid';
    @import 'layout/header';
    @import 'layout/footer';
    @import 'layout/sidebar';
    @import 'layout/forms';

    @import 'components/buttons';
    @import 'components/carousel';
    @import 'components/cover';
    @import 'components/dropdown';

    @import 'pages/home';
    @import 'pages/contact';

    @import 'themes/theme';
    @import 'themes/dark';" >>main.scss
}

# Guia donde debes poner el codigo scss
function readme() {
    echo "
    Guia donde debe ir el codigo

    --> base/
         _reset.scss       # Reset
         _typography.scss  # Reglas tipográficas
                          
    
    --> components/
         _buttons.scss     # Botones
         _carousel.scss    # Carousel
         _cover.scss       # Cubierta
    
       
    
    --> layout/
         _navigation.scss  # Navegación
         _grid.scss        # Grillas de CSS
         _header.scss      # Encabezamiento
         _footer.scss      # Pie de página
         _sidebar.scss     # Barra lateral
         _forms.scss       # Formularios
       
    
    --> pages/
         _home.scss        # Estilos  para la página de inicio
         _contact.scss     # Estilos  para la página de contacto
       
    
    --> themes/
         _theme.scss       # Tema por defecto
         _admin.scss       # Tema dark
     
    
    --> utils/
         _variables.scss   # Variables Sass
         _functions.scss   # Funciones Sass
         _mixins.scss      # Mixins Sass
         _helpers.scss     # Clases & placeholders
    
    --> vendors/
         _bootstrap.scss   # Bootstrap
         _jquery-ui.scss   # jQuery UI
      
     
       main.scss           # Archivo principal de Sass

    " >>readme.md
}

# Main
proyectCreate

echo "Done!"
exit 0
