/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { AbmComponent } from './abm.component';

describe('AbmComponent', () => {
  let component: AbmComponent;
  let fixture: ComponentFixture<AbmComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AbmComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AbmComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
