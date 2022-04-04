import React from "react";
import './css/Contact.css';

function Contact(){
    return (
        <div class="contact-container">
          <div class="top">
            <div><input type="text" className="name" placeholder="Enter your name"></input></div>
            <div><input type="text" className="email" placeholder="Enter your email"></input></div>
            <div><input type="text" className="message" placeholder="Enter your message"></input></div>
            <button type="submit">Submit</button>
          </div>
          <div class="bottom">
            <h1>Get in touch!</h1>
            <h2>Hi there! We look forward to connecting with you!</h2>
            <h3>If you would like to get in touch please contact us at smartpark@sp.com or fill out the contact form displayed on your screen. </h3>
           </div>
          <div class="map">
          <img src="https://wichitastate.myuvn.com/wp-content/uploads/sites/10/2019/07/WichitaMap.png" class="maps"></img>
          </div>
        </div> 
      );
}

export default Contact;