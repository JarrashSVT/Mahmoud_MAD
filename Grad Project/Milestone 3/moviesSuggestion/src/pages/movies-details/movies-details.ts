import { Component } from '@angular/core';
import {  NavController, NavParams } from 'ionic-angular';
import { MoviesService } from '../../app/services/movies.service'

/**
 * Generated class for the MoviesDetailsPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.@IonicPage()
 */


@Component({
  selector: 'page-movies-details',
  templateUrl: 'movies-details.html',
})
export class MoviesDetailsPage 
{
   movieTitle: String;
   movie: any = [];
   test: String = "Test";
  constructor(public navCtrl: NavController, public navParams: NavParams, public moviesService: MoviesService) 
  {
   // this.test = "WTF";
  }

  ionViewDidLoad() 
  {
    console.log('ionViewDidLoad MoviesDetailsPage');
    this.movieTitle = this.navParams.get('movieTitle');
    console.log(this.movieTitle);
    this.getMoviesDetailsFormApi(this.movieTitle);
  }

  getMoviesDetailsFormApi(title)
  {
    console.log( "getMoviesDetailsFormApi", title);
    this.moviesService.getMovieDetails(title).subscribe(response => {
     // console.log("response", response);
     this.movie = response;
      console.log("movie", this.movie);
      
    });
    
  }
}
