import { Component } from '@angular/core';
import {  NavController, NavParams } from 'ionic-angular';

/**
 * Generated class for the NetworkInfoPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */


@Component({
  selector: 'page-network-info',
  templateUrl: 'network-info.html',
})
export class NetworkInfoPage {

  ipAddress: any;
  ipAddressStr: String;
  cidr: String;
  mask: String;
  maskStr: String;
  broadcasrIp: String;
  networkIp: String;
  numOfSubnets: Number;
  numOfHosts: Number;

  constructor(public navCtrl: NavController, public navParams: NavParams) 
  {
  }

  convertStrIpToIntArr(ipStr)
  {
      let ipArray = ipStr.split(".", 4);
      return ipArray
  }

  convertIpIntArrToString(ipArr)
  {
    let ip = ipArr.join(".");
    return ip;
  }

    /*
    * Usage: Apply a NOT Bitwise operation an array of integers
    * Example: [192, 168, 0, 0] --> [63, 87, 255, 255]
    * Input: [Int]
    * Output: [Int]
    */
    negateIpAddress(ipAddress) 
    {
        var negatedIpAddress = [0,0,0,0]
        
        for (var i = 0; i < 4 ; i++)
        {
            negatedIpAddress[i] = ~ipAddress[i] + 256;
        }
        
        return negatedIpAddress
    }

    /*
    * Usage: Calculate the network IP address
    * Formula: Network IP address = ( IP Address ) AND ( Mask IP Address )
    * Input: [Int]
    * Output: [Int]
    */
    calculateNetWorkIpAddress(ipAddress, maskIpAddress)
    {
        var networkIpAddress = [0,0,0,0]
        
        for (var i = 0; i < 4 ; i++)
        {
          networkIpAddress[i] = ipAddress[i] & maskIpAddress[i];
        }

        return networkIpAddress
    }


      /*
    * Usage: Calculate the Broadcasr IP address
    * Formula: Broadcast IP address = ( IP Address ) OR ( NOT ( Mask IP Address ))
    * Input: [Int]
    * Output: [Int]
    */
    calculateBroadcastIpAddress(ipAddress , maskIpAddress)
    {
        var broadcastIpAddress = [0,0,0,0]
        
        // get the complement of the mask ip
        let notMaskIpAddress = this.negateIpAddress(maskIpAddress)
        
        for (var i = 0; i < 4 ; i++)
        {
            broadcastIpAddress[i] = ipAddress[i] | notMaskIpAddress[i] // OR BitWise OPs
        }
        
        return broadcastIpAddress
    }

    /*
     * Usage: Calculate the number of subnets
     * Formula: 2 ^ (32 - cidr)
     * Input: Int
     * Output: Int
     */
    getNumOfSubnets(cidr) 
    {
        return Math.pow(2, 32 - cidr);
    }
    
    /*
     * Usage: Calculate the number of hosts
     * Formula: (2 ^ (32 - cidr)) -2
     * Input: Int
     * Output: Int
     */
    getNumOfHosts(cidr)
    {
        return this.getNumOfSubnets( cidr) - 2;
    }


  /*
    * Usage: Map the cidr prefix to an IP address (it's static 1-to-1 mapping that never chanages)
    * Input: String
    * Output: String
    */
  getSubnetMaskIpAddressFromCidr(cird)
  {
      switch (cird)
      {
      case "8":
          return "255.0.0.0"
      case "9":
          return "255.128.0.0"
      case "10":
          return "255.192.0.0"
      case "11":
          return "255.224.0.0"
      case "12":
          return "255.240.0.0"
      case "13":
          return "255.248.0.0"
      case "14":
          return "255.252.0.0"
      case "15":
          return "255.254.0.0"
      case "16":
          return "255.255.0.0"
      case "17":
          return "255.255.128.0"
      case "18":
          return "255.255.192.0"
      case "19":
          return "255.255.224.0"
      case "20":
          return "255.255.240.0"
      case "21":
          return "255.255.248.0"
      case "22":
          return "255.255.252.0"
      case "23":
          return "255.255.254.0"
      case "24":
          return "255.255.255.0"
      case "25":
          return "255.255.255.128"
      case "26":
          return "255.255.255.192"
      case "27":
          return "255.255.255.224"
      case "28":
          return "255.255.255.240"
      case "29":
          return "255.255.255.248"
      case "30":
          return "255.255.255.252"
      default:
          return "0.0.0.0"
      }
  }
    
  ionViewDidLoad() 
  {
    console.log('ionViewDidLoad NetworkInfoPage');
    this.ipAddressStr = this.navParams.get('ip') + " \\";
    this.cidr = this.navParams.get('cidr');
    this.ipAddress = this.convertStrIpToIntArr(this.navParams.get('ip'));
    console.log(this.ipAddress);

    this.mask = this.convertStrIpToIntArr(this.getSubnetMaskIpAddressFromCidr(this.navParams.get('cidr')));
    console.log(this.mask);

    this.maskStr = this.convertIpIntArrToString(this.mask);
    console.log(this.maskStr);

    console.log(this.convertIpIntArrToString(this.ipAddress));

    this.networkIp = this.convertIpIntArrToString(this.calculateNetWorkIpAddress(this.ipAddress, this.mask));
    console.log(this.networkIp);

    this.broadcasrIp = this.convertIpIntArrToString(this.calculateBroadcastIpAddress(this.ipAddress, this.mask));
    console.log(this.broadcasrIp);

    this.numOfSubnets = this.getNumOfSubnets(this.navParams.get('cidr'));
    console.log("# subnets:", this.numOfSubnets);

    this.numOfHosts = this.getNumOfHosts(this.navParams.get('cidr'));
    console.log("# hosts:", this.numOfHosts);
  }



}
