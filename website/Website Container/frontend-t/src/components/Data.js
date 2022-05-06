
import React, { useState } from 'react';
import "./css/Data.css";
import PowerCompChart from "./data_comp/PowerCompChart";
import TTChart from "./data_comp/TotalTimeChart";

function Data() {
    const infos = ["Introduction", "Day activity", "Power consumption"];
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
            <AcitivityContent />
        )
    }
    else if(props.value == 2){
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
                <p> The total time filled graph show sthe time (minutes) that a parking spot senses that is filled to reflect how power consumption might be affected. </p>
                <p> The power consumption graphs shows the total power consumption of the sensor throughout the week taking into consideration the status changes of the parking spot along with the idle time. </p>
            </div> 
        </div>
    )
}
function AcitivityContent (props) {
         return (
             <div class="activity-wrapper">
                <div class="y-axis-activity">
                    <span>Minutes</span>
                </div>
                <div class="activity-chart">
                    <TTChart /> 
                </div>
                <div class="x-axis-activity">
                    <span>Day</span>
                </div>
             </div>
         )
}

function PowerConsumptionContent (props) {
         return (
             <div class="power-wrapper-pc">
                <div class="y-axis-pc">
                    <span>mAh</span>
                </div>
                <div class="pc-chart">
                    <PowerCompChart /> 
                </div>
                <div class="x-axis-pc">
                    <span>Day</span>
                </div>
             </div>
         )
}
