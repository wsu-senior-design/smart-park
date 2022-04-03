import React from 'react';
import "./css/Data.css";

function Data() {
    return (
        <div className="data-wrapper">
            <section className="time-data">
                <h1> This section will include the time the users stay on that parking lot.</h1>
                <h1>It will also calculate the busiest time of the day</h1>
            </section>
            <section className="heat-map">
                <h1>Heat map section</h1>
            </section>
            <section className="afterhour-usage">
                <h1>Afterhours usage</h1>
            </section>
            <section className="power comsumption">
                <h1>Power comsumption</h1>
            </section>
            <section>
                <h1>verage signal integrity of sensors</h1>
            </section>
        </div> 
    )
}

export default Data