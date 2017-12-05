import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { MoviesService } from '../../app/services/movies.service'
import { MoviesDetailsPage } from '../../pages/movies-details/movies-details'

@Component({
  selector: 'movies',
  templateUrl: 'movies.html'
})
export class MoviesPage {
    movies: any;
    mName: any;
    //mName = "The dark knight";
    //title = mName;
    constructor(public navCtrl: NavController , public moviesService: MoviesService) 
    {
        //this.navCtrl.push();
    }

    ngOnInit()
    {
        console.log("ngOnInit");
        //this.mName = this.mName;
        this.getMovies(this.mName, 0);
    }

    getMovies(title, limit)
    {
        console.log(title);
        this.moviesService.getMovies(title,0).subscribe(res =>{
            console.log("res...");
            console.log(res);
            this.movies = res.Similar.Results;
        }, 
        err => {
            console.log("err...");
            console.log(err)});
        /*
        this.moviesService.getMovies(title,limit).subscribe(response => {
            //this.getMovies(title, limit);
            console.log("@@@");
           // console.log(response);
            this.movies = response.Similar.Results;
        });
        */
    }

    goToMovieDetailsPage(title)
    {
        
        this.navCtrl.push(MoviesDetailsPage, {movieTitle : title});
        /*
        this.moviesService.getMovieDetails(title).subscribe(res => {
            console.log(res);
            this.navCtrl.push(MoviesDetailsPage, res);

        });
        */
    }

}
