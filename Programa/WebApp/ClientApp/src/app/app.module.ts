import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { ClientesComponent } from './clientes/clientes.component';
import { ContactosComponent } from './contactos/contactos.component';
import { CotizacionesComponent } from './cotizaciones/cotizaciones.component';
import { EjecucionComponent } from './ejecucion/ejecucion.component';
import { InicioComponent } from './inicio/inicio.component';
import { ProductosComponent } from './productos/productos.component';
import { RegistroCasosComponent } from './registro-casos/registro-casos.component';
import { UsuariosComponent } from './usuarios/usuarios.component';
@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    ClientesComponent,
    ContactosComponent,
    CotizacionesComponent,
    EjecucionComponent,
    InicioComponent,
    ProductosComponent,
    RegistroCasosComponent,
    UsuariosComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: InicioComponent, pathMatch: 'full' },
      { path: 'Inicio', component: InicioComponent},
      { path: 'Clientes', component: ClientesComponent },
      { path: 'Contactos', component: ContactosComponent },
      { path: 'Cotizaciones', component: CotizacionesComponent },
      { path: 'Ejecucion', component: EjecucionComponent },
      { path: 'Productos', component: ProductosComponent },
      { path: 'Registro-Casos', component: RegistroCasosComponent },
      { path: 'Usuarios', component: UsuariosComponent },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
