import React, { useState } from "react";
import { Bar } from "react-chartjs-2";
import { PCUserData } from "./ChartData";
// eslint-disable-next-line no-unused-vars
import { Chart as ChartJS } from "chart.js/auto";

function BarChart({ chartData }) {
  return <Bar data={chartData} />;
}

function PowerCompChart() {
  const [userData] = useState({
    labels: PCUserData.map((data) => data.Day),
    datasets: [
      {
        label: "Spot #1: Power Consumption",
        data: PCUserData.map((data) => data.Power),
        backgroundColor: [
          "rgba(75,192,192,1)",
          "#ecf0f1",
          "#50AF95",
          "#f3ba2f",
          "#2a71d0",
        ],
        borderColor: "black",
        borderWidth: 2,
      },
    ],
  });

  
  return (
    <div>
      <div style={{ width: 700 }}>
        <BarChart chartData={userData} 
        options={{
          title:{
            display:true,
            text:'Power Consumption',
            fontSize:20
          },
          scales: {
            x: [{
              title: {
                display: true,
                text: 'Days'             
              } 
            }],
            y:{
              title: {
                  display: true,
                  text: 'Total Time Filled (minutes)',        
              }         
            }         
          },
          legend:{
            display:true,
            position:'right'
          }
        }}
        />
      </div>
    
    </div>
  );
}

export default PowerCompChart;
