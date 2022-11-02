import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-clientes',
  templateUrl: './clientes.component.html',
  styleUrls: ['./clientes.component.css']
})
export class ClientesComponent{
  public listClientes: Clientes[] = [];
  public displayedColumns = ['nombreDeUsuario', 'correoElectronico', 'contactoPrincipal',
    'moneda', 'telefono', 'celular', 'sitioWeb', 'infoAdicional', 'asesor', 'zonaSector'];
  public showData: boolean = false;
  public addData: boolean = false;
  public haveData: boolean = false;
  register: Clientes = {
    nombreDeUsuario: "",
    correoElectronico: "",
    contactoPrincipal: "",
    moneda: 0,
    telefono: "",
    celular: "",
    sitioWeb: "",
    infoAdicional: "",
    asesor: "",
    zonaSector: 0
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    console.log(this.listClientes);
    this.showSpinner()
    http.get<Clientes[]>(baseUrl + "api/app/clientes").subscribe(result => {
      this.listClientes = result;
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
    console.log(this.register.nombreDeUsuario)
    console.log(this.register.correoElectronico)
    console.log(this.register.contactoPrincipal)
    console.log(this.register.moneda)
    console.log(this.register.telefono)
    console.log(this.register.celular)
    console.log(this.register.sitioWeb)
    console.log(this.register.infoAdicional)
    console.log(this.register.asesor)
    console.log(this.register.zonaSector)
  }
  public reloadPage() {
    window.location.reload();
  }
}
interface Clientes {
  nombreDeUsuario: string,
  correoElectronico: string,
  contactoPrincipal: string,
  moneda: number,
  telefono: string,
  celular: string,
  sitioWeb: string,
  infoAdicional: string,
  asesor: string,
  zonaSector: number
}
