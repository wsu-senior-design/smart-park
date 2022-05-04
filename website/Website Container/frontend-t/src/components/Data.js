import React, { useState } from 'react';
import "./css/Data.css";
import { Bar } from "react-chartjs-2";

function Data() {
    const infos = ["Introduction", "Average duration", "Day activity", "Power consumption"];
    const [active, setActive] = useState(0);
    function changeActive(index) {
        setActive(index);
    }
    let content = infos.map((info, index) => {
        if(index == active){
            return (
                <li 
                    key={index}
                    className="data-active"
                    onClick={() => changeActive(index)}
                >
                {info}
                </li>  
            )
        }
        else {
          return (
                <li key={index} onClick={() => changeActive(index)}>
                {info}
                </li>
          )  
        }
    });
    return (
        <div className="data-wrapper">
            <div className="data-body-wrapper">
                <div className="data-nav-sidebar">
                    <div className="data-nav">
                        <ul>
                            {content}
                        </ul>
                    </div>
                </div>
                <div className="data-content-wrapper">
                    <DataContent value={active} />
                </div>
            </div>
        </div> 
    )
}
export default Data

function DataContent (props) {
    if(props.value == 0){
        return (
            <IntoContent />
        )
    }
    else if(props.value == 1){
        return (
            <HeatMapContent />
        )        
    }
    else if(props.value == 2){
        return (
            <AcitivityContent />
        )
    }
    else if(props.value == 3){
        return (
            <PowerConsumptionContent />
        )        
    }
    else {
        return <h1>Incorrect</h1>
    }
}

function IntoContent (props) {
    return (
        <div className="intro-content">
            <h1>Introduction</h1>
            <div className="intro-content-inner">
                <p>In the recent years, data mining has became an essential process for any growing company. It allows the company to optimize and predict their model to help improve their overall product. Data mining is an important ingredient for success in our current competitive market. Our team smart park put together all the information that we thought be useful for clients to see.</p>
                <p> We have provided a heatmap which shows ... </p>
                <p> We have an activity which shows ... </p>
                <p> we have a power consumption which shows .... </p>
            </div> 
        </div>
    )
}

function HeatMapContent (props) {
        return <h1>Heatmap</h1>
}

function AcitivityContent (props) {
         return <h1>Activity</h1>   
}

function PowerConsumptionContent (props) {
         return <h1>Consumption</h1>   
}
