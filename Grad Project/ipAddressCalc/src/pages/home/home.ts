import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { NetworkInfoPage } from '../../pages/network-info/network-info';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  ipAddress: any;
  cidr: any;

  constructor(public navCtrl: NavController) {

  }


  getIp(ip)
  {
    alert(ip);
  }

  getNetworkInfo(ip, cidr)
  {
    this.navCtrl.push(NetworkInfoPage, {
      ip: ip,
      cidr: cidr
    });
  }
}
