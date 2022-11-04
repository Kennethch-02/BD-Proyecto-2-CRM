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
  public listRols: Rol[] = [];
  public listDepts: Departamento[] = [];
  public columnsUser = ['nombre', 'apellidos', 'cedula', 'rol', 'clave', 'departamento'];
  public columnsRols = ['id', 'tipo'];
  public columnsDepts = ['id', 'nombre'];
  public showData: boolean = false;
  public addData: boolean = false;
  public haveData: boolean = false;
  private http: HttpClient | undefined;
  private baseUrl: string | undefined;
  private sRegisterUser: string | undefined;
  registerUsers: Usuarios = {
    cedula: "",
    nombre: "",
    apellidos: "",
    departamento: 0,
    clave: "",
    rol: 0
  }
  registerRols: Rol = {
    id: 0,
    tipo: ""
  }
  registerDepts: Departamento = {
    id: 0,
    nombre:""
    
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    this.showSpinner();
    this.http = http;
    this.baseUrl = baseUrl;
    http.get<Usuarios[]>(baseUrl + "api/app/usuarios").subscribe(result => {
      this.listUsers = result;
      this.haveData = true;
    }, error => console.error(error));
    http.get<Rol[]>(baseUrl + "api/app/rol").subscribe(result => {
      this.listRols = result;
    }, error => console.error(error));
    http.get<Departamento[]>(baseUrl + "api/app/departamento").subscribe(result => {
      this.listDepts = result;
    }, error => console.error(error));
  }
  showSpinner() {
    this.spinner.show();
    this.pauseSpinner()
  }
  pauseSpinner() {
    if (this.haveData) {
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
  public submitUsers() {
    this.sRegisterUser = "";
    this.sRegisterUser += this.registerUsers.cedula + "/";
    this.sRegisterUser += this.registerUsers.nombre + "/";
    this.sRegisterUser += this.registerUsers.apellidos + "/";
    this.sRegisterUser += this.registerUsers.departamento + "/";
    this.sRegisterUser += this.registerUsers.clave + "/";
    this.sRegisterUser += this.registerUsers.rol + "/";
    this.sRegisterUser += "I";
    console.log(this.sRegisterUser);
    console.log(this.baseUrl + "api/app/usuarioproc/" + this.sRegisterUser);
    this.http?.get<Usuarios>(this.baseUrl + "api/app/usuarioproc/" + this.sRegisterUser).subscribe(result => {
      console.log(result)
    }, error => console.error(error));
  }
  public submitRols() {

  }
  public submitDepts() {

  }
  public reloadPage() {
    window.location.reload();
  }
}
interface Usuarios {
  cedula: string,
  nombre: string,
  apellidos: string,
  departamento: Number,
  clave: string,
  rol:Number
}
interface Rol {
  id: Number,
  tipo: string,
}
interface Departamento {
  id: Number,
  nombre: string,
}
