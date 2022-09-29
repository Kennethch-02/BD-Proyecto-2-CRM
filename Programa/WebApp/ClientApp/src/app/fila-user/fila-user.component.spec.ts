import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FilaUserComponent } from './fila-user.component';

describe('FilaUserComponent', () => {
  let component: FilaUserComponent;
  let fixture: ComponentFixture<FilaUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FilaUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FilaUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
