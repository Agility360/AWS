import { Component, OnInit, Inject } from '@angular/core';
import { IonicPage, NavController, NavParams, ToastController } from 'ionic-angular';
import { Dish } from '../../shared/dish';
import { DishProvider } from '../../providers/dish';
import { FavoriteProvider } from '../../providers/favorite';
import { DishdetailPage } from '../../pages/dishdetail/dishdetail';


/**
 * Generated class for the Menu page.
 *
 * See http://ionicframework.com/docs/components/#navigation for more info
 * on Ionic pages and navigation.
 */

@Component({
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage implements OnInit {
  dishes: Dish[];
  errMess: string;

  constructor(public navCtrl: NavController, public navParams: NavParams,
    private dishservice: DishProvider,
   @Inject('BaseURL') private BaseURL,
    private toastCtrl: ToastController,
    private favoriteservice: FavoriteProvider) {
  }

  ngOnInit() {
      this.dishservice.getDishes()
        .subscribe(dishes => this.dishes = dishes,
          errmess => this.errMess = errmess);
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MenuPage');
  }

  dishSelected(event, dish) {
    this.navCtrl.push(DishdetailPage, {
      dish: dish
    });
  }

  addToFavorites(dish: Dish) {
    console.log('Added to favorites', dish.id);
      this.favoriteservice.addFavorite(dish.id);

    this.toastCtrl.create({
      message: 'Dish added to favorites!',
      duration: 3000
    }).present();

  }


}
