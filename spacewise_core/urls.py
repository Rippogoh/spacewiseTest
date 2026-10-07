from django.contrib import admin
from django.urls import path
from gestion import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('catalogo/', views.catalogo, name='catalogo'),
    # Agregamos la ruta del login (NUEVA)
    path('login/', views.login_view, name='login'),
    
    #agregadas recientemente
    path('cliente/', views.cliente, name='cliente'),
    path('cliente/detalle/', views.cliente_detalle, name='clientedetalle'),
    path('panel/', views.panel, name='panel'),
]
