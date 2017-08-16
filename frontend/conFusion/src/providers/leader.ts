import { Injectable } from '@angular/core';
import { Leader } from '../shared/leader';
import { Observable } from 'rxjs/Observable';
import { Http, Response } from '@angular/http';
import { baseURL } from '../shared/baseurl';
import { ProcessHttpmsgProvider } from './process-httpmsg';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';


/*
  Generated class for the Leader provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class LeaderProvider {

  constructor(public http: Http,
    private ProcessHttpmsgService: ProcessHttpmsgProvider) {

    console.log('Hello Leader Provider');
  }

  getLeaders(): Observable<Leader[]> {
    return this.http.get(baseURL + 'leaders')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getLeader(id: number): Observable<Leader> {
    return this.http.get(baseURL + 'leader/' + id)
      .map(res => {return this.ProcessHttpmsgService.extactData(res)})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

  getFeaturedLeader(): Observable<Leader> {
    return this.http.get(baseURL + 'leaders?featured=true')
      .map(res => {return this.ProcessHttpmsgService.extactData(res)[0]})
      .catch(error => {return this.ProcessHttpmsgService.handleError(error)});
  }

}
