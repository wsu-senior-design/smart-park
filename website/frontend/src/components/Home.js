import React, { useEffect} from 'react';
import "./css/Home.css";
import { Link } from "react-router-dom";


function Home() {
    return (
        <div className="wrapper">
            <div className="background-pic"></div> 
            <div className="middle-content">
                <h1>We are Smart Park </h1>
                <p>a short description text here</p>
                <div className="btn-container">
                    <Link to="/about"><button className="btn btn1">Learn more</button></Link>
                    <button className="btn btn2">Download</button>
                </div>
            </div>
        </div>
    )
}

export default Home
