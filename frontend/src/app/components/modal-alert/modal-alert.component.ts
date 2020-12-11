import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-modal-alert',
  templateUrl: './modal-alert.component.html',
  styleUrls: ['./modal-alert.component.css']
})
export class ModalAlertComponent implements OnInit {

  visivel = false;
  fadeShow = false;
  texto;

  constructor() { }

  ngOnInit(): void {
  }

  show(texto) {
    this.texto = texto;
    this.visivel = true;
    setTimeout(() => this.fadeShow = true, 50);
  }

  hide() {
    this.fadeShow = false;
    setTimeout(() => this.visivel = false, 150);
  }

}
