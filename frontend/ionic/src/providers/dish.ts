import { Injectable } from '@angular/core';
import { Dish } from '../shared/dish';
import { Observable } from 'rxjs/Observable';
import { Http, Response } from '@angular/http';
import { baseURL } from '../shared/baseurl';
import { ProcessHttpmsgProvider } from './process-httpmsg';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

/*
  Generated class for the Dish provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class DishProvider {

  constructor(public http: Http,
    private ProcessHttpmsgService: ProcessHttpmsgProvider) {

    console.log('Hello Dish Provider');
  }

  getDishes(): Observable<Dish[]> {
    return this.http.get(baseURL + 'dishes')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getDish(id: number): Observable<Dish> {
    return this.http.get(baseURL + 'dish/' + id)
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getFeaturedDish(): Observable<Dish> {
    return this.http.get(baseURL + 'dishes?featured=true')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)[0]})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

}
