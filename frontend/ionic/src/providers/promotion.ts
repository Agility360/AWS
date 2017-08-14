import { Injectable } from '@angular/core';
import { Promotion } from '../shared/promotion';
import { Observable } from 'rxjs/Observable';
import { Http, Response } from '@angular/http';
import { baseURL } from '../shared/baseurl';
import { ProcessHttpmsgProvider } from './process-httpmsg';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

/*
  Generated class for the Promotion provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class PromotionProvider {

  constructor(public http: Http,
    private ProcessHttpmsgService: ProcessHttpmsgProvider) {

    console.log('Hello Promotion Provider');
  }

  getPromotions(): Observable<Promotion[]> {
    return this.http.get(baseURL + 'promotions')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getPromotion(id: number): Observable<Promotion> {
    return this.http.get(baseURL + 'promotion/' + id)
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getFeaturedPromotion(): Observable<Promotion> {
    return this.http.get(baseURL + 'promotions?featured=true')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)[0]})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

}
