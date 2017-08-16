webpackJsonp([0],{

/***/ 102:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return TabsPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__settings_settings__ = __webpack_require__(197);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__tasks_tasks__ = __webpack_require__(203);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var TabsPage = (function () {
    function TabsPage() {
        this.tab1Root = __WEBPACK_IMPORTED_MODULE_2__tasks_tasks__["a" /* TasksPage */];
        this.tab2Root = __WEBPACK_IMPORTED_MODULE_1__settings_settings__["a" /* SettingsPage */];
    }
    return TabsPage;
}());
TabsPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tabs/tabs.html"*/'<ion-tabs>\n  <ion-tab [root]="tab1Root" tabTitle="Tasks" tabIcon="list"></ion-tab>\n  <ion-tab [root]="tab2Root" tabTitle="Settings" tabIcon="cog"></ion-tab>\n</ion-tabs>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tabs/tabs.html"*/
    }),
    __metadata("design:paramtypes", [])
], TabsPage);

//# sourceMappingURL=tabs.js.map

/***/ }),

/***/ 103:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ConfirmPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__login_login__ = __webpack_require__(39);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__providers_user__ = __webpack_require__(40);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var ConfirmPage = (function () {
    function ConfirmPage(navCtrl, navParams, user) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.user = user;
        this.username = navParams.get('username');
    }
    ConfirmPage.prototype.confirm = function () {
        var _this = this;
        this.user.confirmRegistration(this.username, this.code).then(function () {
            _this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_2__login_login__["a" /* LoginPage */]);
        });
    };
    ConfirmPage.prototype.resendCode = function () {
        this.user.resendRegistrationCode(this.username);
    };
    return ConfirmPage;
}());
ConfirmPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-confirm',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/confirm/confirm.html"*/'<ion-content>\n  <div padding>\n    <p>Please enter the confirmation code sent to your email to verify your account:</p>\n  </div>\n  <form (submit)="confirm()">\n    <ion-list>\n\n      <ion-item>\n        <ion-label floating>Confirmation Code</ion-label>\n        <ion-input type="text" [(ngModel)]="code" name="code"></ion-input>\n      </ion-item>\n\n      <div padding>\n        <button ion-button color="primary" block>Confirm Account</button>\n      </div>\n\n      <div padding>\n        <p>Haven\'t received the confirmation code email yet? <a (click)="resendCode()">Resend</a></p>\n      </div>\n\n    </ion-list>\n  </form>\n</ion-content>  \n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/confirm/confirm.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavParams */], __WEBPACK_IMPORTED_MODULE_3__providers_user__["a" /* User */]])
], ConfirmPage);

//# sourceMappingURL=confirm.js.map

/***/ }),

/***/ 112:
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncatched exception popping up in devtools
	return Promise.resolve().then(function() {
		throw new Error("Cannot find module '" + req + "'.");
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = 112;

/***/ }),

/***/ 153:
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncatched exception popping up in devtools
	return Promise.resolve().then(function() {
		throw new Error("Cannot find module '" + req + "'.");
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = 153;

/***/ }),

/***/ 197:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SettingsPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__login_login__ = __webpack_require__(39);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__about_about__ = __webpack_require__(201);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__account_account__ = __webpack_require__(202);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__providers_providers__ = __webpack_require__(41);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var SettingsPage = (function () {
    function SettingsPage(user, app) {
        this.user = user;
        this.app = app;
        this.aboutPage = __WEBPACK_IMPORTED_MODULE_3__about_about__["a" /* AboutPage */];
        this.accountPage = __WEBPACK_IMPORTED_MODULE_4__account_account__["a" /* AccountPage */];
    }
    SettingsPage.prototype.logout = function () {
        this.user.logout();
        this.app.getRootNav().setRoot(__WEBPACK_IMPORTED_MODULE_2__login_login__["a" /* LoginPage */]);
    };
    return SettingsPage;
}());
SettingsPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/settings/settings.html"*/'<ion-header>\n  <ion-navbar>\n    <ion-title>\n      Settings\n    </ion-title>\n  </ion-navbar>\n</ion-header>\n\n<ion-content>\n    <ion-list>\n      <button ion-item [navPush]="aboutPage">\n        About this app\n      </button>\n      <button ion-item [navPush]="accountPage">\n        Account\n      </button>\n      <button ion-item (click)="logout()">\n        <ion-label color="danger">Logout</ion-label>\n      </button>\n    </ion-list>\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/settings/settings.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_5__providers_providers__["c" /* User */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["a" /* App */]])
], SettingsPage);

//# sourceMappingURL=settings.js.map

/***/ }),

/***/ 198:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* unused harmony export UserDetails */
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SignupPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__login_login__ = __webpack_require__(39);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__confirm_confirm__ = __webpack_require__(103);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__providers_user__ = __webpack_require__(40);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var UserDetails = (function () {
    function UserDetails() {
    }
    return UserDetails;
}());

var SignupPage = (function () {
    function SignupPage(navCtrl, user, loadingCtrl) {
        this.navCtrl = navCtrl;
        this.user = user;
        this.loadingCtrl = loadingCtrl;
        this.userDetails = new UserDetails();
    }
    SignupPage.prototype.signup = function () {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Please wait...'
        });
        loading.present();
        var details = this.userDetails;
        this.error = null;
        console.log('register');
        this.user.register(details.username, details.password, { 'email': details.email }).then(function (user) {
            loading.dismiss();
            _this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_3__confirm_confirm__["a" /* ConfirmPage */], { username: details.username });
        }).catch(function (err) {
            loading.dismiss();
            _this.error = err;
        });
    };
    SignupPage.prototype.login = function () {
        this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_2__login_login__["a" /* LoginPage */]);
    };
    return SignupPage;
}());
SignupPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-signup',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/signup/signup.html"*/'<ion-content>\n  <div text-center class="logo">\n    <img src="assets/ionic-aws-logo.png" />\n  </div>\n  <form (submit)="signup()">\n    <p *ngIf="error" style="text-align: center">{{error.message}}</p>\n    <ion-list>\n\n      <ion-item>\n        <ion-label floating>Username</ion-label>\n        <ion-input type="text" [(ngModel)]="userDetails.username" autocorrect="off" autocapitalize="none" name="username"></ion-input>\n      </ion-item>\n\n      <ion-item>\n        <ion-label floating>Email</ion-label>\n        <ion-input type="email" [(ngModel)]="userDetails.email" name="email"></ion-input>\n      </ion-item>\n\n      <ion-item>\n        <ion-label floating>Password</ion-label>\n        <ion-input type="password" [(ngModel)]="userDetails.password" name="password"></ion-input>\n      </ion-item>\n\n      <div padding>\n        <button ion-button color="primary" block>Register</button>\n      </div>\n\n      <div padding text-center>\n        <p><a (click)="login()">Return to login</a>\n      </div>\n\n    </ion-list>\n  </form>\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/signup/signup.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */],
        __WEBPACK_IMPORTED_MODULE_4__providers_user__["a" /* User */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */]])
], SignupPage);

//# sourceMappingURL=signup.js.map

/***/ }),

/***/ 199:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return Cognito; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var Cognito = (function () {
    function Cognito(config) {
        this.config = config;
        AWSCognito.config.region = aws_cognito_region;
        AWSCognito.config.credentials = new AWS.CognitoIdentityCredentials({
            IdentityPoolId: aws_cognito_identity_pool_id
        });
        AWSCognito.config.update({ customUserAgent: AWS.config.customUserAgent });
    }
    Cognito.prototype.getUserPool = function () {
        return new AWSCognito.CognitoIdentityServiceProvider.CognitoUserPool({
            "UserPoolId": aws_user_pools_id,
            "ClientId": aws_user_pools_web_client_id
        });
    };
    Cognito.prototype.getCurrentUser = function () {
        return this.getUserPool().getCurrentUser();
    };
    Cognito.prototype.makeAuthDetails = function (username, password) {
        return new AWSCognito.CognitoIdentityServiceProvider.AuthenticationDetails({
            'Username': username,
            'Password': password
        });
    };
    Cognito.prototype.makeAttribute = function (name, value) {
        return new AWSCognito.CognitoIdentityServiceProvider.CognitoUserAttribute({
            'Name': name,
            'Value': value
        });
    };
    Cognito.prototype.makeUser = function (username) {
        return new AWSCognito.CognitoIdentityServiceProvider.CognitoUser({
            'Username': username,
            'Pool': this.getUserPool()
        });
    };
    return Cognito;
}());
Cognito = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Injectable */])(),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["b" /* Config */]])
], Cognito);

//# sourceMappingURL=aws.cognito.js.map

/***/ }),

/***/ 200:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DynamoDB; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var DynamoDB = (function () {
    function DynamoDB() {
        this.documentClient = new AWS.DynamoDB.DocumentClient();
    }
    DynamoDB.prototype.getDocumentClient = function () {
        return this.documentClient;
    };
    return DynamoDB;
}());
DynamoDB = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Injectable */])(),
    __metadata("design:paramtypes", [])
], DynamoDB);

//# sourceMappingURL=aws.dynamodb.js.map

/***/ }),

/***/ 201:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AboutPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var AboutPage = (function () {
    function AboutPage() {
    }
    return AboutPage;
}());
AboutPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-about',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/about/about.html"*/'<ion-header>\n  <ion-navbar>\n    <ion-title>\n      About\n    </ion-title>\n  </ion-navbar>\n</ion-header>\n\n<ion-content padding>\n\n  This is a starter project that leverages AWS Mobile Hub services to power the app. The\n  following services are utilized:\n\n  <ul>\n    <li>Cognito (Authentication)</li>\n    <li>DynamoDB (Data Storage)</li>\n    <li>S3 (File Storage)</li>\n  </ul>\n\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/about/about.html"*/
    }),
    __metadata("design:paramtypes", [])
], AboutPage);

//# sourceMappingURL=about.js.map

/***/ }),

/***/ 202:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AccountPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_native_camera__ = __webpack_require__(193);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__providers_providers__ = __webpack_require__(41);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var AccountPage = (function () {
    function AccountPage(navCtrl, user, db, config, camera, loadingCtrl) {
        var _this = this;
        this.navCtrl = navCtrl;
        this.user = user;
        this.db = db;
        this.config = config;
        this.camera = camera;
        this.loadingCtrl = loadingCtrl;
        this.sub = null;
        this.attributes = [];
        this.avatarPhoto = null;
        this.selectedPhoto = null;
        this.s3 = new AWS.S3({
            'params': {
                'Bucket': aws_user_files_s3_bucket
            },
            'region': aws_user_files_s3_bucket_region
        });
        this.sub = AWS.config.credentials.identityId;
        user.getUser().getUserAttributes(function (err, data) {
            _this.attributes = data;
            _this.refreshAvatar();
        });
    }
    AccountPage.prototype.refreshAvatar = function () {
        var _this = this;
        this.s3.getSignedUrl('getObject', { 'Key': 'protected/' + this.sub + '/avatar' }, function (err, url) {
            _this.avatarPhoto = url;
        });
    };
    AccountPage.prototype.dataURItoBlob = function (dataURI) {
        // code adapted from: http://stackoverflow.com/questions/33486352/cant-upload-image-to-aws-s3-from-ionic-camera
        var binary = atob(dataURI.split(',')[1]);
        var array = [];
        for (var i = 0; i < binary.length; i++) {
            array.push(binary.charCodeAt(i));
        }
        return new Blob([new Uint8Array(array)], { type: 'image/jpeg' });
    };
    ;
    AccountPage.prototype.selectAvatar = function () {
        var _this = this;
        var options = {
            quality: 100,
            targetHeight: 200,
            targetWidth: 200,
            destinationType: this.camera.DestinationType.DATA_URL,
            encodingType: this.camera.EncodingType.JPEG,
            mediaType: this.camera.MediaType.PICTURE
        };
        this.camera.getPicture(options).then(function (imageData) {
            // imageData is either a base64 encoded string or a file URI
            // If it's base64:
            _this.selectedPhoto = _this.dataURItoBlob('data:image/jpeg;base64,' + imageData);
            _this.upload();
        }, function (err) {
            _this.avatarInput.nativeElement.click();
            // Handle error
        });
    };
    AccountPage.prototype.uploadFromFile = function (event) {
        var _this = this;
        var files = event.target.files;
        console.log('Uploading', files);
        var reader = new FileReader();
        reader.readAsDataURL(files[0]);
        reader.onload = function () {
            _this.selectedPhoto = _this.dataURItoBlob(reader.result);
            _this.upload();
        };
        reader.onerror = function (error) {
            alert('Unable to load file. Please try another.');
        };
    };
    AccountPage.prototype.upload = function () {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Uploading image...'
        });
        loading.present();
        if (this.selectedPhoto) {
            this.s3.upload({
                'Key': 'protected/' + this.sub + '/avatar',
                'Body': this.selectedPhoto,
                'ContentType': 'image/jpeg'
            }).promise().then(function (data) {
                _this.refreshAvatar();
                console.log('upload complete:', data);
                loading.dismiss();
            }, function (err) {
                console.log('upload failed....', err);
                loading.dismiss();
            });
        }
        loading.dismiss();
    };
    return AccountPage;
}());
__decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_13" /* ViewChild */])('avatar'),
    __metadata("design:type", Object)
], AccountPage.prototype, "avatarInput", void 0);
AccountPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-account',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/account/account.html"*/'<ion-header>\n  <ion-navbar>\n    <ion-title>\n      Account\n    </ion-title>\n  </ion-navbar>\n</ion-header>\n\n<ion-content padding>\n\n  <div padding text-center>\n    <div *ngIf="avatarPhoto" class="avatar" [style.background-image]="\'url(\'+ avatarPhoto +\')\'">\n    </div>\n\n    <button ion-button clear (click)="selectAvatar()">Change photo</button>\n\n    <input #avatar class="avatar-input" type="file" (change)="uploadFromFile($event)" />\n  </div>\n\n  <div>\n    <ion-list>\n      <ion-item>\n        <strong>username</strong> {{ user.getUser().getUsername() }}\n      </ion-item>\n      <ion-item *ngFor="let attr of attributes">\n        <strong>{{ attr.getName() }}</strong> {{ attr.getValue() }}\n      </ion-item>\n    </ion-list>\n  </div>\n\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/account/account.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */],
        __WEBPACK_IMPORTED_MODULE_3__providers_providers__["c" /* User */],
        __WEBPACK_IMPORTED_MODULE_3__providers_providers__["b" /* DynamoDB */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["b" /* Config */],
        __WEBPACK_IMPORTED_MODULE_2__ionic_native_camera__["a" /* Camera */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */]])
], AccountPage);

//# sourceMappingURL=account.js.map

/***/ }),

/***/ 203:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return TasksPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__tasks_create_tasks_create__ = __webpack_require__(204);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__providers_providers__ = __webpack_require__(41);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var TasksPage = (function () {
    function TasksPage(navCtrl, modalCtrl, user, db) {
        this.navCtrl = navCtrl;
        this.modalCtrl = modalCtrl;
        this.user = user;
        this.db = db;
        this.taskTable = 'ionic-mobile-hub-tasks';
        this.refreshTasks();
    }
    TasksPage.prototype.refreshData = function (refresher) {
        this.refresher = refresher;
        this.refreshTasks();
    };
    TasksPage.prototype.refreshTasks = function () {
        var _this = this;
        this.db.getDocumentClient().query({
            'TableName': this.taskTable,
            'IndexName': 'DateSorted',
            'KeyConditionExpression': "#userId = :userId",
            'ExpressionAttributeNames': {
                '#userId': 'userId',
            },
            'ExpressionAttributeValues': {
                ':userId': AWS.config.credentials.identityId
            },
            'ScanIndexForward': false
        }).promise().then(function (data) {
            _this.items = data.Items;
            if (_this.refresher) {
                _this.refresher.complete();
            }
        }).catch(function (err) {
            console.log(err);
        });
    };
    TasksPage.prototype.generateId = function () {
        var len = 16;
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var charLength = chars.length;
        var result = "";
        var randoms = window.crypto.getRandomValues(new Uint32Array(len));
        for (var i = 0; i < len; i++) {
            result += chars[randoms[i] % charLength];
        }
        return result.toLowerCase();
    };
    TasksPage.prototype.addTask = function () {
        var _this = this;
        var id = this.generateId();
        var addModal = this.modalCtrl.create(__WEBPACK_IMPORTED_MODULE_2__tasks_create_tasks_create__["a" /* TasksCreatePage */], { 'id': id });
        addModal.onDidDismiss(function (item) {
            if (item) {
                item.userId = AWS.config.credentials.identityId;
                item.created = (new Date().getTime() / 1000);
                _this.db.getDocumentClient().put({
                    'TableName': _this.taskTable,
                    'Item': item,
                    'ConditionExpression': 'attribute_not_exists(id)'
                }, function (err, data) {
                    if (err) {
                        console.log(err);
                    }
                    _this.refreshTasks();
                });
            }
        });
        addModal.present();
    };
    TasksPage.prototype.deleteTask = function (task, index) {
        var _this = this;
        this.db.getDocumentClient().delete({
            'TableName': this.taskTable,
            'Key': {
                'userId': AWS.config.credentials.identityId,
                'taskId': task.taskId
            }
        }).promise().then(function (data) {
            _this.items.splice(index, 1);
        }).catch(function (err) {
            console.log('there was an error', err);
        });
    };
    return TasksPage;
}());
TasksPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-tasks',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tasks/tasks.html"*/'<ion-header>\n  <ion-navbar>\n    <ion-title>\n      Tasks \n    </ion-title>\n    <ion-buttons end>\n      <button ion-button icon-only (click)="addTask()">\n        <ion-icon name="add"></ion-icon>\n      </button>\n    </ion-buttons>\n  </ion-navbar>\n</ion-header>\n\n<ion-content>\n  <ion-refresher (ionRefresh)="refreshData($event)">\n    <ion-refresher-content\n                  pullingIcon="arrow-dropdown"\n                  pullingText="Pull to refresh"\n                  refreshingSpinner="circles"\n                  refreshingText="Refreshing...">\n    </ion-refresher-content>\n  </ion-refresher>\n\n    <ion-list>\n      <ion-item-sliding *ngFor="let item of items; let idx = index;">\n        <button ion-item>\n          <h2>{{item.category}}</h2>\n          <p>{{item.description}}</p>\n        </button>\n\n        <ion-item-options>\n          <button ion-button color="danger" (click)="deleteTask(item, idx)">DELETE</button>\n        </ion-item-options>\n      </ion-item-sliding>\n    </ion-list>\n</ion-content>\n\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tasks/tasks.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["g" /* ModalController */],
        __WEBPACK_IMPORTED_MODULE_3__providers_providers__["c" /* User */],
        __WEBPACK_IMPORTED_MODULE_3__providers_providers__["b" /* DynamoDB */]])
], TasksPage);

//# sourceMappingURL=tasks.js.map

/***/ }),

/***/ 204:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return TasksCreatePage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var TasksCreatePage = (function () {
    function TasksCreatePage(navCtrl, navParams, viewCtrl, platform) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.viewCtrl = viewCtrl;
        this.platform = platform;
        this.isAndroid = platform.is('android');
        this.item = {
            'taskId': navParams.get('id'),
            'category': 'Todo'
        };
        this.isReadyToSave = true;
    }
    TasksCreatePage.prototype.ionViewDidLoad = function () {
    };
    TasksCreatePage.prototype.cancel = function () {
        this.viewCtrl.dismiss();
    };
    TasksCreatePage.prototype.done = function () {
        this.viewCtrl.dismiss(this.item);
    };
    return TasksCreatePage;
}());
TasksCreatePage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-tasks-create',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tasks-create/tasks-create.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-title>New Task</ion-title>\n    <ion-buttons end>\n      <button ion-button [attr.icon-only]="!isAndroid ? null : \'\'" (click)="cancel()">\n        <span color="primary" showWhen="ios">\n          Cancel\n        </span>\n        <ion-icon name="md-close" showWhen="core,android,windows"></ion-icon>\n      </button>\n    </ion-buttons>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content>\n  <ion-list>\n    <ion-item>\n      <ion-label>Category</ion-label>\n      <ion-select [(ngModel)]="item.category" name="category">\n        <ion-option value="todo" selected="true">Todo</ion-option>\n        <ion-option value="errand">Errand</ion-option>\n      </ion-select>\n    </ion-item>\n\n    <ion-item class="custom-item">\n      <ion-label>Task Description</ion-label>\n      <ion-textarea rows="5" [(ngModel)]="item.description" name="description"></ion-textarea>\n    </ion-item>\n\n    <div padding>\n      <button block icon-start ion-button color="primary" (click)="done()"><ion-icon name="md-checkmark" showWhen="core,android,windows"></ion-icon>Create task</button>\n    </div>\n  </ion-list>\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/tasks-create/tasks-create.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavParams */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["k" /* ViewController */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* Platform */]])
], TasksCreatePage);

//# sourceMappingURL=tasks-create.js.map

/***/ }),

/***/ 205:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__ = __webpack_require__(206);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__app_module__ = __webpack_require__(224);


Object(__WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_1__app_module__["a" /* AppModule */]);
//# sourceMappingURL=main.js.map

/***/ }),

/***/ 224:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_platform_browser__ = __webpack_require__(29);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__ionic_native_camera__ = __webpack_require__(193);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__app_component__ = __webpack_require__(273);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__pages_login_login__ = __webpack_require__(39);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__pages_signup_signup__ = __webpack_require__(198);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__pages_confirm_confirm__ = __webpack_require__(103);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__pages_settings_settings__ = __webpack_require__(197);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__pages_about_about__ = __webpack_require__(201);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__pages_account_account__ = __webpack_require__(202);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__pages_tabs_tabs__ = __webpack_require__(102);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__pages_tasks_tasks__ = __webpack_require__(203);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13__pages_tasks_create_tasks_create__ = __webpack_require__(204);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_14__ionic_native_status_bar__ = __webpack_require__(195);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_15__ionic_native_splash_screen__ = __webpack_require__(196);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_16__providers_user__ = __webpack_require__(40);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_17__providers_aws_cognito__ = __webpack_require__(199);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_18__providers_aws_dynamodb__ = __webpack_require__(200);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



















var AppModule = (function () {
    function AppModule() {
    }
    return AppModule;
}());
AppModule = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["L" /* NgModule */])({
        declarations: [
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* MyApp */],
            __WEBPACK_IMPORTED_MODULE_5__pages_login_login__["a" /* LoginPage */],
            __WEBPACK_IMPORTED_MODULE_6__pages_signup_signup__["a" /* SignupPage */],
            __WEBPACK_IMPORTED_MODULE_7__pages_confirm_confirm__["a" /* ConfirmPage */],
            __WEBPACK_IMPORTED_MODULE_8__pages_settings_settings__["a" /* SettingsPage */],
            __WEBPACK_IMPORTED_MODULE_9__pages_about_about__["a" /* AboutPage */],
            __WEBPACK_IMPORTED_MODULE_10__pages_account_account__["a" /* AccountPage */],
            __WEBPACK_IMPORTED_MODULE_11__pages_tabs_tabs__["a" /* TabsPage */],
            __WEBPACK_IMPORTED_MODULE_12__pages_tasks_tasks__["a" /* TasksPage */],
            __WEBPACK_IMPORTED_MODULE_13__pages_tasks_create_tasks_create__["a" /* TasksCreatePage */]
        ],
        imports: [
            __WEBPACK_IMPORTED_MODULE_1__angular_platform_browser__["a" /* BrowserModule */],
            __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["e" /* IonicModule */].forRoot(__WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* MyApp */])
        ],
        bootstrap: [__WEBPACK_IMPORTED_MODULE_2_ionic_angular__["c" /* IonicApp */]],
        entryComponents: [
            __WEBPACK_IMPORTED_MODULE_4__app_component__["a" /* MyApp */],
            __WEBPACK_IMPORTED_MODULE_5__pages_login_login__["a" /* LoginPage */],
            __WEBPACK_IMPORTED_MODULE_6__pages_signup_signup__["a" /* SignupPage */],
            __WEBPACK_IMPORTED_MODULE_7__pages_confirm_confirm__["a" /* ConfirmPage */],
            __WEBPACK_IMPORTED_MODULE_8__pages_settings_settings__["a" /* SettingsPage */],
            __WEBPACK_IMPORTED_MODULE_9__pages_about_about__["a" /* AboutPage */],
            __WEBPACK_IMPORTED_MODULE_10__pages_account_account__["a" /* AccountPage */],
            __WEBPACK_IMPORTED_MODULE_11__pages_tabs_tabs__["a" /* TabsPage */],
            __WEBPACK_IMPORTED_MODULE_12__pages_tasks_tasks__["a" /* TasksPage */],
            __WEBPACK_IMPORTED_MODULE_13__pages_tasks_create_tasks_create__["a" /* TasksCreatePage */]
        ],
        providers: [
            __WEBPACK_IMPORTED_MODULE_14__ionic_native_status_bar__["a" /* StatusBar */],
            __WEBPACK_IMPORTED_MODULE_15__ionic_native_splash_screen__["a" /* SplashScreen */],
            { provide: __WEBPACK_IMPORTED_MODULE_0__angular_core__["v" /* ErrorHandler */], useClass: __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["d" /* IonicErrorHandler */] },
            __WEBPACK_IMPORTED_MODULE_3__ionic_native_camera__["a" /* Camera */],
            __WEBPACK_IMPORTED_MODULE_16__providers_user__["a" /* User */],
            __WEBPACK_IMPORTED_MODULE_17__providers_aws_cognito__["a" /* Cognito */],
            __WEBPACK_IMPORTED_MODULE_18__providers_aws_dynamodb__["a" /* DynamoDB */]
        ]
    })
], AppModule);

AWS.config.customUserAgent = AWS.config.customUserAgent + ' Ionic';
//# sourceMappingURL=app.module.js.map

/***/ }),

/***/ 273:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MyApp; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_native_status_bar__ = __webpack_require__(195);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__ionic_native_splash_screen__ = __webpack_require__(196);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__pages_tabs_tabs__ = __webpack_require__(102);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__pages_login_login__ = __webpack_require__(39);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__providers_user__ = __webpack_require__(40);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var MyApp = (function () {
    function MyApp(platform, statusBar, splashScreen, user, config) {
        var _this = this;
        this.config = config;
        this.rootPage = null;
        var globalActions = function () {
            // Okay, so the platform is ready and our plugins are available.
            // Here you can do any higher level native things you might need.
            statusBar.styleDefault();
            splashScreen.hide();
        };
        platform.ready().then(function () {
            user.isAuthenticated().then(function () {
                console.log('you are authenticated!');
                _this.rootPage = __WEBPACK_IMPORTED_MODULE_4__pages_tabs_tabs__["a" /* TabsPage */];
                globalActions();
            }).catch(function () {
                console.log('you are not authenticated..');
                _this.rootPage = __WEBPACK_IMPORTED_MODULE_5__pages_login_login__["a" /* LoginPage */];
                globalActions();
            });
        });
    }
    return MyApp;
}());
MyApp = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/app/app.html"*/'<ion-nav [root]="rootPage"></ion-nav>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/app/app.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* Platform */], __WEBPACK_IMPORTED_MODULE_2__ionic_native_status_bar__["a" /* StatusBar */], __WEBPACK_IMPORTED_MODULE_3__ionic_native_splash_screen__["a" /* SplashScreen */], __WEBPACK_IMPORTED_MODULE_6__providers_user__["a" /* User */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["b" /* Config */]])
], MyApp);

//# sourceMappingURL=app.component.js.map

/***/ }),

/***/ 39:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* unused harmony export LoginDetails */
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return LoginPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__tabs_tabs__ = __webpack_require__(102);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__signup_signup__ = __webpack_require__(198);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__confirm_confirm__ = __webpack_require__(103);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__providers_providers__ = __webpack_require__(41);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var LoginDetails = (function () {
    function LoginDetails() {
    }
    return LoginDetails;
}());

var LoginPage = (function () {
    function LoginPage(navCtrl, user, loadingCtrl) {
        this.navCtrl = navCtrl;
        this.user = user;
        this.loadingCtrl = loadingCtrl;
        this.loginDetails = new LoginDetails();
    }
    LoginPage.prototype.login = function () {
        var _this = this;
        var loading = this.loadingCtrl.create({
            content: 'Please wait...'
        });
        loading.present();
        var details = this.loginDetails;
        console.log('login..');
        this.user.login(details.username, details.password).then(function (result) {
            console.log('result:', result);
            loading.dismiss();
            _this.navCtrl.setRoot(__WEBPACK_IMPORTED_MODULE_2__tabs_tabs__["a" /* TabsPage */]);
        }).catch(function (err) {
            if (err.message === "User is not confirmed.") {
                loading.dismiss();
                _this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_4__confirm_confirm__["a" /* ConfirmPage */], { 'username': details.username });
            }
            console.log('errrror', err);
            loading.dismiss();
        });
    };
    LoginPage.prototype.signup = function () {
        this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_3__signup_signup__["a" /* SignupPage */]);
    };
    return LoginPage;
}());
LoginPage = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["n" /* Component */])({
        selector: 'page-login',template:/*ion-inline-start:"/Users/lawrence/github/cea/frontend/agility360/src/pages/login/login.html"*/'<ion-content>\n  <div text-center class="logo">\n    <img src="assets/ionic-aws-logo.png" />\n  </div>\n  <form (submit)="login()">\n    <ion-list>\n\n      <ion-item>\n        <ion-label floating>Username</ion-label>\n        <ion-input [(ngModel)]="loginDetails.username" type="text" autocorrect="off" autocapitalize="none" name="username"></ion-input>\n      </ion-item>\n\n      <ion-item>\n        <ion-label floating>Password</ion-label>\n        <ion-input [(ngModel)]="loginDetails.password" type="password" name="password"></ion-input>\n      </ion-item>\n\n      <div padding>\n        <button ion-button color="primary" block>LOGIN</button>\n      </div>\n\n      <div padding text-center>\n        <p>Don\'t have an account yet? <a (click)="signup()">Create one.</a></p>\n      </div>\n\n    </ion-list>\n  </form>\n</ion-content>\n'/*ion-inline-end:"/Users/lawrence/github/cea/frontend/agility360/src/pages/login/login.html"*/
    }),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* NavController */],
        __WEBPACK_IMPORTED_MODULE_5__providers_providers__["c" /* User */],
        __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */]])
], LoginPage);

//# sourceMappingURL=login.js.map

/***/ }),

/***/ 40:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return User; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(13);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__providers__ = __webpack_require__(41);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var User = (function () {
    function User(cognito, config) {
        this.cognito = cognito;
        this.config = config;
        this.loggedIn = false;
        this.user = null;
    }
    User.prototype.getUser = function () {
        return this.user;
    };
    User.prototype.getUsername = function () {
        return this.getUser().getUsername();
    };
    User.prototype.login = function (username, password) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var user = _this.cognito.makeUser(username);
            var authDetails = _this.cognito.makeAuthDetails(username, password);
            user.authenticateUser(authDetails, {
                'onSuccess': function (result) {
                    var logins = {};
                    var loginKey = 'cognito-idp.' +
                        aws_cognito_region +
                        '.amazonaws.com/' +
                        aws_user_pools_id;
                    logins[loginKey] = result.getIdToken().getJwtToken();
                    AWS.config.credentials = new AWS.CognitoIdentityCredentials({
                        'IdentityPoolId': aws_cognito_identity_pool_id,
                        'Logins': logins
                    });
                    _this.isAuthenticated().then(function () {
                        resolve();
                    }).catch(function (err) {
                        console.log('auth session failed');
                    });
                },
                'onFailure': function (err) {
                    console.log('authentication failed');
                    reject(err);
                }
            });
        });
    };
    User.prototype.logout = function () {
        this.user = null;
        this.cognito.getUserPool().getCurrentUser().signOut();
    };
    User.prototype.register = function (username, password, attr) {
        var _this = this;
        var attributes = [];
        for (var x in attr) {
            attributes.push(this.cognito.makeAttribute(x, attr[x]));
        }
        return new Promise(function (resolve, reject) {
            _this.cognito.getUserPool().signUp(username, password, attributes, null, function (err, result) {
                if (err) {
                    reject(err);
                }
                else {
                    resolve(result.user);
                }
            });
        });
    };
    User.prototype.confirmRegistration = function (username, code) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var user = _this.cognito.makeUser(username);
            user.confirmRegistration(code, true, function (err, result) {
                if (err) {
                    console.log('could not confirm user', err);
                    reject(err);
                }
                else {
                    resolve(result);
                }
            });
        });
    };
    User.prototype.resendRegistrationCode = function (username) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var user = _this.cognito.makeUser(username);
            user.resendConfirmationCode(function (err, result) {
                if (err) {
                    console.log('could not resend code..', err);
                    reject(err);
                }
                else {
                    resolve();
                }
            });
        });
    };
    User.prototype.isAuthenticated = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var user = _this.cognito.getCurrentUser();
            if (user != null) {
                user.getSession(function (err, session) {
                    if (err) {
                        console.log('rejected session');
                        reject();
                    }
                    else {
                        console.log('accepted session');
                        var logins = {};
                        var loginKey = 'cognito-idp.' +
                            aws_cognito_region +
                            '.amazonaws.com/' +
                            aws_user_pools_id;
                        logins[loginKey] = session.getIdToken().getJwtToken();
                        AWS.config.credentials = new AWS.CognitoIdentityCredentials({
                            'IdentityPoolId': aws_cognito_identity_pool_id,
                            'Logins': logins
                        });
                        _this.user = user;
                        resolve();
                    }
                });
            }
            else {
                reject();
            }
        });
    };
    return User;
}());
User = __decorate([
    Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["B" /* Injectable */])(),
    __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_2__providers__["a" /* Cognito */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["b" /* Config */]])
], User);

//# sourceMappingURL=user.js.map

/***/ }),

/***/ 41:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__aws_cognito__ = __webpack_require__(199);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__aws_dynamodb__ = __webpack_require__(200);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__user__ = __webpack_require__(40);
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return __WEBPACK_IMPORTED_MODULE_0__aws_cognito__["a"]; });
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "b", function() { return __WEBPACK_IMPORTED_MODULE_1__aws_dynamodb__["a"]; });
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "c", function() { return __WEBPACK_IMPORTED_MODULE_2__user__["a"]; });




//# sourceMappingURL=providers.js.map

/***/ })

},[205]);
//# sourceMappingURL=main.js.map