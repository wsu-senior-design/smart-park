import React from "react" 
import { Link } from "react-router-dom"
import "./css/Navbar.css"

function Navbar() {
    return (
        <div className="nav-wrapper">
            <div id="logo"><Link to="/"><img src={require("../images/logo.png")} alt="car" /></Link></div>
            <nav>
                <ul>
                    <li className="active"><Link to="/">Home</Link></li>
                    <li><Link to="/about">About</Link></li>
                    <li><Link to="/data">Parking data</Link></li>
                    <li><Link to="/contact">Contact</Link></li>
                </ul>  
            </nav>  
        </div>
    )
}

export default Navbar
