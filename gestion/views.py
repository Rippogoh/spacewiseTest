from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

# 1. Vista del catálogo (la que marcaba error porque faltaba)
def catalogo(request):
    return render(request, 'gestion/catalogo.html')

# 2. Vista del login
def login_view(request):
    # Si el usuario ya inició sesión, enviarlo directo al catálogo
    if request.user.is_authenticated:
        return redirect('catalogo')

    error_message = None

    if request.method == 'POST':
        # Capturamos los datos enviados por el formulario HTML
        usuario = request.POST.get('username')
        contrasena = request.POST.get('password')

        # Verificamos las credenciales
        user = authenticate(request, username=usuario, password=contrasena)

        if user is not None:
            # Si es válido, iniciamos sesión y redirigimos
            login(request, user)
            return redirect('catalogo')
        else:
            error_message = 'Usuario o contraseña incorrectos.'

    return render(request, 'gestion/login.html', {'error': error_message})

# 3. Vista de Clientes
def cliente(request):
    return render(request, 'gestion/cliente.html')

# 4. Vista de Detalle de Cliente
def cliente_detalle(request):
    return render(request, 'gestion/clientedetalle.html')

# 5. Vista del Panel
def panel(request):
    return render(request, 'gestion/panel.html')