import React from "react";
import "./css/About.css";

function about() {
    return (
        <div className="all">
            <div className="topHalf">
                <div className="aboutUs">
                    <h1>About Us</h1>
                </div>

                <div className="webAndGraph">
                    <div className="titleAndDes">
                        <h2 className="webTitle">
                            About the Website
                        </h2>

                        <div className="webDescription">
                            This website was implemented to give a more in depth background behind the project, its team members, data analytics, and a way to reach out to us for questions.
                        </div>
                    </div>

                    <img src={require("../images/graphs.jpeg")} className="graphs"></img>
                </div>

                <div className="appAndPhoto">
                    <img src={require("../images/appPicture.png")} className="appPicture"></img>

                    <div className="titleAndDes1">
                        <h2 className="appTitle">
                            About the App
                        </h2>

                        <div className="appDescription">
                            Smart Park is an application mainly implemented in school parking lots as well as parking lots for big events. The application will use a couple different sensors to tell whether a car is in a parking spot or not, then those sensors will communicate the data through a LoRa gateway and then to the backend and frontend of the application. The application will then show the user whether the spot is taken or not based on the color code, and people will be able to find open parking that way.
                        </div>
                    </div>
                </div>
            </div>

            <div className="bottomHalf">
                <div className="bottomHalf1">
                    <div className="team">
                        <h2>CS Team</h2>
                    </div>

                    <div className="pictures">
                        <ul className="ul1">
                            <li className="li1">
                                <img src={require("../images/phong.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Phong Vo</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/trong.jpg")} className="portraits"></img>
                                <h1 className="nameRole">Trong Van</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/tuan.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Tuan Nguyen</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/kevin.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Kevin Le</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/paulina.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Paulina Castaneda</h1>
                            </li>
                        </ul>
                    </div>

                    <div className="team">
                        <h2>EE Team</h2>
                    </div>

                    <div className="pictures">
                        <ul className="ul1">
                            <li className="li1">
                                <img src={require("../images/alex.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Alexander Chiem</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/damien.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Damian Avery</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/facebookuser.png")} className="portraits"></img>
                                <h1 className="nameRole">Martin Kariuki</h1>
                            </li>
                            <li className="li1">
                                <img src={require("../images/max.jpeg")} className="portraits"></img>
                                <h1 className="nameRole">Max Burrell</h1>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default about;