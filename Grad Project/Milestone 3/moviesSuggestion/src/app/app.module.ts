import { NgModule, ErrorHandler } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { HttpModule} from '@angular/http';

import { AboutPage } from '../pages/about/about';
import { SettingsPage } from '../pages/settings/settings';
import { MoviesPage } from '../pages/movies/movies';
import { TabsPage } from '../pages/tabs/tabs';
import {ContactPage} from '../pages/contact/contact';
import {HomePage} from '../pages/home/home';
import { MoviesDetailsPage } from '../pages/movies-details/movies-details';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

@NgModule({
  declarations: [
    MyApp,
    AboutPage,
    MoviesPage,
    SettingsPage,
    TabsPage,
    MoviesDetailsPage,
    ContactPage,HomePage
  ],
  imports: [
    BrowserModule,
    HttpModule,
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    AboutPage,
    MoviesPage,
    SettingsPage,
    TabsPage,
    MoviesDetailsPage,
    ContactPage,HomePage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
