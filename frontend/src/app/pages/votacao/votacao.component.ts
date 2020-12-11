import { Component, OnInit, ViewChild } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import _ from 'lodash';
import { ModalAlertComponent } from 'src/app/components/modal-alert/modal-alert.component';

@Component({
  selector: 'app-votacao',
  templateUrl: './votacao.component.html',
  styleUrls: ['./votacao.component.css']
})
export class VotacaoComponent implements OnInit {

  formUsuario;
  destinos;
  destinosSorteados;
  buscandoDestinos = false;
  etapa = 'iniciarVotacao';
  formSubmitted = false;

  @ViewChild(ModalAlertComponent)
  private modalAlertComponent: ModalAlertComponent;

  constructor(
    private formBuilder: FormBuilder,
    private apiService: ApiService,
    private router: Router
  ) { }

  ngOnInit() {
    this.formUsuario = this.formBuilder.group({
      nome: [null, [Validators.required, Validators.minLength(3), Validators.maxLength(150)]],
      email: [null, [Validators.required, Validators.email]]
    })
  }

  async iniciarVotacao() {
    this.etapa = 'votacaoIniciada';
    this.buscandoDestinos = true;
    this.destinos = await this.apiService.get('destinos');

    this.inicializarDestinos();

    this.buscandoDestinos = false;

    this.sortearDestinos();
  }

  sortearDestinos() {
    this.destinosSorteados = _.sampleSize(this.destinos.filter(destino => !destino.selecionado), 2);
  }

  votar(destino) {
    destino.selecionado = true;

    if (this.destinosSelecionados.length == 3) {
      this.etapa = 'solicitarDadosUsuario'
    } else {
      this.sortearDestinos();
    }
  }

  salvarVotacao() {
    this.formSubmitted = true;

    if (this.formUsuario.valid) {
      this.etapa = 'salvandoVotacao'

      const params = {
        nomeParticipante: this.formUsuario.value.nome,
        emailParticipante: this.formUsuario.value.email,
        destinos: this.destinosSelecionados.map(destino => { return { destinoId: destino.id } })
      }

      this.apiService.post('votos', params).then(_ => {
        this.router.navigate(['ranking'], { state: { emailParticipante: this.formUsuario.value.email} })
      }).catch(error => {
        this.etapa = 'solicitarDadosUsuario'
        this.modalAlertComponent.show(error.error);
      })
    }
  }

  get destinosSelecionados() {
    return this.destinos.filter(destino => destino.selecionado);
  }

  verificaValidTouched(nomeCampo) {
    const campo = this.campoFormUsuario(nomeCampo);
    return campo.invalid && campo.touched;
  }

  campoFormUsuario(nomeCampo) {
    return this.formUsuario.get(nomeCampo);
  }

  cancelar() {
    this.etapa = 'iniciarVotacao';
    this.inicializarDestinos();
    this.formUsuario.reset();
    this.formSubmitted = false;
  }

  inicializarDestinos() {
    this.destinos.forEach(destino => {
      destino.selecionado = false;
    });
  }
}
