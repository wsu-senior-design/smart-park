import React from "react" 
import { Link } from "react-router-dom"
import "./css/Navbar.css"

function Navbar() {
    return (
        <div className="nav-wrapper">
            <div id="logo"><Link to="/"><img src={require("../images/logo.png")} alt="car" /></Link></div>
            <nav>
                <ul>
                    <li className="active"><Link to="/">"HOME"</Link></li>
                    <li><Link to="/about">"ABOUT"</Link></li>
                    <li><Link to="/data">"PARKING DATA"</Link></li>
                    <li><Link to="/contact">"CONTACT"</Link></li>
                </ul>  
            </nav>  
        </div>
    )
}

export default Navbar
