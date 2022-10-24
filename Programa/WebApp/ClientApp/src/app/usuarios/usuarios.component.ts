import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent{
  public listUsers: Usuarios[] = [];
  public displayedColumns = ['nombre', 'apellidos', 'cedula', 'rol', 'clave', 'departamento'];
  public showData: boolean = false;
  public addData: boolean = false;
  register: Usuarios = {
    cedula: "",
    nombre: "",
    apellidos: "",
    departamento: "",
    clave: "",
    rol: ""
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    console.log(this.listUsers);
    this.showSpinner()
    http.get<Usuarios[]>(baseUrl + "api/app/usuarios").subscribe(result => {
      this.listUsers = result;
    }, error => console.error(error));
  }
  showSpinner() {
    this.spinner.show();
    this.pauseSpinner()
    
  }
  pauseSpinner() {
    if (this.listUsers.length > 0) {
      this.spinner.hide();
    } else {
      setTimeout(() => {
        this.pauseSpinner();
      }, 50);
    }
  }
  public ShowData() {
    this.showData = !this.showData;
  }
  public AddData() {
    this.addData = !this.addData;
  }
  public submit() {
    console.log(this.register.cedula)
    console.log(this.register.nombre)
    console.log(this.register.apellidos)
    console.log(this.register.departamento)
    console.log(this.register.clave)
    console.log(this.register.rol)
  }
  public reloadPage() {
    window.location.reload();
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
