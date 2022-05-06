import React, { useEffect} from 'react';
import "./css/Home.css";
import { Link } from "react-router-dom";
import Typewriter from "typewriter-effect";


function Home() {
    return (
        <div className="wrapper">
            <div className="background-pic">
                <div className="middle-content">
                    <h1>Smart Park</h1>
                    <div className="sub-heading">  
                        <span>Making your parking experience </span>
                        <Typewriter
                          options={{
                            strings: ['easy', 'fast', 'simple'],
                            autoStart: true,
                            loop: true,
                            deleteSpeed: 50,
                            cursor: '_'
                          }}
                        />        
                    </div>
                    <div className="btn-container">
                        <Link to="/about"><button className="btn btn1">Learn more</button></Link><Link to="/contact"><button className="btn btn2">Contact Us</button></Link>
                    </div>
                </div>
            </div> 
        </div>
    )
}

export default Home
