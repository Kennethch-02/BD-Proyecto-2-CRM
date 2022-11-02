import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-cotizaciones',
  templateUrl: './cotizaciones.component.html',
  styleUrls: ['./cotizaciones.component.css']
})
export class CotizacionesComponent {
  public listCotizaciones: Cotizaciones[] = [];
  public displayedColumns = ['numero', 'nombreOportunidad', 'fecha', 'nombreCuenta', 'mesAnnoProyectado',
    'correoElectronico', 'asesor', 'fechaCierre', 'etapa', 'moneda', 'probabilidad', 'ordenCompra',
    'tipo', 'descripcion', 'zonaSector', 'contacto', 'numeroFactura', 'estado', 'inflacion'];
  public showData: boolean = false;
  public addData: boolean = false;
  public haveData: boolean = false;
  register: Cotizaciones = {
    numero: "",
    nombreOportunidad: "",
    fecha: "",
    nombreCuenta: "",
    mesAnnoProyectado: "",
    asesor: 0,
    fechaCierre: "",
    etapa: 0,
    moneda: 0,
    probabilidad: 0,
    ordenCompra: "",
    tipo: 0,
    descripcion: "",
    zonaSector: 0,
    contacto: "",
    numeroFactura: "",
    estado: 0,
    inflacion: 0
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    console.log(this.listCotizaciones);
    this.showSpinner()
    http.get<Cotizaciones[]>(baseUrl + "api/app/cotizaciones").subscribe(result => {
      this.listCotizaciones = result;
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
    console.log(this.register.numero)
    console.log(this.register.nombreOportunidad)
    console.log(this.register.fecha)
    console.log(this.register.nombreCuenta)
    console.log(this.register.mesAnnoProyectado)
    console.log(this.register.asesor)
    console.log(this.register.fechaCierre)
    console.log(this.register.etapa)
    console.log(this.register.moneda)
    console.log(this.register.probabilidad)
    console.log(this.register.ordenCompra)
    console.log(this.register.tipo)
    console.log(this.register.descripcion)
    console.log(this.register.zonaSector)
    console.log(this.register.contacto)
    console.log(this.register.numeroFactura)
    console.log(this.register.estado)
    console.log(this.register.inflacion)
  }
  public reloadPage() {
    window.location.reload();
  }
}
interface Cotizaciones {
  numero: string,
  nombreOportunidad: string,
  fecha: string,
  nombreCuenta: string,
  mesAnnoProyectado: string,
  asesor: number,
  fechaCierre: string,
  etapa: number,
  moneda: number,
  probabilidad: number,
  ordenCompra: string,
  tipo: number,
  descripcion: string,
  zonaSector: number,
  contacto: string,
  numeroFactura: string,
  estado: number,
  inflacion: number
}


