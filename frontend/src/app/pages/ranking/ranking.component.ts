import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { ModalAlertComponent } from 'src/app/components/modal-alert/modal-alert.component';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-ranking',
  templateUrl: './ranking.component.html',
  styleUrls: ['./ranking.component.css']
})
export class RankingComponent implements OnInit {

  votos;
  votosParticipante;
  formPesquisa;
  pesquisando = false;

  @ViewChild(ModalAlertComponent)
  private modalAlertComponent: ModalAlertComponent;

  constructor(
    private formBuilder: FormBuilder,
    private apiService: ApiService
  ) { }

  ngOnInit() {
    this.formPesquisa = this.formBuilder.group({
      email: [history.state.emailParticipante || null]
    })

    const params = {}
    if (history.state.emailParticipante) {
      params['emailParticipante'] = history.state.emailParticipante
    }

    this.pesquisar(params);
  }

  pesquisar(params) {
    this.pesquisando = true;
    this.apiService.get('votos', params).then(votos => {
      this.votos = votos.votos;
      this.votosParticipante = votos.votosParticipante;
      this.pesquisando = false;
    }).catch(error => {
      this.pesquisando = false;
      this.modalAlertComponent.show(error.error);
    });
  }

}
