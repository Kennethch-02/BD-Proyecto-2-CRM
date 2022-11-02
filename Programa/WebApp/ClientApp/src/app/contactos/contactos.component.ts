import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-contactos',
  templateUrl: './contactos.component.html',
  styleUrls: ['./contactos.component.css']
})
export class ContactosComponent {
  public listContactos: Contactos[] = [];
  public displayedColumns = ['cliente', 'tipo', 'motivo', 'nombre', 'telefono', 'correoElectronico',
    'estado', 'direccion', 'zonaSector', 'asesor', 'descripcion', 'idModulo'];
  public showData: boolean = false;
  public addData: boolean = false;
  public haveData: boolean = false;
  register: Contactos = {
    cliente: "",
    tipo: 0,
    motivo: "",
    nombre: "",
    telefono: "",
    correoElectronico: "",
    estado: 0,
    direccion: "",
    zonaSector: 0,
    asesor: 0,
    descripcion: "",
    idModulo: 0
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    console.log(this.listContactos);
    this.showSpinner()
    http.get<Contactos[]>(baseUrl + "api/app/contactos").subscribe(result => {
      this.listContactos = result;
      this.haveData = true;
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
  public submit() {
    console.log(this.register.cliente)
    console.log(this.register.tipo)
    console.log(this.register.motivo)
    console.log(this.register.nombre)
    console.log(this.register.telefono)
    console.log(this.register.correoElectronico)
    console.log(this.register.estado)
    console.log(this.register.direccion)
    console.log(this.register.zonaSector)
    console.log(this.register.asesor)
    console.log(this.register.descripcion)
    console.log(this.register.idModulo)
  }
  public reloadPage() {
    window.location.reload();
  }
}
interface Contactos {
  cliente: string,
  tipo: number,
  motivo: string,
  nombre: string,
  telefono: string,
  correoElectronico: string,
  estado: number,
  direccion: string,
  zonaSector: number,
  asesor: number,
  descripcion: string,
  idModulo: number
}

