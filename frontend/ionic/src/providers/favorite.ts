import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

// added by lawrence
import { Dish } from '../shared/dish';
import { DishProvider } from './dish';
import { Observable } from 'rxjs/Observable';
import { baseURL } from '../shared/baseurl';
import { ProcessHttpmsgProvider } from './process-httpmsg';
import { LocalNotifications} from '@ionic-native/local-notifications';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/catch';


/*
  Generated class for the Favorite provider.

  See https://angular.io/docs/ts/latest/guide/dependency-injection.html
  for more info on providers and Angular DI.
*/
@Injectable()
export class FavoriteProvider {

  favorites: Array<any>;

  constructor(public http: Http,
    private localNotifications: LocalNotifications,
    private dishservice: DishProvider) {

    console.log('Hello Favorite Provider');
    this.favorites = [];

  }

  addFavorite(id: number): boolean {

    if (!this.isFavorite(id)) {
      this.favorites.push(id);

      this.localNotifications.schedule({
        id: id,
        text: 'Dish ' + id + ' added as a favorite'
      });

    }

    return true;
  }

  isFavorite(id: number): boolean {
    return this.favorites.some(el => el === id);
  }

  getFavorites(): Observable<Dish[]> {
    return this.dishservice.getDishes()
      .map(dishes => dishes.filter(dish => this.favorites.some(el => el === dish.id)));
  }

  deleteFavorite(id: number): Observable<Dish[]> {
    let index = this.favorites.indexOf(id);
    if (index >= 0) {
      this.favorites.splice(index,1);
      return this.getFavorites();
    }
    else {
      console.log('Deleting non-existent favorite ', id);
      return Observable.throw('Deleting non-existent favorite ' +id)
    }

  }

}
