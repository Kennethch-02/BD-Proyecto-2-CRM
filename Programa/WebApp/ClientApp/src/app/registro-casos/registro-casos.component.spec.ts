import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroCasosComponent } from './registro-casos.component';

describe('RegistroCasosComponent', () => {
  let component: RegistroCasosComponent;
  let fixture: ComponentFixture<RegistroCasosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RegistroCasosComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegistroCasosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
