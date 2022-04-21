import React from "react";
import "./css/About.css";

function About() {
    return (
        <div className="entire-page">
            <div className="top-half">
                <h1 className="about-us">About Us</h1>

                <div className="website">
                    <div className="title-and-description">
                        <h2 className="web-title">About the Website</h2>
                        <p className="web-description">This website was implemented to give a more in
                            depth background behind the project, its team members, data analytics, and a 
                            way to reach out to us for questions.</p>
                    </div>

                    <img src="graphs.jpeg" className="graph"></img>
                </div>

                <div className="application">
                    <img src="app-picture.png" className="app-picture"></img>

                    <div className="title-and-description1">
                        <h2 className="app-title">About the App</h2>
                        <p className="app-description">Smart Park is an application mainly implemented 
                        in school parking lots as well as parking lots for big events. The application 
                        will use a couple different sensors to tell whether a car is in a parking spot 
                        or not, then those sensors will communicate the data through a LoRa gateway and 
                        then to the backend and frontend of the application. The application will then 
                        show the user whether the spot is taken or not based on the color code, and people 
                        will be able to find open parking that way.</p>
                    </div>
                </div>
            </div>

            <div className="bottom-half">
                <div className="bottom-half1">
                    <div className="team">CS Team</div>

                    <ul className="users">
                        <li>
                            <img src="phong.jpeg" className="portraits"></img>
                            <p className="name">Phong Vo</p>
                        </li>
                        <li>
                            <img src="trong.jpg" className="portraits"></img>
                            <p className="name">Trong Van</p>
                        </li>
                        <li>
                            <img src="tuan.jpeg" className="portraits"></img>
                            <p className="name">Tuan Nguyen</p>
                        </li>
                        <li>
                            <img src="kevin.jpeg" className="portraits"></img>
                            <p className="name">Kevin Le</p>
                        </li>
                        <li>
                            <img src="paulina.jpeg" className="portraits"></img>
                            <p className="name">Paulina Castaneda</p>
                        </li>
                    </ul>

                    <div className="team">EE Team</div>

                    <ul className="users">
                        <li>
                            <img src="alex.jpeg" className="portraits"></img>
                            <p className="name">Alexander Chiem</p>
                        </li>
                        <li>
                            <img src="damien.jpeg" className="portraits"></img>
                            <p className="name">Damian Avery</p>
                        </li>
                        <li>
                            <img src="fb-user.png" className="portraits"></img>
                            <p className="name">Martin Kariuki</p>
                        </li>
                        <li>
                            <img src="max.jpeg" className="portraits"></img>
                            <p className="name">Max Burrell</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    );
}

export default About;