from django.contrib import admin
from django.urls import path
from gestion import views  # IMPORTANTE: Importamos las vistas de tu app 'gestion'

urlpatterns = [
    path('admin/', admin.site.urls),
    # Agregamos la nueva ruta para el catálogo
    path('catalogo/', views.catalogo, name='catalogo'), 
]