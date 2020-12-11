import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(
    private router: Router,
    private httpClient: HttpClient,
  ) { }

  get(path, params = {}) {
    return this.httpClient
      .get(this.apiUrl(path), this.getOptions(params))
      .toPromise()
      .then(response => this.successResponse(response))
      .catch(response => this.errorResponse(response));
  }

  post(path, params = {}) {
    return this.httpClient
      .post(this.apiUrl(path), params, this.getOptions())
      .toPromise()
      .then(response => this.successResponse(response))
      .catch(response => this.errorResponse(response));
  }

  apiUrl(path) {
    return `api/${path}`;
  }

  private getOptions(params = {}, body = {}) {
    return {
      headers: new HttpHeaders({'Content-Type': 'application/json'}),
      params,
      body
    };
  }

  private successResponse(response) {
    return response;
  }

  private errorResponse(response) {
    throw response.error;
  }

}
