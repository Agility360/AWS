import { Component, OnInit, Inject } from '@angular/core';
import { NavController, NavParams, ItemSliding, ToastController, LoadingController, AlertController } from 'ionic-angular';
import { FavoriteProvider } from '../../providers/favorite';
import { Dish } from '../../shared/dish';


/**
 * Generated class for the Favorites page.
 *
 * See http://ionicframework.com/docs/components/#navigation for more info
 * on Ionic pages and navigation.
 */

@Component({
  selector: 'page-favorites',
  templateUrl: 'favorites.html',
})
export class FavoritesPage implements OnInit {

  favorites: Dish[];
  errMess: string;

  constructor(public navCtrl: NavController, public navParams: NavParams,
    private favoriteservice: FavoriteProvider,
    @Inject('BaseURL') private BaseURL,
    private toastCtrl: ToastController,
    private loadingCtrl: LoadingController,
    private alertCtrl: AlertController) {
  }

  ngOnInit() {
    this.favoriteservice.getFavorites()
      .subscribe(favorites => this.favorites = favorites,
        errmess => this.errMess = errmess);

  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Favorites');
  }

  deleteFavorite(item: ItemSliding, id: number) {
    console.log('delete', id);

    let alert = this.alertCtrl.create({
      title: 'Confirm Delete',
      message: 'Delete this dish from Favorites?',
      buttons: [
          {
            text: 'Cancel',
            role: 'cancel',
            handler: () => {
              console.log('Delete cancelled.');
            }
          },
          {
            text: 'Delete',
            handler: () => {
              let loading = this.loadingCtrl.create({
                content: 'Deleting ...'
              });

              let toast = this.toastCtrl.create({
                message: 'Dish deleted.',
                duration: 2000
              });

              loading.present();

              this.favoriteservice.deleteFavorite(id)
                .subscribe(favorites => {this.favorites = favorites; loading.dismiss(); toast.present();},
                  errmess => {this.errMess = errmess; loading.dismiss(); });


            }
          }
      ]
    });

    alert.present();
    // closes SlidingItem buttons
    item.close();

  }

}
