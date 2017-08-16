import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import { EmailComposer} from '@ionic-native/email-composer';

/**
 * Generated class for the Contact page.
 *
 * See http://ionicframework.com/docs/components/#navigation for more info
 * on Ionic pages and navigation.
 */

@Component({
  selector: 'page-contact',
  templateUrl: 'contact.html',
})
export class ContactPage {

  constructor(public navCtrl: NavController,
      private emailComposer: EmailComposer,
      public navParams: NavParams) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad Contact');
  }

  sendEmail() {
    let email = {
      to: 'confusion@food.net',
      subject: '[ConFusion] Question',
      body: 'Dear purveyer of fine food, ',
      isHtml: true
    }

    this.emailComposer.open(email);
    
  }

}
