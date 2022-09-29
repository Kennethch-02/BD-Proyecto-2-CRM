import { Component, Input, OnInit} from '@angular/core';
import { UsuariosComponent } from '../usuarios/usuarios.component';
@Component({
  selector: 'app-fila-user',
  templateUrl: './fila-user.component.html',
  styleUrls: ['./fila-user.component.css']
})
export class FilaUserComponent implements OnInit {
  ngOnInit(): void {
      
  }
  @Input()
  iFila: Usuarios = { cedula: '0', nombre: '0', apellidos: '0', departamento: '0', clave: '0', rol: '0' };
}
interface Usuarios {
  cedula: string,
  nombre: string,
  apellidos: string,
  departamento: string,
  clave: string,
  rol: string
}
