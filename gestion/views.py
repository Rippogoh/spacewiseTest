from django.shortcuts import render

# Creamos la vista para el catálogo
def catalogo(request):
    # Esto le dice a Django que muestre el HTML que guardaste
    return render(request, 'gestion/catalogo.html')