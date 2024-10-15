var alumnos = [];
var notas = [];

function cambiarSeccion(seccion) {
    if (seccion === 'alumnos') {
        document.getElementById('seccionAlumnos').style.display = 'block';
        document.getElementById('seccionNotas').style.display = 'none';
    } else if (seccion === 'notas') {
        document.getElementById('seccionAlumnos').style.display = 'none';
        document.getElementById('seccionNotas').style.display = 'block';
        actualizarSelectAlumnos();
    }
    // Actualizar el estado activo de los botones
    var botones = document.getElementsByClassName('boton-tab');
    for (var i = 0; i < botones.length; i++) {
        botones[i].classList.remove('activo');
    }
    document.querySelector(`button[onclick="cambiarSeccion('${seccion}')"]`).classList.add('activo');
}

function mostrarFormularioAgregar() {
    document.getElementById('formularioAgregar').style.display = 'block';
}

function cerrarFormularioAgregar() {
    document.getElementById('formularioAgregar').style.display = 'none';
}

function agregarAlumno() {
    var nombre = document.getElementById('nombreAlumno').value;
    var grado = document.getElementById('gradoAlumno').value;
    var id = document.getElementById('idAlumno').value;
    var materia = document.getElementById('materiaAlumno').value;

    if (nombre === '' || grado === '' || id === '' || materia === '') {
        alert('Por favor, completa todos los campos.');
        return;
    }

    var nuevoAlumno = {
        foto: 'default.jpg', // Puedes cambiar esto por una ruta válida o permitir que el usuario suba una foto
        nombre: nombre,
        grado: grado,
        id: id,
        materia: materia
    };
    alumnos.push(nuevoAlumno);
    mostrarAlumnos();

    // Limpiar el formulario
    document.getElementById('nombreAlumno').value = '';
    document.getElementById('gradoAlumno').value = '';
    document.getElementById('idAlumno').value = '';
    document.getElementById('materiaAlumno').value = '';
    cerrarFormularioAgregar();
}

function mostrarAlumnos() {
    var lista = document.getElementById('entradasAlumnos');
    lista.innerHTML = '';

    alumnos.forEach(function(alumno, index) {
        var item = document.createElement('div');
        item.classList.add('fila');
        item.innerHTML = `
            <span><img src="${alumno.foto}" alt="Foto"></span>
            <span>${alumno.nombre}</span>
            <span>${alumno.grado}</span>
            <span>${alumno.id}</span>
            <span>${alumno.materia}</span>
            <span>
                <button onclick="editarAlumno(${index})">Editar</button>
                <button class="boton-eliminar" onclick="eliminarAlumno(${index})">Eliminar</button>
            </span>
        `;
        lista.appendChild(item);
    });
}

function buscarAlumno() {
    var filtro = document.getElementById('buscadorAlumnos').value.toLowerCase();
    var lista = document.getElementById('entradasAlumnos').children;

    for (var i = 0; i < lista.length; i++) {
        var nombre = lista[i].children[1].textContent.toLowerCase();
        if (nombre.includes(filtro)) {
            lista[i].style.display = 'flex';
        } else {
            lista[i].style.display = 'none';
        }
    }
}

function eliminarAlumno(index) {
    if (confirm('¿Estás seguro de que deseas eliminar este alumno?')) {
        alumnos.splice(index, 1);
        mostrarAlumnos();
    }
}

function editarAlumno(index) {
    var alumno = alumnos[index];
    mostrarFormularioAgregar();
    document.getElementById('nombreAlumno').value = alumno.nombre;
    document.getElementById('gradoAlumno').value = alumno.grado;
    document.getElementById('idAlumno').value = alumno.id;
    document.getElementById('materiaAlumno').value = alumno.materia;

    // Remover el alumno actual para evitar duplicados al guardar
    alumnos.splice(index, 1);
}

function mostrarFormularioAgregarNota() {
    document.getElementById('formularioAgregarNota').style.display = 'block';
}

function cerrarFormularioAgregarNota() {
    document.getElementById('formularioAgregarNota').style.display = 'none';
}

function actualizarSelectAlumnos() {
    var select = document.getElementById('alumnoNota');
    select.innerHTML = '<option value="">Seleccione Alumno</option>';
    alumnos.forEach(function(alumno, index) {
        var option = document.createElement('option');
        option.value = index;
        option.textContent = alumno.nombre;
        select.appendChild(option);
    });
}

function agregarNota() {
    var indiceAlumno = document.getElementById('alumnoNota').value;
    var materia = document.getElementById('materiaNota').value;
    var notaValor = document.getElementById('notaValor').value;

    if (indiceAlumno === '' || materia === '' || notaValor === '') {
        alert('Por favor, completa todos los campos.');
        return;
    }

    var nuevaNota = {
        alumno: alumnos[indiceAlumno].nombre,
        materia: materia,
        nota: notaValor
    };
    notas.push(nuevaNota);
    mostrarNotas();

    // Limpiar el formulario
    document.getElementById('alumnoNota').value = '';
    document.getElementById('materiaNota').value = '';
    document.getElementById('notaValor').value = '';
    cerrarFormularioAgregarNota();
}

function mostrarNotas() {
    var lista = document.getElementById('entradasNotas');
    lista.innerHTML = '';

    notas.forEach(function(nota, index) {
        var item = document.createElement('div');
        item.classList.add('fila');
        item.innerHTML = `
            <span>${nota.alumno}</span>
            <span>${nota.materia}</span>
            <span>${nota.nota}</span>
            <span>
                <button onclick="editarNota(${index})">Editar</button>
                <button class="boton-eliminar" onclick="eliminarNota(${index})">Eliminar</button>
            </span>
        `;
        lista.appendChild(item);
    });
}

function buscarNota() {
    var filtro = document.getElementById('buscadorNotas').value.toLowerCase();
    var lista = document.getElementById('entradasNotas').children;

    for (var i = 0; i < lista.length; i++) {
        var alumno = lista[i].children[0].textContent.toLowerCase();
        if (alumno.includes(filtro)) {
            lista[i].style.display = 'flex';
        } else {
            lista[i].style.display = 'none';
        }
    }
}

function eliminarNota(index) {
    if (confirm('¿Estás seguro de que deseas eliminar esta nota?')) {
        notas.splice(index, 1);
        mostrarNotas();
    }
}

function editarNota(index) {
    var nota = notas[index];
    mostrarFormularioAgregarNota();
    document.getElementById('alumnoNota').value = alumnos.findIndex(a => a.nombre === nota.alumno);
    document.getElementById('materiaNota').value = nota.materia;
    document.getElementById('notaValor').value = nota.nota;

    // Remover la nota actual para evitar duplicados al guardar
    notas.splice(index, 1);
}

// Inicializa mostrando los alumnos si hay datos
mostrarAlumnos();
mostrarNotas();
