import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit, } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent {
  public listProductos: Productos[] = [];
  public displayedColumns = ['codigo', 'nombre', 'activo', 'descripcion', 'familia', 'precioEstandar'];
  public showData: boolean = false;
  public addData: boolean = false;
  public haveData: boolean = false;
  register: Productos = {
    codigo: "",
    nombre: "",
    activo: 0,
    descripcion: "",
    familia: "",
    precioEstandar: 0
  }
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string, private spinner: NgxSpinnerService) {
    console.log(this.listProductos);
    this.showSpinner()
    http.get<Productos[]>(baseUrl + "api/app/productos").subscribe(result => {
      this.listProductos = result;
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
    console.log(this.register.codigo)
    console.log(this.register.nombre)
    console.log(this.register.activo)
    console.log(this.register.descripcion)
    console.log(this.register.familia)
    console.log(this.register.precioEstandar)
  }
  public reloadPage() {
    window.location.reload();
  }
}
interface Productos {
  codigo: string,
  nombre: string,
  activo: number,
  descripcion: string,
  familia: string,
  precioEstandar: number
}

