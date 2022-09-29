import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit,} from '@angular/core';
@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent{
  public listUsers: Usuarios[] = [];
  public displayedColumns = ['nombre','apellidos','cedula', 'rol',  'clave','departamento'];
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string) {
    http.get<Usuarios[]>(baseUrl + "api/app/usuarios").subscribe(result => {
      this.listUsers = result;
      console.log(this.listUsers);
    }, error => console.error(error));
  }
}
interface Usuarios {
  cedula: string,
  nombre: string,
  apellidos: string,
  departamento: string,
  clave: string,
  rol:string
}
