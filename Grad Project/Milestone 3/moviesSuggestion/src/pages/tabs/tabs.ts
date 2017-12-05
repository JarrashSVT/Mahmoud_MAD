import { Component } from '@angular/core';

import { AboutPage } from '../about/about';
import { SettingsPage } from '../settings/settings';
import { MoviesPage } from '../movies/movies';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = MoviesPage;
  tab2Root = SettingsPage;
  tab3Root = AboutPage;

  constructor() {

  }
}
